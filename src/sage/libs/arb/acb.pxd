# sage_setup: distribution = sagemath-flint

# Deprecated header file; use sage/libs/flint/acb.pxd instead
# See https://github.com/sagemath/sage/pull/36449

from sage.libs.flint.types cimport acb_struct, acb_t, acb_ptr, acb_srcptr

from sage.libs.flint.acb cimport (
    acb_realref,
    acb_imagref,
    acb_init,
    acb_clear,
    _acb_vec_init,
    _acb_vec_clear,
    acb_is_zero,
    acb_is_one,
    acb_is_finite,
    acb_is_exact,
    acb_is_int,
    acb_zero,
    acb_one,
    acb_onei,
    acb_set,
    acb_set_ui,
    acb_set_si,
    acb_set_fmpz,
    acb_set_arb,
    acb_set_fmpq,
    acb_set_round,
    acb_set_round_fmpz,
    acb_set_round_arb,
    acb_swap,
    acb_print,
    acb_printd,
    acb_randtest,
    acb_randtest_special,
    acb_randtest_precise,
    acb_randtest_param,
    acb_equal,
    acb_eq,
    acb_ne,
    acb_overlaps,
    acb_union,
    acb_get_abs_ubound_arf,
    acb_get_abs_lbound_arf,
    acb_get_rad_ubound_arf,
    acb_get_mag,
    acb_get_mag_lower,
    acb_contains_fmpq,
    acb_contains_fmpz,
    acb_contains,
    acb_contains_zero,
    acb_contains_int,
    acb_rel_error_bits,
    acb_rel_accuracy_bits,
    acb_bits,
    acb_indeterminate,
    acb_trim,
    acb_is_real,
    acb_get_unique_fmpz,
    acb_arg,
    acb_abs,
    acb_neg,
    acb_conj,
    acb_add_ui,
    acb_add_fmpz,
    acb_add_arb,
    acb_add,
    acb_sub_ui,
    acb_sub_fmpz,
    acb_sub_arb,
    acb_sub,
    acb_mul_onei,
    acb_div_onei,
    acb_mul_ui,
    acb_mul_si,
    acb_mul_fmpz,
    acb_mul_arb,
    acb_mul,
    acb_mul_2exp_si,
    acb_mul_2exp_fmpz,
    acb_cube,
    acb_addmul,
    acb_addmul_ui,
    acb_addmul_si,
    acb_addmul_fmpz,
    acb_addmul_arb,
    acb_submul,
    acb_submul_ui,
    acb_submul_si,
    acb_submul_fmpz,
    acb_submul_arb,
    acb_inv,
    acb_div_ui,
    acb_div_si,
    acb_div_fmpz,
    acb_div,
    acb_const_pi,
    acb_sqrt,
    acb_rsqrt,
    acb_pow_fmpz,
    acb_pow_ui,
    acb_pow_si,
    acb_pow_arb,
    acb_pow,
    acb_exp,
    acb_exp_pi_i,
    acb_exp_invexp,
    acb_log,
    acb_log1p,
    acb_sin,
    acb_cos,
    acb_sin_cos,
    acb_tan,
    acb_cot,
    acb_sec,
    acb_csc,
    acb_sin_pi,
    acb_cos_pi,
    acb_sin_cos_pi,
    acb_tan_pi,
    acb_cot_pi,
    acb_asin,
    acb_acos,
    acb_atan,
    acb_asinh,
    acb_acosh,
    acb_atanh,
    acb_lambertw,
    acb_sinh,
    acb_cosh,
    acb_sinh_cosh,
    acb_tanh,
    acb_coth,
    acb_sech,
    acb_csch,
    acb_rising_ui,
    acb_rising,
    acb_gamma,
    acb_rgamma,
    acb_lgamma,
    acb_digamma,
    acb_log_sin_pi,
    acb_polygamma,
    acb_barnes_g,
    acb_log_barnes_g,
    acb_zeta,
    acb_hurwitz_zeta,
    acb_polylog,
    acb_polylog_si,
    acb_agm1,
    acb_agm1_cpx,
    _acb_vec_init,
    _acb_vec_sort_pretty,
    _acb_vec_clear)
