"""Sieve of Eratosthenes (odd numbers only) up to 2e8; saves primes_2e8.npy (11,078,937 primes). Needed by the prime-spectrum, BK and Weil scripts."""
import numpy as np
N = 200_000_000
s = np.ones(N // 2 + 1, dtype=bool); s[0] = False
for i in range(1, int(N**0.5) // 2 + 1):
    if s[i]:
        p = 2 * i + 1; s[(p * p) // 2::p] = False
pr = np.concatenate([[2], 2 * np.nonzero(s)[0] + 1]); pr = pr[pr <= N].astype(np.int64)
print(len(pr), pr[-1]); np.save('primes_2e8.npy', pr)
