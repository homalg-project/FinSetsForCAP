# SPDX-License-Identifier: GPL-2.0-or-later
# FinSetsForCAP: The (skeletal) elementary topos of finite sets
#
# Declarations
#

#! @Chapter The skeletal category of finite sets

#! @Section GAP Categories

#! @Description
#! The GAP category of a skeletal category of finite sets.
#! @Arguments object
DeclareCategory( "IsSkeletalCategoryOfFiniteSets",
                  IsCapCategory );

#! @Description
#! The GAP category of objects in the skeletal category of finite sets.
#! @Arguments object
DeclareCategory( "IsObjectInSkeletalCategoryOfFiniteSets",
                 IsCapCategoryObject );

#! @Description
#! The GAP category of morphisms in the skeletal category of finite sets.
#! @Arguments object
DeclareCategory( "IsMorphismInSkeletalCategoryOfFiniteSets",
                 IsCapCategoryMorphism );

#! @Section Attributes

#! @Description
#!  The integer defining the skeletal finite set <A>M</A>, i.e.,
#!  <C>Length( FinSet( n ) ) = n</C>.
#! @Arguments M
#! @Returns an integer
DeclareAttribute( "Length",
        IsObjectInSkeletalCategoryOfFiniteSets );

CapJitAddTypeSignature( "Length", [ IsObjectInSkeletalCategoryOfFiniteSets ], IsBigInt );

#! @Description
#!  The list associated to a skeletal finite set, i.e.,
#!  <C>AsList( FinSet( n ) ) = [ 0 .. n - 1 ]</C>.
#! @Arguments M
#! @Returns a list
DeclareAttribute( "AsList",
        IsObjectInSkeletalCategoryOfFiniteSets );

CapJitAddTypeSignature( "AsList", [ IsObjectInSkeletalCategoryOfFiniteSets ], CapJitDataTypeOfListOf( IsBigInt ) );

#! @Description
#!  The graph defining the skeletal finite set morphism <A>phi</A>, see <Ref Oper="MapOfFinSets" Label="for IsObjectInSkeletalCategoryOfFiniteSets, IsList, IsObjectInSkeletalCategoryOfFiniteSets" />.
#! @Arguments phi
#! @Returns a list
DeclareAttribute( "AsList",
        IsMorphismInSkeletalCategoryOfFiniteSets );

CapJitAddTypeSignature( "AsList", [ IsMorphismInSkeletalCategoryOfFiniteSets ], CapJitDataTypeOfListOf( IsBigInt ) );

#! @Section Constructors

#! @Description
#!  Construct a skeletal category of finite sets.
#! @Returns a &CAP; category
DeclareOperation( "SkeletalCategoryOfFiniteSets", [ ] );

#! @Description
#!  The default instance of the skeletal category of finite sets.
#!  It is automatically created while loading this package.
DeclareGlobalName( "SkeletalFinSets" );

#! @Description
#!  Construct a skeletal finite set residing in
#!  the default instance of the skeletal category of finite sets <C>SkeletalFinSets</C>
#!  of order given by the nonnegative integer <A>n</A>.
#! @Arguments n
#! @Returns a &CAP; object
DeclareOperation( "FinSet",
        [ IsBigInt ] );
#! @InsertChunk SkeletalFinSet

#! @Description
#!  Construct a skeletal finite set residing in
#!  the given skeletal category of finite sets <A>C</A>
#!  of order given by the nonnegative integer <A>n</A>.
#! @Arguments C, n
#! @Returns a &CAP; object
KeyDependentOperation( "FinSet", IsSkeletalCategoryOfFiniteSets, IsBigInt, ReturnTrue );

#! @Description
#!  Construct a map $\phi:$<A>s</A>$\to$<A>t</A> of the skeletal finite sets <A>s</A> and <A>t</A>,
#!  i.e., a morphism in the &CAP; category of <A>s</A>, where <A>G</A>
#!  is a list of integers in <A>t</A> describing the graph of $\phi$.
#! @Arguments s, G, t
#! @Returns a &CAP; morphism
DeclareOperation( "MapOfFinSets",
        [ IsObjectInSkeletalCategoryOfFiniteSets, IsList, IsObjectInSkeletalCategoryOfFiniteSets ] );
#! @InsertChunk  SkeletalMapOfFinSets

#! @Section Tools

#! @Description
#!  Returns <C>List( AsList( <A>s</A> ), <A>f</A> )</C>.
#! @Arguments s, f
#! @Returns a list
DeclareOperation( "ListOp",
        [ IsObjectInSkeletalCategoryOfFiniteSets, IsFunction ] );

#! @Description
#!  Construct the embedding $\iota:$<A>s</A>$\to$<A>t</A> of the finite sets <A>s</A> and <A>t</A>,
#!  where <A>s</A> must be subset of <A>t</A>.
#! @Arguments s, t
#! @Returns a &CAP; morphism
DeclareOperation( "EmbeddingOfFinSets",
        [ IsObjectInSkeletalCategoryOfFiniteSets, IsObjectInSkeletalCategoryOfFiniteSets ] );

#! @Description
#!  Compute the Preimage of <A>t</A> under the morphism <A>phi</A>.
#! @Arguments phi, t
#! @Returns a &CAP; object
DeclareOperation( "Preimage",
        [ IsMorphismInSkeletalCategoryOfFiniteSets, IsList ] );

#! @Description
#!  Compute the image of <A>s_</A> under the morphism <A>phi</A>.
#! @Arguments phi, s_
#! @Returns a &CAP; object
DeclareOperation( "ImageObject",
        [ IsMorphismInSkeletalCategoryOfFiniteSets, IsObjectInSkeletalCategoryOfFiniteSets ] );

#! @Description
#!  Returns the image of <C><A>L</A>[1]</C> under the map <A>phi</A> assuming <C><A>L</A>[1]</C> is a nonnegative integer smaller than <C>Length( Source( <A>phi</A> ) )</C>.
#! @Arguments phi, L
#! @Returns a list
# DeclareOperation( "CallFuncList",
#         [ IsMorphismInSkeletalCategoryOfFiniteSets, IsList ] );

# Technical functions
DeclareGlobalFunction( "INSTALL_FUNCTIONS_FOR_SKELETAL_FIN_SETS" );

DeclareGlobalFunction( "SKELETAL_FIN_SETS_ExplicitCoequalizer" );
CapJitAddTypeSignature( "SKELETAL_FIN_SETS_ExplicitCoequalizer", [ IsObjectInSkeletalCategoryOfFiniteSets, IsList ], CapJitDataTypeOfListOf( CapJitDataTypeOfListOf( IsBigInt ) ) );

DeclareGlobalFunction( "SKELETAL_FIN_SETS_IsMonomorphism" );
CapJitAddTypeSignature( "SKELETAL_FIN_SETS_IsMonomorphism", [ IsList, IsBigInt ], IsBool );

DeclareGlobalFunction( "SKELETAL_FIN_SETS_IsEpimorphism" );
CapJitAddTypeSignature( "SKELETAL_FIN_SETS_IsEpimorphism", [ IsList, IsBigInt ], CapJitDataTypeOfListOf( IsBool ) );

DeclareSynonym( "IsCategoryOfSkeletalFinSets", IsSkeletalCategoryOfFiniteSets );
DeclareSynonym( "IsSkeletalFiniteSet", IsObjectInSkeletalCategoryOfFiniteSets );
DeclareSynonym( "IsSkeletalFiniteSetMap", IsMorphismInSkeletalCategoryOfFiniteSets );
DeclareSynonym( "CategoryOfSkeletalFinSets", SkeletalCategoryOfFiniteSets );
