# sage_setup: distribution = sagemath-flint
# distutils: libraries = flint
# distutils: depends = flint/qadic.h

################################################################################
# This file is auto-generated by the script
#   SAGE_ROOT/src/sage_setup/autogen/flint_autogen.py.
# Do not modify by hand! Fix and rerun the script instead.
################################################################################

from libc.stdio cimport FILE
from sage.libs.gmp.types cimport *
from sage.libs.mpfr.types cimport *
from sage.libs.flint.types cimport *

cdef extern from "flint_wrap.h":
    void qadic_ctx_init(qadic_ctx_t ctx, const fmpz_t p, slong d, slong min, slong max, const char * var, padic_print_mode mode) noexcept
    void qadic_ctx_init_conway(qadic_ctx_t ctx, const fmpz_t p, slong d, slong min, slong max, const char * var, padic_print_mode mode) noexcept
    void qadic_ctx_clear(qadic_ctx_t ctx) noexcept
    slong qadic_ctx_degree(const qadic_ctx_t ctx) noexcept
    void qadic_ctx_print(const qadic_ctx_t ctx) noexcept
    void qadic_init(qadic_t rop) noexcept
    void qadic_init2(qadic_t rop, slong prec) noexcept
    void qadic_clear(qadic_t rop) noexcept
    void _fmpz_poly_reduce(fmpz * R, slong lenR, const fmpz * a, const slong * j, slong len) noexcept
    void _fmpz_mod_poly_reduce(fmpz * R, slong lenR, const fmpz * a, const slong * j, slong len, const fmpz_t p) noexcept
    void qadic_reduce(qadic_t rop, const qadic_ctx_t ctx) noexcept
    slong qadic_val(const qadic_t op) noexcept
    slong qadic_prec(const qadic_t op) noexcept
    void qadic_randtest(qadic_t rop, flint_rand_t state, const qadic_ctx_t ctx) noexcept
    void qadic_randtest_not_zero(qadic_t rop, flint_rand_t state, const qadic_ctx_t ctx) noexcept
    void qadic_randtest_val(qadic_t rop, flint_rand_t state, slong v, const qadic_ctx_t ctx) noexcept
    void qadic_randtest_int(qadic_t rop, flint_rand_t state, const qadic_ctx_t ctx) noexcept
    void qadic_set(qadic_t rop, const qadic_t op, const qadic_ctx_t ctx) noexcept
    void qadic_zero(qadic_t rop) noexcept
    void qadic_one(qadic_t rop) noexcept
    void qadic_gen(qadic_t rop, const qadic_ctx_t ctx) noexcept
    void qadic_set_ui(qadic_t rop, ulong op, const qadic_ctx_t ctx) noexcept
    int qadic_get_padic(padic_t rop, const qadic_t op, const qadic_ctx_t ctx) noexcept
    bint qadic_is_zero(const qadic_t op) noexcept
    bint qadic_is_one(const qadic_t op) noexcept
    bint qadic_equal(const qadic_t op1, const qadic_t op2) noexcept
    void qadic_add(qadic_t rop, const qadic_t op1, const qadic_t op2, const qadic_ctx_t ctx) noexcept
    void qadic_sub(qadic_t rop, const qadic_t op1, const qadic_t op2, const qadic_ctx_t ctx) noexcept
    void qadic_neg(qadic_t rop, const qadic_t op, const qadic_ctx_t ctx) noexcept
    void qadic_mul(qadic_t rop, const qadic_t op1, const qadic_t op2, const qadic_ctx_t ctx) noexcept
    void _qadic_inv(fmpz * rop, const fmpz * op, slong len, const fmpz * a, const slong * j, slong lena, const fmpz_t p, slong N) noexcept
    void qadic_inv(qadic_t rop, const qadic_t op, const qadic_ctx_t ctx) noexcept
    void _qadic_pow(fmpz * rop, const fmpz * op, slong len, const fmpz_t e, const fmpz * a, const slong * j, slong lena, const fmpz_t p) noexcept
    void qadic_pow(qadic_t rop, const qadic_t op, const fmpz_t e, const qadic_ctx_t ctx) noexcept
    int qadic_sqrt(qadic_t rop, const qadic_t op, const qadic_ctx_t ctx) noexcept
    void _qadic_exp_rectangular(fmpz * rop, const fmpz * op, slong v, slong len, const fmpz * a, const slong * j, slong lena, const fmpz_t p, slong N, const fmpz_t pN) noexcept
    int qadic_exp_rectangular(qadic_t rop, const qadic_t op, const qadic_ctx_t ctx) noexcept
    void _qadic_exp_balanced(fmpz * rop, const fmpz * x, slong v, slong len, const fmpz * a, const slong * j, slong lena, const fmpz_t p, slong N, const fmpz_t pN) noexcept
    int qadic_exp_balanced(qadic_t rop, const qadic_t op, const qadic_ctx_t ctx) noexcept
    void _qadic_exp(fmpz * rop, const fmpz * op, slong v, slong len, const fmpz * a, const slong * j, slong lena, const fmpz_t p, slong N, const fmpz_t pN) noexcept
    int qadic_exp(qadic_t rop, const qadic_t op, const qadic_ctx_t ctx) noexcept
    void _qadic_log_rectangular(fmpz * z, const fmpz * y, slong v, slong len, const fmpz * a, const slong * j, slong lena, const fmpz_t p, slong N, const fmpz_t pN) noexcept
    int qadic_log_rectangular(qadic_t rop, const qadic_t op, const qadic_ctx_t ctx) noexcept
    void _qadic_log_balanced(fmpz * z, const fmpz * y, slong len, const fmpz * a, const slong * j, slong lena, const fmpz_t p, slong N, const fmpz_t pN) noexcept
    int qadic_log_balanced(qadic_t rop, const qadic_t op, const qadic_ctx_t ctx) noexcept
    void _qadic_log(fmpz * z, const fmpz * y, slong v, slong len, const fmpz * a, const slong * j, slong lena, const fmpz_t p, slong N, const fmpz_t pN) noexcept
    int qadic_log(qadic_t rop, const qadic_t op, const qadic_ctx_t ctx) noexcept
    void _qadic_frobenius_a(fmpz * rop, slong e, const fmpz * a, const slong * j, slong lena, const fmpz_t p, slong N) noexcept
    void _qadic_frobenius(fmpz * rop, const fmpz * op, slong len, slong e, const fmpz * a, const slong * j, slong lena, const fmpz_t p, slong N) noexcept
    void qadic_frobenius(qadic_t rop, const qadic_t op, slong e, const qadic_ctx_t ctx) noexcept
    void _qadic_teichmuller(fmpz * rop, const fmpz * op, slong len, const fmpz * a, const slong * j, slong lena, const fmpz_t p, slong N) noexcept
    void qadic_teichmuller(qadic_t rop, const qadic_t op, const qadic_ctx_t ctx) noexcept
    void _qadic_trace(fmpz_t rop, const fmpz * op, slong len, const fmpz * a, const slong * j, slong lena, const fmpz_t pN) noexcept
    void qadic_trace(padic_t rop, const qadic_t op, const qadic_ctx_t ctx) noexcept
    void _qadic_norm(fmpz_t rop, const fmpz * op, slong len, const fmpz * a, const slong * j, slong lena, const fmpz_t p, slong N) noexcept
    void qadic_norm(padic_t rop, const qadic_t op, const qadic_ctx_t ctx) noexcept
    void qadic_norm_analytic(padic_t rop, const qadic_t op, const qadic_ctx_t ctx) noexcept
    void qadic_norm_resultant(padic_t rop, const qadic_t op, const qadic_ctx_t ctx) noexcept
    int qadic_fprint_pretty(FILE * file, const qadic_t op, const qadic_ctx_t ctx) noexcept
    int qadic_print_pretty(const qadic_t op, const qadic_ctx_t ctx) noexcept
