# SPDX-License-Identifier: GPL-2.0-or-later
# FinSetsForCAP: The (skeletal) elementary topos of finite sets
#
# Declarations
#

#! @Chapter The skeletal category of finite sets

#! @Section Tools

#! @Description
#!  Returns $(q^n-1)/(q-1)$ = <C>Sum</C>( [ 0 .. <A>n</A> - 1 ], i -> <A>q</A>^i ),
#!  taking the corner case <A>q</A>$= 1$ into account.
#! @Arguments q, n
#! @Returns an integer
DeclareOperation( "GeometricSum",
        [ IsRingElement, IsBigInt ] );

CapJitAddTypeSignature( "GeometricSum", [ IsBigInt, IsBigInt ], IsBigInt );

#! @Description
#!  Returns $(1+((n-1)*q-n)*q^(n-1))/(q-1)^2$ = <C>Sum</C>( [ 0 .. <A>n</A> - 1 ], i -> i * <A>q</A>^(i - 1) ),
#!  taking the corner case <A>q</A>$= 1$ into account.
#! @Arguments q, n
#! @Returns an integer
DeclareOperation( "GeometricSumDiff1",
        [ IsRingElement, IsBigInt ] );

CapJitAddTypeSignature( "GeometricSumDiff1", [ IsBigInt, IsBigInt ], IsBigInt );

#! @Description
#!  Return the remainder of the natural number <A>v</A> less than <A>ab</A> modulo <A>a</A>,
#!  where <A>ab</A> is a multiple of <A>a</A>.
#! @Arguments v, a, ab
#! @Returns an integer
DeclareOperation( "RemIntWithDomain",
        [ IsBigInt, IsObject, IsBigInt ] );

CapJitAddTypeSignature( "RemIntWithDomain", [ IsBigInt, IsBigInt, IsBigInt ], IsBigInt );

#! @Description
#!  Return the quotient of the natural number <A>v</A> less than <A>ab</A> modulo <A>a</A>,
#!  where <A>ab</A> is a multiple of <A>a</A>.
#! @Arguments v, a, ab
#! @Returns an integer
DeclareOperation( "QuoIntWithDomain",
        [ IsBigInt, IsObject, IsBigInt ] );

CapJitAddTypeSignature( "QuoIntWithDomain", [ IsBigInt, IsBigInt, IsBigInt ], IsBigInt );

#! @Description
#!  Return the quotient <A>q</A> of the natural number <A>a</A> by the divior <A>d</A>.
#! @Arguments a, d, q
#! @Returns an integer
DeclareOperation( "DivIntWithGivenQuotient",
        [ IsBigInt, IsObject, IsBigInt ] );

CapJitAddTypeSignature( "DivIntWithGivenQuotient", [ IsBigInt, IsBigInt, IsBigInt ], IsBigInt );

#! @Description
#!  Return the digit of index <A>i</A> in the <A>b</A>-adic expansion of length <A>l</A> of the natural number <A>v</A>.
#! @Arguments v, i, l, b
#! @Returns an integer
DeclareOperation( "DigitInPositionalNotation",
        [ IsBigInt, IsBigInt, IsBigInt, IsBigInt ] );

CapJitAddTypeSignature( "DigitInPositionalNotation", [ IsBigInt, IsBigInt, IsBigInt, IsBigInt ], IsBigInt );
