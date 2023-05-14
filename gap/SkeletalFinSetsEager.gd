# SPDX-License-Identifier: GPL-2.0-or-later
# FinSetsForCAP: The elementary topos of (skeletal) finite sets
#
# Declarations
#

#! @Chapter The category of skeletal finite sets with morphisms given by lists

#! @Section GAP Categories

#! @Description
#! The GAP category of categories
#! of skeletal finite sets with morphisms given by lists.
#! @Arguments object
DeclareCategory( "IsCategoryOfSkeletalFinSetsWithMorphismsGivenByLists",
                  IsCategoryOfSkeletalFinSets );

#! @Description
#! The GAP category of objects in the category
#! of skeletal finite sets with morphisms given by lists.
#! @Arguments object
DeclareCategory( "IsObjectInCategoryOfSkeletalFinSetsWithMorphismsGivenByLists",
                 IsObjectInCategoryOfSkeletalFinSets );

#! @Description
#! The GAP category of morphisms in the category
#! of skeletal finite sets with morphisms given by lists.
#! @Arguments object
DeclareCategory( "IsMorphismInCategoryOfSkeletalFinSetsWithMorphismsGivenByLists",
                 IsMorphismInCategoryOfSkeletalFinSets );

#! @Section Attributes

#! @Description
#!  The list of images defining the skeletal finite set morphism <A>phi</A>, see <Ref Oper="MapOfFinSets" Label="for IsObjectInCategoryOfSkeletalFinSets, IsFunction, IsObjectInCategoryOfSkeletalFinSets" />.
#! @Arguments phi
#! @Returns a list
DeclareAttribute( "AsList",
        IsMorphismInCategoryOfSkeletalFinSets );

CapJitAddTypeSignature( "AsList", [ IsMorphismInCategoryOfSkeletalFinSetsWithMorphismsGivenByLists ],
        rec( filter := IsList, element_type := rec( filter := IsBigInt ) ) );

#! @Section Constructors

#! @Description
#!  Construct a category of skeletal finite sets with maps given by lists.
#! @Returns a &CAP; category
DeclareOperation( "CategoryOfSkeletalFinSetsWithMorphismsGivenByLists", [ ] );

#! @Description
#!  The default instance of the category of skeletal finite sets given by lists.
#!  It is automatically created while loading this package.
DeclareGlobalName( "SkeletalFinSetsWithMorphismsGivenByLists" );

#! @Description
#!  Construct a map $\phi:$<A>s</A>$\to$<A>t</A> of the skeletal finite sets <A>s</A> and <A>t</A>,
#!  i.e., a morphism in the &CAP; category of <A>s</A>, where <A>list_of_images</A>
#!  is a list of integers in <A>t</A> describing the images of $\phi$.
#! @Arguments s, list_of_images, t
#! @Returns a &CAP; morphism
DeclareOperation( "MapOfFinSets",
        [ IsObjectInCategoryOfSkeletalFinSets, IsList, IsObjectInCategoryOfSkeletalFinSets ] );
#! @InsertChunk  SkeletalMapOfFinSets
