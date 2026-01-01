# SPDX-License-Identifier: GPL-2.0-or-later
# FinSetsForCAP: The (skeletal) elementary topos of finite sets
#
# Declarations
#

#! @Chapter The skeletal category of finite sets with counting starting at 1

#! @Section GAP Categories

#! @Description
#! The GAP category of a skeletal category of finite sets with counting starting at 1.
#! @Arguments object
DeclareCategory( "IsSkeletalCategoryOfFiniteSetsWithCountingStartingAt1",
                  IsCapCategory );

#! @Description
#! The GAP category of objects in the skeletal category of finite sets with counting starting at 1.
#! @Arguments object
DeclareCategory( "IsObjectInSkeletalCategoryOfFiniteSetsWithCountingStartingAt1",
                 IsCapCategoryObject );

#! @Description
#! The GAP category of morphisms in the skeletal category of finite sets with counting starting at 1.
#! @Arguments object
DeclareCategory( "IsMorphismInSkeletalCategoryOfFiniteSetsWithCountingStartingAt1",
                 IsCapCategoryMorphism );

#! @Section Attributes

#! @Description
#!  The integer defining the skeletal finite set <A>M</A>, i.e.,
#!  <C>Cardinality( FinSet( n ) ) = n</C>.
#! @Arguments M
#! @Returns an integer
DeclareAttribute( "Cardinality",
        IsObjectInSkeletalCategoryOfFiniteSetsWithCountingStartingAt1 );

CapJitAddTypeSignature( "Cardinality", [ IsObjectInSkeletalCategoryOfFiniteSetsWithCountingStartingAt1 ], IsBigInt );

#! @Description
#!  The list associated to a skeletal finite set, i.e.,
#!  <C>AsList( FinSet( n ) ) = [ 1 .. n ]</C>.
#! @Arguments M
#! @Returns a list
DeclareAttribute( "AsList",
        IsObjectInSkeletalCategoryOfFiniteSetsWithCountingStartingAt1 );

CapJitAddTypeSignature( "AsList", [ IsObjectInSkeletalCategoryOfFiniteSetsWithCountingStartingAt1 ], CapJitDataTypeOfListOf( IsBigInt ) );

#! @Description
#!  The graph defining the skeletal finite set morphism <A>phi</A>, see <Ref Oper="MapOfFinSets" Label="for IsObjectInSkeletalCategoryOfFiniteSetsWithCountingStartingAt1, IsList, IsObjectInSkeletalCategoryOfFiniteSetsWithCountingStartingAt1" />.
#! @Arguments phi
#! @Returns a list
DeclareAttribute( "AsList",
        IsMorphismInSkeletalCategoryOfFiniteSetsWithCountingStartingAt1 );

CapJitAddTypeSignature( "AsList", [ IsMorphismInSkeletalCategoryOfFiniteSetsWithCountingStartingAt1 ], CapJitDataTypeOfListOf( IsBigInt ) );

#! @Section Constructors

#! @Description
#!  Construct a skeletal category of finite sets with counting starting at 1.
#! @Returns a &CAP; category
DeclareOperation( "SkeletalCategoryOfFiniteSetsWithCountingStartingAt1", [ IsSkeletalCategoryOfFiniteSets ] );

#! @Description
#!  The default instance of the skeletal category of finite sets with counting starting at 1.
#!  It is automatically created while loading this package.
DeclareGlobalName( "SkeletalFinSets1" );

#! @Description
#!  Construct a skeletal finite set residing in
#!  the default instance of the skeletal category of finite sets with counting starting at 1 <C>SkeletalFinSets</C>
#!  of order given by the nonnegative integer <A>n</A>.
#! @Arguments n
#! @Returns a &CAP; object
DeclareOperation( "FinSet1",
        [ IsBigInt ] );
#! @InsertChunk SkeletalFinSet1

#! @Description
#!  Construct a skeletal finite set residing in
#!  the given skeletal category of finite sets with counting starting at 1 <A>C</A>
#!  of order given by the nonnegative integer <A>n</A>.
#! @Arguments C, n
#! @Returns a &CAP; object
KeyDependentOperation( "FinSet1", IsSkeletalCategoryOfFiniteSetsWithCountingStartingAt1, IsBigInt, ReturnTrue );

#! @Description
#!  Construct a map $\phi:$<A>s</A>$\to$<A>t</A> of the skeletal finite sets <A>s</A> and <A>t</A>,
#!  i.e., a morphism in the &CAP; category of <A>s</A>, where <A>G</A>
#!  is a list of integers in <A>t</A> describing the graph of $\phi$.
#! @Arguments s, G, t
#! @Returns a &CAP; morphism
DeclareOperation( "MapOfFinSets",
        [ IsObjectInSkeletalCategoryOfFiniteSetsWithCountingStartingAt1, IsList, IsObjectInSkeletalCategoryOfFiniteSetsWithCountingStartingAt1 ] );
#! @InsertChunk  SkeletalMapOfFinSets1

#! @Section Tools

#! @Description
#!  Returns <C>List( AsList( <A>s</A> ), <A>f</A> )</C>.
#! @Arguments s, f
#! @Returns a list
DeclareOperation( "ListOp",
        [ IsObjectInSkeletalCategoryOfFiniteSetsWithCountingStartingAt1, IsFunction ] );

#! @Description
#!  Construct the embedding $\iota:$<A>s</A>$\to$<A>t</A> of the finite sets <A>s</A> and <A>t</A>,
#!  where <A>s</A> must be subset of <A>t</A>.
#! @Arguments s, t
#! @Returns a &CAP; morphism
DeclareOperation( "EmbeddingOfFinSets",
        [ IsObjectInSkeletalCategoryOfFiniteSetsWithCountingStartingAt1, IsObjectInSkeletalCategoryOfFiniteSetsWithCountingStartingAt1 ] );

#! @Description
#!  Compute the Preimage of <A>t</A> under the morphism <A>phi</A>.
#! @Arguments phi, t
#! @Returns a &CAP; object
DeclareOperation( "Preimage",
        [ IsMorphismInSkeletalCategoryOfFiniteSetsWithCountingStartingAt1, IsList ] );

#! @Description
#!  Compute the image of <A>s_</A> under the morphism <A>phi</A>.
#! @Arguments phi, s_
#! @Returns a &CAP; object
DeclareOperation( "ImageObject",
        [ IsMorphismInSkeletalCategoryOfFiniteSetsWithCountingStartingAt1, IsObjectInSkeletalCategoryOfFiniteSetsWithCountingStartingAt1 ] );
