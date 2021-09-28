r"""
Elements of finitely generated free graded left modules

This class implements construction and basic manipulation of 
elements of the Sage parent
:class:`sage.modules.fp_graded.free_module.FreeModule`, which models
free graded left modules over connected algebras.

For an overview of the free module API, see :doc:`free_module`.

AUTHORS:

- Robert R. Bruner, Michael J. Catanzaro (2012): Initial version.
- Sverre Lunoee--Nielsen and Koen van Woerden (2019-11-29): Updated the
  original software to Sage version 8.9.
- Sverre Lunoee--Nielsen (2020-07-01): Refactored the code and added
  new documentation and tests.
"""

#*****************************************************************************
#       Copyright (C) 2019 Robert R. Bruner <rrb@math.wayne.edu>
#                     and  Michael J. Catanzaro <mike@math.wayne.edu>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
# (at your option) any later version.
#                  https://www.gnu.org/licenses/
# ****************************************************************************

from sage.misc.cachefunc import cached_method
from sage.modules.with_basis.indexed_element import IndexedFreeModuleElement

class FreeGradedModuleElement(IndexedFreeModuleElement):
    r"""
    Create a module element of a finitely generated free graded left module
    over a connected graded algebra.

    EXAMPLES::  

        sage: from sage.modules.fp_graded.free_module import FreeGradedModule
        sage: M = FreeGradedModule(SteenrodAlgebra(2), (0, 1))

        sage: M([0, 0])
        <0, 0>

        sage: M([1, 0])
        <1, 0>

        sage: M([0, 1])
        <0, 1>

        sage: M([Sq(1), 1])
        <Sq(1), 1>
    """
    def degree(self):
        r"""
        The degree of this element.

        OUTPUT: the integer degree of this element, or None if this is the zero
        element.

        EXAMPLES::

            sage: from sage.modules.fp_graded.free_module import *
            sage: A = SteenrodAlgebra(2)
            sage: M = FreeGradedModule(A, (0,1))
            sage: x = M.an_element(7); x
            <Sq(0,0,1), Sq(3,1)>
            sage: x.degree()
            7

        The zero element has no degree::

            sage: (x-x).degree()
            Traceback (most recent call last):
            ...
            ValueError: the zero element does not have a well-defined degree

        Neither do non-homogeneous slements

            sage: y = M.an_element(4)
            sage: (x+y).degree()
            Traceback (most recent call last):
            ...
            ValueError: this is a nonhomogeneous element, no well-defined degree
        """
        if self.is_zero():
            raise ValueError("the zero element does not have a well-defined degree")
        degrees = []
        try:
            for g, c in zip(self.parent().generator_degrees(),
                            self.dense_coefficient_list()):
                if c:
                    degrees.append(g + c.degree())
        except ValueError:
            raise ValueError("this is a nonhomogeneous element, no well-defined degree")
        m = min(degrees)
        M = max(degrees)
        if m == M:
            return m
        raise ValueError("this is a nonhomogeneous element, no well-defined degree")


    def _repr_(self):
        r"""
        Return a string representation of this element.

        EXAMPLES::

            sage: from sage.modules.fp_graded.free_module import *
            sage: A = SteenrodAlgebra(2)
            sage: M = FreeGradedModule(A, (0,1))
            sage: [M.an_element(n) for n in range(1,10)]
            [<Sq(1), 1>,
             <Sq(2), Sq(1)>,
             <Sq(0,1), Sq(2)>,
             <Sq(1,1), Sq(3)>,
             <Sq(2,1), Sq(4)>,
             <Sq(0,2), Sq(5)>,
             <Sq(0,0,1), Sq(3,1)>,
             <Sq(1,0,1), Sq(1,2)>,
             <Sq(2,0,1), Sq(2,2)>]
        """
        return '<%s>' % ', '.join(['%s' % c for c in self.dense_coefficient_list()])


    def _lmul_(self, a):
        r"""
        Act by left multiplication on this element by ``a``.

        INPUT:

        - ``a`` -- an element of the algebra this module is defined over.

        OUTPUT: the module element `a\cdot x` where `x` is this module element.

        EXAMPLES::

            sage: from sage.modules.fp_graded.free_module import *
            sage: A2 = SteenrodAlgebra(2, profile=(3,2,1))
            sage: M = FreeGradedModule(A2, (0,0,3))
            sage: A2.Sq(2)*M.generator(1)
            <0, Sq(2), 0>
            sage: A2.Sq(2)*(A2.Sq(1)*A2.Sq(2)*M.generator(1) + M.generator(2))
            <0, Sq(2,1), Sq(2)>

        TESTS::

            sage: elements = [M.an_element(n) for n in range(1,10)]
            sage: a = A2.Sq(3)
            sage: [a*x for x in elements]
            [<Sq(1,1), Sq(1,1), 0>,
             <0, 0, 0>,
             <Sq(3,1), Sq(3,1), Sq(3)>,
             <0, 0, Sq(1,1)>,
             <0, 0, 0>,
             <Sq(3,2), Sq(3,2), Sq(3,1)>,
             <Sq(3,0,1), Sq(3,0,1), Sq(7)>,
             <Sq(1,1,1), Sq(1,1,1), Sq(5,1)>,
             <0, 0, Sq(3,2)>]
        """
        return self.parent()((a*c for c in self.dense_coefficient_list()))

    @cached_method
    def vector_presentation(self):
        r"""
        A coordinate vector representing this module element when it is non-zero.

        These are coordinates with respect to the basis chosen by
        :meth:`sage.modules.fp_graded.free_module.FreeGradedModule.basis_elements`.
        When the element is zero, it has no well defined degree, and this
        function returns ``None``.

        OUTPUT: A vector of elements in the ground field of the algebra for
        this module when this element is non-zero.  Otherwise, the value
        ``None``.

        .. SEEALSO::

            :meth:`sage.modules.fp_graded.free_module.FreeGradedModule.vector_presentation`
            :meth:`sage.modules.fp_graded.free_module.FreeGradedModule.basis_elements`
            :meth:`sage.modules.fp_graded.free_module.FreeGradedModule.element_from_coordinates`

        EXAMPLES::

            sage: from sage.modules.fp_graded.free_module import *
            sage: A2 = SteenrodAlgebra(2, profile=(3,2,1))
            sage: M = FreeGradedModule(A2, (0,1))
            sage: x = M.an_element(7)
            sage: v = x.vector_presentation(); v
            (1, 0, 0, 0, 0, 1, 0)
            sage: type(v)
            <type 'sage.modules.vector_mod2_dense.Vector_mod2_dense'>

            sage: V = M.vector_presentation(7)
            sage: v in V
            True

            sage: M.element_from_coordinates(v, 7) == x
            True

        We can use the basis for the module elements in the degree of `x`,
        together with the coefficients `v` to recreate the element `x`::

            sage: basis = M.basis_elements(7)
            sage: x_ = sum( [c*b for (c,b) in zip(v, basis)] ); x_
            <Sq(0,0,1), Sq(3,1)>
            sage: x == x_
            True

        TESTS::

            sage: M.zero().vector_presentation() is None
            True
        """        
        # We cannot represent the zero element since it does not have a degree,
        # and we therefore do not know which vector space it belongs to.
        # 
        # In this case, we could return the integer value 0 since coercion would
        # place it inside any vector space.  However, this will not work for
        # homomorphisms, so we we return None to be consistent.
        if self.is_zero():
             return None

        bas_gen = self.parent().basis_elements(self.degree())
        base_vec = self.parent().vector_presentation(self.degree())

        base_dict = dict(zip(bas_gen, base_vec.basis()))

        # Create a sparse representation of the element.
        sparse_coeffs = [x for x in enumerate(self.dense_coefficient_list()) if not x[1].is_zero()]

        vector = base_vec.zero()
        for summand_index, algebra_element in sparse_coeffs:
            for scalar_coefficient, monomial in zip(algebra_element.coefficients(), algebra_element.monomials()):
                vector += scalar_coefficient*base_dict[monomial*self.parent().generator(summand_index)]

        return vector
