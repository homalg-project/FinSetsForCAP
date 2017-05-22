#
# FinSetsForCAP: The elementary topos of finite sets
#
# Declarations
#

#! @Description
#!  

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

DeclareAttribute( "UnderlyingGAPFinSet",
        IsFiniteSetRep );

DeclareOperation( "FinSet",
        [ IsList ] );

DeclareAttribute( "UnderlyingRelation",
        IsFiniteSetRep );

DeclareOperation( "MapOfFinSets",
        [ IsFiniteSetRep, IsList, IsFiniteSetRep ] );

DeclareGlobalFunction( "ImageFinSet" );

