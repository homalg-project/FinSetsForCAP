#
# FinSetsForCAP: The elementary topos of finite sets
#
# Declarations
#

#! @Chapter The skeletal category of G-sets

DeclareRepresentation( "IsSkeletalGSetRep",
        IsAttributeStoringRep and
        IsCapCategoryObjectRep and
	IsCellOfSkeletalCategory,
        [ ] );

BindGlobal( "TheTypeOfSkeletalGSets",
         NewType( TheFamilyOfCapCategoryObjects,
                 IsSkeletalGSetRep ) );

DeclareRepresentation( "IsSkeletalGSetMapRep",
        IsAttributeStoringRep and
        IsCapCategoryMorphismRep,
        [ ] );

BindGlobal( "TheTypeOfMapsOfSkeletalGSets",
         NewType( TheFamilyOfCapCategoryMorphisms,
                 IsSkeletalGSetMapRep ) );


#! @Section Constructors

#! @Description
#!  Construct an object in the skeletal category of G sets
#!  out of the group <A>G</A> and a List <A>L</A>, i.e.,
#!  an object in the &CAP; category <C>SkeletalGSets</C>.
#! @Arguments G, M
#! @Returns a &CAP; object
DeclareOperation( "GSet",
        [ IsGroup, IsList ] );
#! @InsertSystem GSet

#! @Description
#!  Construct a map $\phi:$<A>s</A>$\to$<A>t</A> of the skeletal G sets <A>s</A> and <A>t</A>,
#!  i.e., a morphism in the &CAP; category <C>SkeletalGSets</C>, where <A>G</A>
#!  is a list of XXX describing the graph of $\phi$.
#! @Arguments s, G, t
#! @Returns a &CAP; morphism
DeclareOperation( "MapOfGSets",
        [ IsSkeletalGSetRep, IsList, IsSkeletalGSetRep ] );
#! @InsertSystem  MapOfGSets

#! @Section Tools

