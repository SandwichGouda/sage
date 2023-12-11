# distutils: libraries = flint
# distutils: depends = flint/acf.h

################################################################################
# This file is auto-generated. Do not modify by hand
################################################################################

from libc.stdio cimport FILE
from sage.libs.gmp.types cimport *
from sage.libs.mpfr.types cimport *
from sage.libs.flint.types cimport *

cdef extern from "flint_wrap.h":

    void acf_init(acf_t x) noexcept
    # Initializes the variable *x* for use, and sets its value to zero.

    void acf_clear(acf_t x) noexcept
    # Clears the variable *x*, freeing or recycling its allocated memory.

    void acf_swap(acf_t z, acf_t x) noexcept
    # Swaps *z* and *x* efficiently.

    slong acf_allocated_bytes(const acf_t x) noexcept
    # Returns the total number of bytes heap-allocated internally by this object.
    # The count excludes the size of the structure itself. Add
    # ``sizeof(acf_struct)`` to get the size of the object as a whole.

    arf_ptr acf_real_ptr(acf_t z) noexcept
    arf_ptr acf_imag_ptr(acf_t z) noexcept
    # Returns a pointer to the real or imaginary part of *z*.

    void acf_set(acf_t z, const acf_t x) noexcept
    # Sets *z* to the value *x*.

    bint acf_equal(const acf_t x, const acf_t y) noexcept
    # Returns whether *x* and *y* are equal.

    int acf_add(acf_t res, const acf_t x, const acf_t y, slong prec, arf_rnd_t rnd) noexcept

    int acf_sub(acf_t res, const acf_t x, const acf_t y, slong prec, arf_rnd_t rnd) noexcept

    int acf_mul(acf_t res, const acf_t x, const acf_t y, slong prec, arf_rnd_t rnd) noexcept
    # Sets *res* to the sum, difference or product of *x* or *y*, correctly
    # rounding the real and imaginary parts in direction *rnd*.
    # The return flag has the least significant bit set if the real
    # part is inexact, and the second least significant bit set if
    # the imaginary part is inexact.

    void acf_approx_inv(acf_t res, const acf_t x, slong prec, arf_rnd_t rnd) noexcept
    void acf_approx_div(acf_t res, const acf_t x, const acf_t y, slong prec, arf_rnd_t rnd) noexcept
    void acf_approx_sqrt(acf_t res, const acf_t x, slong prec, arf_rnd_t rnd) noexcept
    # Computes an approximate inverse, quotient or square root.

    void acf_approx_dot(acf_t res, const acf_t initial, int subtract, acf_srcptr x, slong xstep, acf_srcptr y, slong ystep, slong len, slong prec, arf_rnd_t rnd) noexcept
    # Computes an approximate dot product, with the same meaning of
    # the parameters as :func:`arb_dot`.
