#
# FinSetsForCAP: The elementary topos of finite sets
#
# Declarations
#

#! @Chapter The skeletal category of finite sets

DeclareRepresentation( "IsSkeletalFiniteSetRep",
        IsAttributeStoringRep and
        IsCapCategoryObjectRep and
	IsCellOfSkeletalCategory,
        [ ] );

BindGlobal( "TheTypeOfSkeletalFiniteSets",
         NewType( TheFamilyOfCapCategoryObjects,
                 IsSkeletalFiniteSetRep ) );

DeclareRepresentation( "IsSkeletalFiniteSetMapRep",
        IsAttributeStoringRep and
        IsCapCategoryMorphismRep,
        [ ] );

BindGlobal( "TheTypeOfMapsOfSkeletalFiniteSets",
         NewType( TheFamilyOfCapCategoryMorphisms,
                 IsSkeletalFiniteSetMapRep ) );


#! @Section Constructors

#! @Description
#!  Construct an object in the skeletal category of finite sets
#!  out of a nonnegative integer <A>n</A>, i.e.,
#!  an object in the &CAP; category <C>SkeletalFinSets</C>.
#! @Arguments n
#! @Returns a &CAP; object
DeclareOperation( "FinSet",
        [ IsInt ] );
#! @InsertSystem FinSet

#! @Description
#!  Construct a map $\phi:$<A>s</A>$\to$<A>t</A> of the skeletal finite sets <A>s</A> and <A>t</A>,
#!  i.e., a morphism in the &CAP; category <C>SkeletalFinSets</C>, where <A>G</A>
#!  is a list of integers in <A>t</A> describing the graph of $\phi$.
#! @Arguments s, G, t
#! @Returns a &CAP; morphism
DeclareOperation( "MapOfFinSets",
        [ IsSkeletalFiniteSetRep, IsList, IsSkeletalFiniteSetRep ] );
#! @InsertSystem  MapOfFinSets

#! @Section Tools

#! @Description
#!  Construct the embedding $\iota:$<A>s</A>$\to$<A>t</A> of the finite sets <A>s</A> and <A>t</A>,
#!  where <A>s</A> must be subset of <A>t</A>.
#! @Arguments s, t
#! @Returns a &CAP; morphism
DeclareOperation( "EmbeddingOfFinSets",
        [ IsSkeletalFiniteSetRep, IsSkeletalFiniteSetRep ] );

#! @Description
#!  Compute the image of <A>s_</A> under the morphism <A>phi</A>.
#! @Arguments phi, s_
#! @Returns a &CAP; object
DeclareOperation( "ImageObject",
        [ IsSkeletalFiniteSetMapRep, IsSkeletalFiniteSetRep ] );

#! @Description
#!  Compute the Preimage of <A>t</A> under the morphism <A>phi</A>.
#! @Arguments phi, t
#! @Returns a &CAP; object
DeclareOperation( "Preimage",
        [ IsSkeletalFiniteSetMapRep, IsList ] );

#! @Description
#!  Construct the projection $\pi:$<A>s</A>$\to$<A>t</A> of the skeletal finite sets <A>s</A> and <A>t</A>,
#!  where <A>t</A> is a partition of <A>s</A>.
#! @Arguments s,t
#! @Returns a &CAP; morphism
DeclareOperation( "ProjectionOfFinSets",
        [ IsSkeletalFiniteSetRep, IsSkeletalFiniteSetRep ] );