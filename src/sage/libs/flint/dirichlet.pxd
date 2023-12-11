# distutils: libraries = flint
# distutils: depends = flint/dirichlet.h

################################################################################
# This file is auto-generated. Do not modify by hand
################################################################################

from libc.stdio cimport FILE
from sage.libs.gmp.types cimport *
from sage.libs.mpfr.types cimport *
from sage.libs.flint.types cimport *

cdef extern from "flint_wrap.h":

    int dirichlet_group_init(dirichlet_group_t G, ulong q) noexcept
    # Initializes *G* to the group of Dirichlet characters mod *q*.
    # This method computes a canonical decomposition of *G* in terms of cyclic
    # groups, which are the mod `p^e` subgroups for `p^e\|q`, plus
    # the specific generator described by Conrey for each subgroup.
    # In particular *G* contains:
    # - the number *num* of components
    # - the generators
    # - the exponent *expo* of the group
    # It does *not* automatically precompute lookup tables
    # of discrete logarithms or numerical roots of unity, and can therefore
    # safely be called even with large *q*.
    # For implementation reasons, the largest prime factor of *q* must not
    # exceed `10^{16}`. This restriction could
    # be removed in the future. The function returns 1 on success and 0
    # if a factor is too large.

    void dirichlet_subgroup_init(dirichlet_group_t H, const dirichlet_group_t G, ulong h) noexcept

    void dirichlet_group_clear(dirichlet_group_t G) noexcept
    # Clears *G*. Remark this function does *not* clear the discrete logarithm
    # tables stored in *G* (which may be shared with another group).

    ulong dirichlet_group_size(const dirichlet_group_t G) noexcept

    ulong dirichlet_group_num_primitive(const dirichlet_group_t G) noexcept

    void dirichlet_group_dlog_precompute(dirichlet_group_t G, ulong num) noexcept
    # Precompute decomposition and tables for discrete log computations in *G*,
    # so as to minimize the complexity of *num* calls to discrete logarithms.
    # If *num* gets very large, the entire group may be indexed.

    void dirichlet_group_dlog_clear(dirichlet_group_t G) noexcept

    void dirichlet_char_init(dirichlet_char_t chi, const dirichlet_group_t G) noexcept
    # Initializes *chi* to an element of the group *G* and sets its value
    # to the principal character.

    void dirichlet_char_clear(dirichlet_char_t chi) noexcept
    # Clears *chi*.

    void dirichlet_char_print(const dirichlet_group_t G, const dirichlet_char_t chi) noexcept
    # Prints the array of exponents representing this character.

    void dirichlet_char_log(dirichlet_char_t x, const dirichlet_group_t G, ulong m) noexcept
    # Sets *x* to the character of number *m*, computing its log using discrete
    # logarithm in *G*.

    ulong dirichlet_char_exp(const dirichlet_group_t G, const dirichlet_char_t x) noexcept
    # Returns the number *m* corresponding to exponents in *x*.

    ulong _dirichlet_char_exp(dirichlet_char_t x, const dirichlet_group_t G) noexcept
    # Computes and returns the number *m* corresponding to exponents in *x*.
    # This function is for internal use.

    void dirichlet_char_one(dirichlet_char_t x, const dirichlet_group_t G) noexcept
    # Sets *x* to the principal character in *G*, having *log* `[0,\dots 0]`.

    void dirichlet_char_first_primitive(dirichlet_char_t x, const dirichlet_group_t G) noexcept
    # Sets *x* to the first primitive character of *G*, having *log* `[1,\dots 1]`,
    # or `[0, 1, \dots 1]` if `8\mid q`.

    void dirichlet_char_set(dirichlet_char_t x, const dirichlet_group_t G, const dirichlet_char_t y) noexcept
    # Sets *x* to the element *y*.

    int dirichlet_char_next(dirichlet_char_t x, const dirichlet_group_t G) noexcept
    # Sets *x* to the next character in *G* according to lexicographic ordering
    # of *log*.
    # The return value
    # is the index of the last updated exponent of *x*, or *-1* if the last
    # element has been reached.
    # This function allows to iterate on all elements of *G* looping on their *log*.
    # Note that it produces elements in seemingly random *number* order.
    # The following template can be used for such a loop::
    # dirichlet_char_one(chi, G);
    # do {
    # /* use character chi */
    # } while (dirichlet_char_next(chi, G) >= 0);

    int dirichlet_char_next_primitive(dirichlet_char_t x, const dirichlet_group_t G) noexcept
    # Same as :func:`dirichlet_char_next`, but jumps to the next primitive character of *G*.

    ulong dirichlet_index_char(const dirichlet_group_t G, const dirichlet_char_t x) noexcept
    # Returns the lexicographic index of the *log* of *x* as an integer in `0\dots \varphi(q)`.

    void dirichlet_char_index(dirichlet_char_t x, const dirichlet_group_t G, ulong j) noexcept
    # Sets *x* to the character whose *log* has lexicographic index *j*.

    bint dirichlet_char_eq(const dirichlet_char_t x, const dirichlet_char_t y) noexcept

    int dirichlet_char_eq_deep(const dirichlet_group_t G, const dirichlet_char_t x, const dirichlet_char_t y) noexcept

    bint dirichlet_char_is_principal(const dirichlet_group_t G, const dirichlet_char_t chi) noexcept

    ulong dirichlet_conductor_ui(const dirichlet_group_t G, ulong a) noexcept

    ulong dirichlet_conductor_char(const dirichlet_group_t G, const dirichlet_char_t x) noexcept

    int dirichlet_parity_ui(const dirichlet_group_t G, ulong a) noexcept

    int dirichlet_parity_char(const dirichlet_group_t G, const dirichlet_char_t x) noexcept

    ulong dirichlet_order_ui(const dirichlet_group_t G, ulong a) noexcept

    ulong dirichlet_order_char(const dirichlet_group_t G, const dirichlet_char_t x) noexcept

    bint dirichlet_char_is_real(const dirichlet_group_t G, const dirichlet_char_t chi) noexcept

    bint dirichlet_char_is_primitive(const dirichlet_group_t G, const dirichlet_char_t chi) noexcept

    ulong dirichlet_pairing(const dirichlet_group_t G, ulong m, ulong n) noexcept

    ulong dirichlet_pairing_char(const dirichlet_group_t G, const dirichlet_char_t chi, const dirichlet_char_t psi) noexcept

    ulong dirichlet_chi(const dirichlet_group_t G, const dirichlet_char_t chi, ulong n) noexcept

    void dirichlet_chi_vec(ulong * v, const dirichlet_group_t G, const dirichlet_char_t chi, slong nv) noexcept

    void dirichlet_chi_vec_order(ulong * v, const dirichlet_group_t G, const dirichlet_char_t chi, ulong order, slong nv) noexcept

    void dirichlet_char_mul(dirichlet_char_t chi12, const dirichlet_group_t G, const dirichlet_char_t chi1, const dirichlet_char_t chi2) noexcept

    void dirichlet_char_pow(dirichlet_char_t c, const dirichlet_group_t G, const dirichlet_char_t a, ulong n) noexcept

    void dirichlet_char_lift(dirichlet_char_t chi_G, const dirichlet_group_t G, const dirichlet_char_t chi_H, const dirichlet_group_t H) noexcept
    # If *H* is a subgroup of *G*, computes the character in *G* corresponding to
    # *chi_H* in *H*.

    void dirichlet_char_lower(dirichlet_char_t chi_H, const dirichlet_group_t H, const dirichlet_char_t chi_G, const dirichlet_group_t G) noexcept
    # If *chi_G* is a character of *G* which factors through *H*, sets *chi_H* to
    # the corresponding restriction in *H*.
    # This requires `c(\chi_G)\mid q_H\mid q_G`, where `c(\chi_G)` is the
    # conductor of `\chi_G` and `q_G, q_H` are the moduli of G and H.
