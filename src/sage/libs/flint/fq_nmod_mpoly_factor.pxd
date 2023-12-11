# distutils: libraries = flint
# distutils: depends = flint/fq_nmod_mpoly_factor.h

################################################################################
# This file is auto-generated. Do not modify by hand
################################################################################

from libc.stdio cimport FILE
from sage.libs.gmp.types cimport *
from sage.libs.mpfr.types cimport *
from sage.libs.flint.types cimport *

cdef extern from "flint_wrap.h":

    void fq_nmod_mpoly_factor_init(fq_nmod_mpoly_factor_t f, const fq_nmod_mpoly_ctx_t ctx) noexcept
    # Initialise *f*.

    void fq_nmod_mpoly_factor_clear(fq_nmod_mpoly_factor_t f, const fq_nmod_mpoly_ctx_t ctx) noexcept
    # Clear *f*.

    void fq_nmod_mpoly_factor_swap(fq_nmod_mpoly_factor_t f, fq_nmod_mpoly_factor_t g, const fq_nmod_mpoly_ctx_t ctx) noexcept
    # Efficiently swap *f* and *g*.

    slong fq_nmod_mpoly_factor_length(const fq_nmod_mpoly_factor_t f, const fq_nmod_mpoly_ctx_t ctx) noexcept
    # Return the length of the product in *f*.

    void fq_nmod_mpoly_factor_get_constant_fq_nmod(fq_nmod_t c, const fq_nmod_mpoly_factor_t f, const fq_nmod_mpoly_ctx_t ctx) noexcept
    # Set `c` to the constant of *f*.

    void fq_nmod_mpoly_factor_get_base(fq_nmod_mpoly_t p, const fq_nmod_mpoly_factor_t f, slong i, const fq_nmod_mpoly_ctx_t ctx) noexcept
    void fq_nmod_mpoly_factor_swap_base(fq_nmod_mpoly_t p, const fq_nmod_mpoly_factor_t f, slong i, const fq_nmod_mpoly_ctx_t ctx) noexcept
    # Set (resp. swap) *B* to (resp. with) the base of the term of index *i* in *A*.

    slong fq_nmod_mpoly_factor_get_exp_si(fq_nmod_mpoly_factor_t f, slong i, const fq_nmod_mpoly_ctx_t ctx) noexcept
    # Return the exponent of the term of index *i* in *A*. It is assumed to fit an ``slong``.

    void fq_nmod_mpoly_factor_sort(fq_nmod_mpoly_factor_t f, const fq_nmod_mpoly_ctx_t ctx) noexcept
    # Sort the product of *f* first by exponent and then by base.

    int fq_nmod_mpoly_factor_squarefree(fq_nmod_mpoly_factor_t f, const fq_nmod_mpoly_t A, const fq_nmod_mpoly_ctx_t ctx) noexcept
    # Set *f* to a factorization of *A* where the bases are primitive and
    # pairwise relatively prime. If the product of all irreducible factors with
    # a given exponent is desired, it is recommended to call :func:`fq_nmod_mpoly_factor_sort`
    # and then multiply the bases with the desired exponent.

    int fq_nmod_mpoly_factor(fq_nmod_mpoly_factor_t f, const fq_nmod_mpoly_t A, const fq_nmod_mpoly_ctx_t ctx) noexcept
    # Set *f* to a factorization of *A* where the bases are irreducible.
