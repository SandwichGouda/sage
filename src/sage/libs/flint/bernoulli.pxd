# distutils: libraries = flint
# distutils: depends = flint/bernoulli.h

################################################################################
# This file is auto-generated. Do not modify by hand
################################################################################

from libc.stdio cimport FILE
from sage.libs.gmp.types cimport *
from sage.libs.mpfr.types cimport *
from sage.libs.flint.types cimport *

cdef extern from "flint_wrap.h":

    void bernoulli_rev_init(bernoulli_rev_t it, ulong n) noexcept
    # Initializes the iterator *iter*. The first Bernoulli number to
    # be generated by calling :func:`bernoulli_rev_next` is `B_n`.
    # It is assumed that `n` is even.

    void bernoulli_rev_next(fmpz_t numer, fmpz_t denom, bernoulli_rev_t it) noexcept
    # Sets *numer* and *denom* to the exact, reduced numerator and denominator
    # of the Bernoulli number `B_k` and advances the state of *iter*
    # so that the next invocation generates `B_{k-2}`.

    void bernoulli_rev_clear(bernoulli_rev_t it) noexcept
    # Frees all memory allocated internally by *iter*.

    void bernoulli_fmpq_vec_no_cache(fmpq * res, ulong a, slong num) noexcept
    # Writes *num* consecutive Bernoulli numbers to *res* starting
    # with `B_a`. This function is not currently optimized for a small
    # count *num*. The entries are not read from or written
    # to the Bernoulli number cache; if retrieving a vector of
    # Bernoulli numbers is needed more than once,
    # use :func:`bernoulli_cache_compute`
    # followed by :func:`bernoulli_fmpq_ui` instead.
    # This function is a wrapper for the *rev* iterators. It can use
    # multiple threads internally.

    void bernoulli_cache_compute(slong n) noexcept
    # Makes sure that the Bernoulli numbers up to at least `B_{n-1}` are cached.
    # Calling :func:`flint_cleanup()` frees the cache.
    # The cache is extended by calling :func:`bernoulli_fmpq_vec_no_cache`
    # internally.

    slong bernoulli_bound_2exp_si(ulong n) noexcept
    # Returns an integer `b` such that `|B_n| \le 2^b`. Uses a lookup table
    # for small `n`, and for larger `n` uses the inequality
    # `|B_n| < 4 n! / (2 \pi)^n < 4 (n+1)^{n+1} e^{-n} / (2 \pi)^n`.
    # Uses integer arithmetic throughout, with the bound for the logarithm
    # being looked up from a table. If `|B_n| = 0`, returns *LONG_MIN*.
    # Otherwise, the returned exponent `b` is never more than one percent
    # larger than the true magnitude.
    # This function is intended for use when `n` small enough that one might
    # comfortably compute `B_n` exactly. It aborts if `n` is so large that
    # internal overflow occurs.

    ulong bernoulli_mod_p_harvey(ulong n, ulong p) noexcept
    # Returns the `B_n` modulo the prime number *p*, computed using
    # Harvey's algorithm [Har2010]_. The running time is linear in *p*.
    # If *p* divides the numerator of `B_n`, *UWORD_MAX* is returned
    # as an error code.

    void _bernoulli_fmpq_ui_zeta(fmpz_t num, fmpz_t den, ulong n) noexcept
    void _bernoulli_fmpq_ui_multi_mod(fmpz_t num, fmpz_t den, ulong n, double alpha) noexcept
    # Sets *num* and *den* to the reduced numerator and denominator
    # of the Bernoulli number `B_n`.
    # The *zeta* version computes the denominator `d` using the von Staudt-Clausen
    # theorem, numerically approximates `B_n` using :func:`arb_bernoulli_ui_zeta`,
    # and then rounds `d B_n` to the correct numerator.
    # The *multi_mod* version reconstructs `B_n` by computing the high bits
    # via the Riemann zeta function and the low bits via Harvey's multimodular
    # algorithm. The tuning parameter *alpha* should be a fraction between
    # 0 and 1 controlling the number of bits to compute by the multimodular
    # algorithm. If set to a negative number, a default value will be used.

    void _bernoulli_fmpq_ui(fmpz_t num, fmpz_t den, ulong n) noexcept
    void bernoulli_fmpq_ui(fmpq_t b, ulong n) noexcept
    # Computes the Bernoulli number `B_n` as an exact fraction, for an
    # isolated integer `n`. This function reads `B_n` from the global cache
    # if the number is already cached, but does not automatically extend
    # the cache by itself.
