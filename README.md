# Project index: the "Reimann-Hypothesis-" repository assessment and the numerical programme around it

**Status.** None of this is a proof of the Riemann Hypothesis and none of it bears on whether RH is true. It consists of (a) an assessment of a GitHub repository's claimed proof, (b) a precise framework for the ideas in it, and (c) numerical experiments on the zeros of ζ and of Dirichlet L-functions, on finite-field analogues, and on the Weil and Li positivity criteria. Every report states its own limitations. The consolidated summary is the "Assessing the Reimann-Hypothesis- repository: what holds, what doesn't, and what the numerics show" (sections 1–15), which was kept up to date as the work went on.

All numerics are floating-point (some in 50–170-digit arithmetic), run on one CPU core. Odlyzko's zero tables were obtained through a GitHub mirror (see below).

## 1. Reading order (reports)

| # | Report | What it does | Status |
|---|---|---|---|
| 1 | `README_rh_energy.md` | Candidate energy E(σ) from the zeros (mean of log|ξ| over a window); V-shaped, minimum at ½ by symmetry | superseded in one claim (see §6, item 2) |
| 2 | `README_fake_zero_test.md` | Insert a hypothetical off-line zero quadruple: kink of size 2π/L matches theory; minimum stays at ½; the repository's own energy is vacuous (it equals ∫(log|χ|)²) | current |
| 3 | `README_phase_velocity_map.md` | Dictionary from the repository's language to the de Bruijn–Newman heat flow; forward-flow zero collisions | current |
| 4 | `README_no_collision_bound.md` | Gap-lifetime lemma (a real pair stays apart backward for at least r²/8); why a uniform no-collision bound cannot exist | current, with updates |
| 5 | `README_harness.md` | Backward-flow experiments on windows up to γ ≈ 10⁶ | partly superseded by 9 |
| 6 | `README_forward_flow.md` | Forward flow (t > 0): argument-principle zero counting; planted pair detected 32/32 | current |
| 7 | `README_rs_scaling.md` | Riemann–Siegel evaluator, first survey, lifetime scaling | **numbers superseded by 8** (window-boundary bug); evaluator and lemma results stand |
| 8 | `README_t_of_x_test.md` | Survey to γ ≈ 10¹¹, comparison with Odlyzko's tables, window-by-window test of the x^(−2/3) scaling | current |
| 9 | `README_literature_extreme_heights.md` | Literature check of the Λ lower bounds; window test at γ ≈ 10²⁰, 10²¹ | current |
| 10 | `README_primes_and_repulsion.md` | Primes in the zeros (explicit-formula peaks), the ramp, first-order finite-height correction | two points resolved by 11 |
| 11 | `README_function_field_and_BK.md` | Function-field analogue; the full Bogomolny–Keating formula, evaluated numerically | current |
| 12 | `README_dirichlet_L_functions.md` | Zeros of four Dirichlet L-functions; what carries over | one gap closed by 13 |
| 13 | `README_character_adapted_BK.md` | Character-adapted BK formula derived from the ratios recipe and tested with no free parameters | current |
| 14 | `README_li_criterion.md` | Li coefficients from arithmetic and from the zeros; detection depth for an off-line zero | current |
| 15 | `README_weil_archimedean.md` | Weil form on test functions supported in [1/λ, λ]: validation, positivity margin, prolate structure, characters | current (spectral-gap claim corrected) |
| 16 | `README_prime_threshold_offset.md` | Test of a rank-one endpoint model for the onset offset: negative result | current |

## 2. Code by topic

| Topic | Scripts |
|---|---|
| Energy and fake-zero tests | `rh_energy.py`, `rh_fake_zero_test.py` |
| Heat flow of the zeros | `rh_flow_sketch.py`, `rh_nocollision_sketch.py`, `rh_harness.py` (mpmath, backward), `rh_forward.py` (forward, t > 0) |
| Fast Riemann–Siegel evaluator and surveys | `rs_tables.py` (builds `rs_cheb_coef.npy`), `rs_z.py`, `rh_survey.py`, `rh_survey2.py`, `rh_flow2.py`, `run_all.sh` |
| Comparison with Odlyzko, window tests, extremes | `compare_odlyzko.py`, `window_test.py`, `final_stats.py`, `flow_check_high.py`, `extreme_heights.py`, `build_report.py`, `write_readme.py` |
| Primes in the zeros, finite-height corrections | `prime_spectrum.py`, `spike.py`, `spike2.py`, `lines.py`, `line_stab.py`, `predict_lines.py`, `bblm_test.py`, `bblm_compare.py`, `build_primes_report.py`, `write_primes_readme.py` |
| Bogomolny–Keating, numerically | `bk_pred.py`, `bk_compare.py`, `bk_lowL.py` |
| Function fields | `ff_hyperelliptic.py`, `run_ff.py`, `run_rest.py`, `ff_analyze.py`, `build_ff_bk.py`, `write_ffbk_readme.py` |
| Dirichlet L-functions | `dirichlet_zeros.py`, `dz_analyze.py`, `dz_pairs.py`, `dz_control.py`, `bk_char.py`, `dz_adapted.py`, `dz_ablation.py`, `write_dz_readme.py`, `write_adapted_readme.py` |
| Li criterion | `li_arith.py`, `li_zeros.py`, `li_fake.py`, `build_li.py`, `write_li_readme.py` |
| Weil form | `weil_form.py`, `weil_char.py`, `weil_experiment.py`, `weil_convergence.py`, `build_weil.py`, `prime_threshold.py` |
| Setup helpers | `make_primes.py`, `get_odlyzko.sh` |

## 3. Results, tables and figures

- **JSON results** (one per experiment, named after its script): `results_final.json`, `forward_results.json`, `flow2_results.json`, `survey_results.json` (first survey, superseded), `compare_odlyzko.json`, `window_test.json`, `final_stats.json`, `flow_check_high.json`, `extreme_heights.json`, `bblm_results.json`, `bk_compare.json`, `bk_lowL.json`, `lines.json`, `spike2.json`, `prime_spectrum_*.json` (1e7 … 1e11, t6), `ff_results.json`, `ff_analysis.json`, `dz_results.json` (includes the computed zeros of the four L-functions), `dz_pairs.json`, `dz_control.json`, `dz_adapted.json`, `dz_ablation.json`, `li_arith_800.json`, `li_arith_800b.json`, `li_zeros.json`, `li_fake.json`, `weil_sweepA.json`, `weil_transition.json`, `weil_Lc.json`, `weil_onset32.json`, `weil_onset2.json`, `weil_convA.json`, `weil_convB.json`, `weil_char_sweep.json`, `weil_char_Lc.json`, `prime_threshold.json`, `prime_threshold_lowdeg.json`.
- **Numerical tables** (`.npz`, `.npy`): `bblm_tables.npz` (random-matrix spacing CDF and its 1/N² correction), `bk_R2_table.npz` and `bk_L16.58.npz`, `bk_L18.89.npz`, `bk_L21.19.npz` (numerical Bogomolny–Keating functions), `rs_cheb_coef.npy` (Riemann–Siegel correction tables).
- **Figures:** `rh_energy.png`, `rh_fake_zero.png`, `rh_harness.png`, `rh_rs_scaling.png`, `rh_t_of_x_test.png`, `rh_primes_repulsion.png`, `rh_ff_bk.png`, `rh_li_criterion.png`, `rh_weil_archimedean.png`.

## 4. Setup

```bash
pip install numpy scipy mpmath matplotlib finufft
./get_odlyzko.sh            # Odlyzko's tables (via the GitHub mirror) into ./odlyzko
python make_primes.py       # primes up to 2e8 -> primes_2e8.npy (about 1 minute)
python rs_tables.py         # only needed if rs_cheb_coef.npy is missing
```

Not included (too large or regenerable): the zero position files `pos_*.npy` (produced by `run_all.sh`, about 20 minutes), `zeros_300.npy` (produced by `rh_energy.py` on first run, about 1 minute), `primes_2e8.npy`, `dz_*.npz` (the zeros of the Dirichlet L-functions are in `dz_results.json`), and `odlyzko/`.

## 5. Reproducing the main results (approximate times, one core)

| Result | Commands |
|---|---|
| Explicit-formula validation of the Weil form | `python weil_form.py 0.9 8` (seconds) |
| Weil-form positivity and prolate structure | `WEIL_DPS=90 python weil_experiment.py 24 0.25,0.5,0.7 out.json`; `WEIL_DPS=170 python weil_convergence.py 1.1 40 out2.json` (minutes) |
| Li coefficients | `python li_arith.py 800 4096 13.0 150 li_arith_800.json` (about 2.5 min); `python li_zeros.py`; `python li_fake.py` |
| Survey to γ ≈ 10¹¹ and window tests | `./run_all.sh` (about 20 min), then `python compare_odlyzko.py`, `python window_test.py`, `python final_stats.py` |
| Prime peaks and form factor | `python prime_spectrum.py 1e9 5e8 1500` (a few minutes; needs `pos_1e9.npy`) |
| Numerical Bogomolny–Keating function | `python bk_pred.py 18.89 400 0.03 bk_L18.89.npz` (about 6 min), then `python bk_compare.py`, `python bk_lowL.py` |
| Function fields | `python run_ff.py` (about 25 min), `python ff_analyze.py` |
| Dirichlet zeros and the adapted formula | `python dirichlet_zeros.py chi_-4 1 700 0.07` (about 4 min per character); `python dz_adapted.py`; `python dz_ablation.py` |

Several scripts import each other (for example `window_test.py` is used by `final_stats.py` and `bk_lowL.py`; `weil_char.py` subclasses `weil_form.py`), so run them from one directory. Some scripts assume the working directory contains the files listed in §4.

## 6. Corrections and supersessions (so that nothing stale is relied on)

1. `README_rs_scaling.md`: the survey tables came from a version with a window-boundary bug (a close pair straddling a window edge could be mislocated); superseded by `README_t_of_x_test.md`.
2. `README_rh_energy.md`: it cited Hardy's convexity theorem for a truncated mean of log|ξ|, which that theorem does not cover; on a finite window the energy has small negative curvature.
3. A uniform lower bound on gaps at t = 0 is not "the open core" of the problem; it is heuristically impossible if RH holds (`README_no_collision_bound.md`).
4. The window time t(x) ∝ 1/log²x holds only for typical windows; for the closest pair it falls much faster (`README_t_of_x_test.md`).
5. Λ > −1.15×10⁻¹¹ is the best *Lehmer-pair* bound; since 2018 it is superseded by Λ ≥ 0 (Rodgers–Tao).
6. The 25–30% shortfall of the measured line weights in `README_primes_and_repulsion.md` came from comparing with a simplified weight; the full formula agrees within noise (`README_function_field_and_BK.md`).
7. The failure of the first-order correction at N_eff < 3 is a limit of that expansion; the full formula removes it.
8. "No spectral gap" in `README_weil_archimedean.md` was too strong: at L ≈ 0.37 the smallest eigenvalue is converged in N; at L = 0.7 it is still falling.
9. The repository's energy does exist (in `RHTheorem.txt`); my first fake-zero test used a different energy.

## 7. Caveats common to everything here

- Odlyzko's tables came through the mirror `nightbay/odzeros`, whose author says the files were whitespace-sanitised with the numbers unchanged; I did not compare them byte-for-byte with the originals. The agreement of my own computations with them is itself a consistency check.
- Of the repository itself I read its README and the opening of `RHTheorem.txt`; I did not read `RHProposal` or the other files.
- Several results rest on conjectures (the ratios conjecture, Hardy–Littlewood, GUE small-gap statistics); each report says where.
- Positivity results (Li, Weil) are finite-dimensional or finite-support statements; their infinite versions are equivalent to RH.
