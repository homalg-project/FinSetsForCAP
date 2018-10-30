#
# SkeletalFinSetsForCAP: SkeletalFinSets
#
# Declarations
#

#! @Chapter The category of skeletal finite sets

#! @Section Skeletal GAP Categories

#! @Description
#! The GAP category of objects in the category
#! of skeletal finite sets.
#! @Arguments object
DeclareCategory( "IsSkeletalFiniteSet",
                 IsCapCategoryObject and IsCellOfSkeletalCategory );

#! @Description
#! The GAP category of morphisms in the category
#! of skeletal finite sets.
#! @Arguments object
DeclareCategory( "IsSkeletalFiniteSetMap",
                 IsCapCategoryMorphism and IsCellOfSkeletalCategory );

#! @Section Skeletal Attributes

#! @Description
#!  The integer defining the skeletal finite set <A>M</A>, i.e.,
#!  <C>Length( FinSet( n ) ) = n</C>.
#! @Arguments M
#! @Returns an integer
DeclareAttribute( "Length",
        IsSkeletalFiniteSet );

#! @Description
#!  The list associated to a skeletal finite set, i.e.,
#!  <C>AsList( FinSet( n ) ) = [ 1 .. n ]</C>.
#! @Arguments M
#! @Returns a list
DeclareAttribute( "AsList",
        IsSkeletalFiniteSet );

#! @Section Skeletal Constructors

#! @Description
#!  Construct a skeletal finite set
#!  out of a nonnegative integer <A>n</A>, i.e.,
#!  an object in the &CAP; category <C>SkeletalFinSets</C>.
#! @Arguments n
#! @Returns a &CAP; object
DeclareOperation( "FinSet",
        [ IsInt ] );
#! @InsertSystem Skeletal FinSet

#! @Description
#!  Construct a map $\phi:$<A>s</A>$\to$<A>t</A> of the skeletal finite sets <A>s</A> and <A>t</A>,
#!  i.e., a morphism in the &CAP; category <C>SkeletalFinSets</C>, where <A>G</A>
#!  is a list of integers in <A>t</A> describing the graph of $\phi$.
#! @Arguments s, G, t
#! @Returns a &CAP; morphism
DeclareOperation( "MapOfFinSets",
        [ IsSkeletalFiniteSet, IsList, IsSkeletalFiniteSet ] );
#! @InsertSystem  SkeletalMapOfFinSets

#! @Section Skeletal Tools

#! @Description
#!  Returns <C>List( AsList( <A>s</A> ), <A>f</A> )</C>.
#! @Arguments s, f
#! @Returns a list
DeclareOperation( "ListOp",
        [ IsSkeletalFiniteSet, IsFunction ] );

#! @Description
#!  Construct the embedding $\iota:$<A>s</A>$\to$<A>t</A> of the finite sets <A>s</A> and <A>t</A>,
#!  where <A>s</A> must be subset of <A>t</A>.
#! @Arguments s, t
#! @Returns a &CAP; morphism
DeclareOperation( "EmbeddingOfFinSets",
        [ IsSkeletalFiniteSet, IsSkeletalFiniteSet ] );

#! @Description
#!  Compute the Preimage of <A>t</A> under the morphism <A>phi</A>.
#! @Arguments phi, t
#! @Returns a &CAP; object
DeclareOperation( "Preimage",
        [ IsSkeletalFiniteSetMap, IsList ] );

#! @Description
#!  Compute the image of <A>s_</A> under the morphism <A>phi</A>.
#! @Arguments phi, s_
#! @Returns a &CAP; object
DeclareOperation( "ImageObject",
        [ IsSkeletalFiniteSetMap, IsSkeletalFiniteSet ] );

#! @Description
#!  Returns the image of <C><A>L</A>[1]</C> under the map <A>phi</A> assuming <C><A>L</A>[1]</C> is a positive integer smaller or equal to <C>Length( Source( <A>phi</A> ) )</C>.
#! @Arguments phi, L
#! @Returns a list
# DeclareOperation( "CallFuncList",
#         [ IsSkeletalFiniteSetMap, IsList ] );
