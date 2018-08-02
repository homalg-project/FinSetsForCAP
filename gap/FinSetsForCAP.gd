#
# FinSetsForCAP: The elementary topos of finite sets
#
# Declarations
#

#! @Chapter The category of finite sets

#! @Section GAP Categories

#! @Description
#! The GAP category of objects in the category
#! of finite sets.
#! @Arguments object
DeclareCategory( "IsFiniteSet",
                 IsCapCategoryObject );

#! @Description
#! The GAP category of morphisms in the category
#! of finite sets.
#! @Arguments object
DeclareCategory( "IsFiniteSetMap",
                 IsCapCategoryMorphism );

#! @Section Attributes

#! @Description
#!  The length of the &GAP; set of the list used to construct a finite set $S$, i.e.,
#!  <C>Length( FinSet( <A>L</A> ) ) = Length( Set( <A>L</A> ) )</C>.
#! @Arguments M
#! @Returns an integer
DeclareAttribute( "Length",
        IsFiniteSet );

#! @Description
#!  The &GAP; set of the list used to construct a finite set $S$, i.e.,
#!  <C>AsList( FinSet( <A>L</A> ) ) = Set( <A>L</A> )</C>.
#! @Arguments M
#! @Returns a &GAP; set
DeclareAttribute( "AsList",
        IsFiniteSet );

#! @Description
#!  The relation underlying a map between finite sets,
#!  i.e., <C>AsList( MapOfFinSets( S, <A>G</A>, T ) ) = <A>G</A></C>.
#! @Arguments f
#! @Returns a list
DeclareAttribute( "AsList",
        IsFiniteSetMap );

#! @Section Constructors

#! @Description
#!  Construct a finite set out of the list <A>L</A>, i.e.,
#!  an object in the &CAP; category <C>FinSets</C>.
#!  Warning: L must not contain mutable objects
#! @Arguments L
#! @Returns a &CAP; object
DeclareOperation( "FinSet",
        [ IsList ] );
#! @InsertSystem FinSet

#! @Description
#!  Construct a finite set out of the duplicate-free and dense list <A>L</A>, i.e.,
#!  an object in the &CAP; category <C>FinSets</C>.
#!  Warning: if L contains mutable objects it is not possible to define a well-defined map from or to the object, see WellDefinedForMophisms TODO
#! @Arguments L
#! @Returns a &CAP; object
DeclareOperation( "FinSetNC",
        [ IsList ] );
#! @InsertSystem FinSetNC

#! @Description
#!  Construct a map $\phi:$<A>S</A>$\to$<A>T</A> of the finite sets <A>S</A> and <A>T</A>,
#!  i.e., a morphism in the &CAP; category <C>FinSets</C>, where <A>G</A>
#!  is a list of pairs in <A>S</A>$\times$<A>T</A> describing the graph of $\phi$.
#! @Arguments S, G, T
#! @Returns a &CAP; morphism
DeclareOperation( "MapOfFinSets",
        [ IsFiniteSet, IsList, IsFiniteSet ] );
#! @InsertSystem MapOfFinSets

#! @Description
#!  Construct a map $\phi:$<A>S</A>$\to$<A>T</A> of the finite sets <A>S</A> and <A>T</A>,
#!  i.e., a morphism in the &CAP; category <C>FinSets</C>, where <A>G</A>
#!  is a duplicate-free and dense list of pairs in <A>S</A>$\times$<A>T</A> describing the graph of $\phi$.
#! @Arguments S, G, T
#! @Returns a &CAP; morphism
DeclareOperation( "MapOfFinSetsNC",
        [ IsFiniteSet, IsList, IsFiniteSet ] );
#! @InsertSystem MapOfFinSetsNC

#! @Section Tools

#! @Description
#!  Returns the <A>i</A>-th entry of the &GAP; set of the list used to construct a finite set $S$, i.e.,
#!  <C>FinSet( <A>L</A> )[ i ] = Set( <A>L</A> )[ i ]</C>.
#! @Arguments M, i
#! @Returns an object
DeclareOperation( "\[\]",
        [ IsFiniteSet, IsInt ] );

#! @Description
#!  Construct the embedding $\iota:$<A>S</A>$\to$<A>T</A> of the finite sets <A>S</A> and <A>T</A>,
#!  where <A>S</A> must be subset of <A>T</A>.
#! @Arguments S, T
#! @Returns a &CAP; morphism
DeclareOperation( "EmbeddingOfFinSets",
        [ IsFiniteSet, IsFiniteSet ] );

#! @Description
#!  Compute the preimage of <A>T_</A> under the morphism <A>f</A>.
#! @Arguments f, T_
#! @Returns a &CAP; object
DeclareOperation( "Preimage",
        [ IsFiniteSetMap, IsFiniteSet ] );

#! @Description
#!  Compute the set-theoretic union of the elements of <A>L</A>, where <A>L</A> is a list of finite sets.
#! @Arguments L
#! @Returns a &CAP; object
DeclareOperation( "UnionOfFinSets",
        [ IsList ] );

#! @Description
#!  Compute the image of <A>S_</A> under the morphism <A>f</A>.
#! @Arguments f, S_
#! @Returns a &CAP; object
DeclareOperation( "ImageObject",
        [ IsFiniteSetMap, IsFiniteSet ] );

#! @Description
#!  Construct the projection $\pi:$<A>S</A>$\to$<A>T</A> of the finite sets <A>S</A> and <A>T</A>,
#!  where <A>T</A> is a partition of <A>S</A>.
#! @Arguments S, T
#! @Returns a &CAP; morphism
DeclareOperation( "ProjectionOfFinSets",
        [ IsFiniteSet, IsFiniteSet ] );
