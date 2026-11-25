set_option maxRecDepth 100000
/-
Exact certificates for the finite-field analogue (Section 17.15 of Riemann_Hypothesis_Li_and_Monotonicity.md).
For an L-polynomial L(T) = prod (1 - alpha_i T) of degree 2g over F_q, with power sums s_k = sum alpha_i^k (s_0 = 2g),
define the integer Toeplitz-like matrix  T'[j][l] = q^min(j,l) * s_|j-l|.   With z_i = alpha_i / sqrt q one has
x^T T' x = sum_i |P(z_i)|^2-type forms, so T' is positive semidefinite exactly when all |z_i| = 1 (Riemann hypothesis).
Here the explicit formula is an exact algebraic identity (Newton's identities), and everything below is exact integer arithmetic.

CHECKED (kernel, no axioms):
  * E5, G2_7  (real curves: y^2 = x^3+x+1 over F_5, y^2 = x^5+x+1 over F_7): the integer vectors "shifted reversed L" annihilate T',
    and the leading 2g x 2g block has positive leading minors; since these null vectors together with e_0..e_{2g-1} span the space,
    T' is positive semidefinite of rank 2g (classical argument, not formalised).
  * fake  (an integer L over "F_5" with functional equation, nonnegative integer closed-point counts, but roots off the circle):
    an explicit integer vector x with x^T T' x < 0, so T' is not positive semidefinite.
-/
abbrev Mat := List (List Int)
def dot (u v : List Int) : Int := (List.zipWith (· * ·) u v).foldl (· + ·) 0
def mulVec (A : Mat) (x : List Int) : List Int := A.map (fun r => dot r x)
def quad (A : Mat) (x : List Int) : Int := dot x (mulVec A x)
def topLeft (n : Nat) (M : Mat) : Mat := (M.take n).map (fun r => r.take n)
def minors (M : Mat) : List Int := Id.run do
  let n := M.length
  let mut a : Array (Array Int) := (M.map List.toArray).toArray
  let mut prev : Int := 1
  let mut out : Array Int := #[]
  for k in [0:n] do
    let piv := a[k]![k]!
    out := out.push piv
    for i in [k+1:n] do
      let mut row := a[i]!
      for j in [k+1:n] do
        row := row.set! j ((a[i]![j]! * piv - a[i]![k]! * a[k]![j]!) / prev)
      a := a.set! i row
    prev := piv
  return out.toList

def T_E5 : Mat := [
  [2, -3, -1, 18, -49, 57],
  [-3, 10, -15, -5, 90, -245],
  [-1, -15, 50, -75, -25, 450],
  [18, -5, -75, 250, -375, -125],
  [-49, 90, -25, -375, 1250, -1875],
  [57, -245, 450, -125, -1875, 6250]
]
def null_E5 : List (List Int) := [[5, 3, 1, 0, 0, 0], [0, 5, 3, 1, 0, 0], [0, 0, 5, 3, 1, 0], [0, 0, 0, 5, 3, 1]]
def n_E5 : Nat := 2

def T_G2_7 : Mat := [
  [4, -1, -13, -1, -97, 244, 1079, -2059],
  [-1, 28, -7, -91, -7, -679, 1708, 7553],
  [-13, -7, 196, -49, -637, -49, -4753, 11956],
  [-1, -91, -49, 1372, -343, -4459, -343, -33271],
  [-97, -7, -637, -343, 9604, -2401, -31213, -2401],
  [244, -679, -49, -4459, -2401, 67228, -16807, -218491],
  [1079, 1708, -4753, -343, -31213, -16807, 470596, -117649],
  [-2059, 7553, 11956, -33271, -2401, -218491, -117649, 3294172]
]
def null_G2_7 : List (List Int) := [[49, 7, 7, 1, 1, 0, 0, 0], [0, 49, 7, 7, 1, 1, 0, 0], [0, 0, 49, 7, 7, 1, 1, 0], [0, 0, 0, 49, 7, 7, 1, 1]]
def n_G2_7 : Nat := 4

def T_fake : Mat := [
  [4, 1, 13, 34, 17, 261, 208],
  [1, 20, 5, 65, 170, 85, 1305],
  [13, 5, 100, 25, 325, 850, 425],
  [34, 65, 25, 500, 125, 1625, 4250],
  [17, 170, 325, 125, 2500, 625, 8125],
  [261, 85, 850, 1625, 625, 12500, 3125],
  [208, 1305, 425, 4250, 8125, 3125, 62500]
]
def x_fake : List Int := [153567, 307425, 258987, 1000000, 251863, -138837, -102332]

theorem E5_null : (null_E5.all (fun u => mulVec T_E5 u == List.replicate 6 0)) = true := by decide +kernel

theorem E5_block_pd : (minors (topLeft n_E5 T_E5)).all (· > 0) = true := by decide +kernel

theorem G2_7_null : (null_G2_7.all (fun u => mulVec T_G2_7 u == List.replicate 8 0)) = true := by decide +kernel

theorem G2_7_block_pd : (minors (topLeft n_G2_7 T_G2_7)).all (· > 0) = true := by decide +kernel

theorem fake_negative : quad T_fake x_fake < 0 := by decide +kernel

#print axioms E5_null
#print axioms E5_block_pd
#print axioms G2_7_null
#print axioms G2_7_block_pd
#print axioms fake_negative
