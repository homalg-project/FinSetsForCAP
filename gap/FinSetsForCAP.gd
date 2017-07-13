#
# FinSetsForCAP: The elementary topos of finite sets
#
# Declarations
#

#! @Chapter The category of finite sets

DeclareRepresentation( "IsFiniteSetRep",
        IsAttributeStoringRep and
        IsCapCategoryObjectRep,
        [ ] );

BindGlobal( "TheTypeOfFiniteSets",
         NewType( TheFamilyOfCapCategoryObjects,
                 IsFiniteSetRep ) );

DeclareRepresentation( "IsFiniteSetMapRep",
        IsAttributeStoringRep and
        IsCapCategoryMorphismRep,
        [ ] );

BindGlobal( "TheTypeOfMapsOfFiniteSets",
         NewType( TheFamilyOfCapCategoryMorphisms,
                 IsFiniteSetMapRep ) );

#! @Section Attributes

#! @Description
#!  The &GAP; set of the list used to construct a finite set $S$, i.e.,
#!  <C>AsList( FinSet( <A>L</A> ) ) = Set( <A>L</A> )</C>.
#! @Arguments L
#! @Returns a &GAP; set
DeclareAttribute( "AsList",
        IsFiniteSetRep );

#! @Description
#!  The relation underlying a map between finite sets,
#!  i.e., <C>AsList( MapOfFinSets( S, <A>G</A>, T ) ) = <A>G</A></C>.
#! @Arguments G
#! @Returns a list
DeclareAttribute( "AsList",
        IsFiniteSetMapRep );

#! @Section Constructors

#! @Description
#!  Construct a finite set out of the list <A>L</A>, i.e.,
#!  an object in the &CAP; category <C>FinSets</C>.
#! @Arguments L
#! @Returns a &CAP; object
DeclareOperation( "FinSet",
        [ IsList ] );
#! @InsertSystem FinSet

#! @Description
#!  Construct a map $\phi:$<A>S</A>$\to$<A>T</A> of the finite sets <A>S</A> and <A>T</A>,
#!  i.e., a morphism in the &CAP; category <C>FinSets</C>, where <A>G</A>
#!  is a list of pairs in <A>S</A>$\times$<A>T</A> describing the graph of $\phi$.
#! @Arguments S, G, T
#! @Returns a &CAP; morphism
DeclareOperation( "MapOfFinSets",
        [ IsFiniteSetRep, IsList, IsFiniteSetRep ] );
#! @InsertSystem MapOfFinSets

#! @Section Tools

#! @Description
#!  Construct the embedding $\iota:$<A>S</A>$\to$<A>T</A> of the finite sets <A>S</A> and <A>T</A>,
#!  where <A>S</A> must be subset of <A>T</A>.
#! @Arguments S, T
#! @Returns a &CAP; morphism
DeclareOperation( "EmbeddingOfFinSets",
        [ IsFiniteSetRep, IsFiniteSetRep ] );

#! @Description
#!  Compute the preimage of <A>T_</A> under the morphism <A>f</A>.
#! @Arguments f, T_
#! @Returns a &CAP; object
DeclareOperation( "Preimage",
        [ IsFiniteSetMapRep, IsFiniteSetRep ] );

#! @Description
#!  Compute the image of <A>S_</A> under the morphism <A>f</A>.
#! @Arguments f, S_
#! @Returns a &CAP; object
DeclareOperation( "ImageObject",
        [ IsFiniteSetMapRep, IsFiniteSetRep ] );

#! @Description
#!  Construct the projection $\pi:$<A>S</A>$\to$<A>T</A> of the finite sets <A>S</A> and <A>T</A>,
#!  where <A>T</A> is a partition of <A>S</A>.
#! @Arguments S, T
#! @Returns a &CAP; morphism
DeclareOperation( "ProjectionOfFinSets",
        [ IsFiniteSetRep, IsFiniteSetRep ] );
