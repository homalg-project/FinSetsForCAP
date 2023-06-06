# SPDX-License-Identifier: GPL-2.0-or-later
# FinSetsForCAP: The elementary topos of (skeletal) finite sets
#
# Implementations
#

##
InstallMethod( CategoryOfSkeletalFinSetsWithMorphismsGivenByLists,
        "for no input",
        [ ],
        
  function ( )
    local object_constructor, object_datum,
          morphism_constructor, morphism_datum,
          skeletal_finsets_with_morphisms_given_by_functions,
          modeling_tower_object_constructor, modeling_tower_object_datum,
          modeling_tower_morphism_constructor, modeling_tower_morphism_datum,
          skeletal_finsets_with_morphisms_given_by_lists;
    
    ##
    object_constructor := function( cat, cardinality )
        
        return CreateCapCategoryObjectWithAttributes( cat,
                       Length, cardinality );
    
    end;
    
    ##
    object_datum := { cat, obj } ->  Length( obj );
    
    ##
    morphism_constructor := function( cat, source, list_of_images, range )
        
        return CreateCapCategoryMorphismWithAttributes( cat,
                       source,
                       range,
                       AsList, list_of_images );
        
    end;
    
    ##
    morphism_datum := { cat, mor } -> AsList( mor );
    
    ## building the categorical tower:
    skeletal_finsets_with_morphisms_given_by_functions :=
      CategoryOfSkeletalFinSetsWithMorphismsGivenByFunctions( : FinalizeCategory := true );
    
    ## from the raw object data to the object in the modeling category
    modeling_tower_object_constructor :=
      function( cat, cardinality )
        local skeletal_finsets_with_morphisms_given_by_functions;
        
        skeletal_finsets_with_morphisms_given_by_functions := ModelingCategory( cat );
        
        return ObjectConstructor( skeletal_finsets_with_morphisms_given_by_functions,
                       cardinality );
        
    end;
    
    ## from the object in the modeling category to the raw object data
    modeling_tower_object_datum := { cat, obj } -> Length( obj );
    
    ## from the raw morphism data to the morphism in the modeling category
    modeling_tower_morphism_constructor :=
      function( cat, source, list_of_images, range )
        local skeletal_finsets_with_morphisms_given_by_functions, f;
        
        skeletal_finsets_with_morphisms_given_by_functions := ModelingCategory( cat );
        
        f := CapJitTypedExpression(
                     i -> list_of_images[1 + i],
                     cat -> SkeletalFinSets_func_type );
        
        return MorphismConstructor( skeletal_finsets_with_morphisms_given_by_functions,
                       source,
                       f,
                       range );
        
    end;
    
    ## from the morphism in the modeling category to the raw morphism data
    modeling_tower_morphism_datum :=
      function( cat, mor )
        
        return List( [ 0 .. Length( Source( mor ) ) - 1 ], AsFunc( mor ) );
        
    end;
    
    skeletal_finsets_with_morphisms_given_by_lists :=
      ReinterpretationOfCategory( skeletal_finsets_with_morphisms_given_by_functions,
              rec( name := "SkeletalFinSets",
                   category_filter := IsCategoryOfSkeletalFinSetsWithMorphismsGivenByLists,
                   category_object_filter := IsObjectInCategoryOfSkeletalFinSetsWithMorphismsGivenByLists,
                   category_morphism_filter := IsMorphismInCategoryOfSkeletalFinSetsWithMorphismsGivenByLists,
                   object_constructor := object_constructor,
                   object_datum := object_datum,
                   morphism_constructor := morphism_constructor,
                   morphism_datum := morphism_datum,
                   modeling_tower_object_constructor := modeling_tower_object_constructor,
                   modeling_tower_object_datum := modeling_tower_object_datum,
                   modeling_tower_morphism_constructor := modeling_tower_morphism_constructor,
                   modeling_tower_morphism_datum := modeling_tower_morphism_datum,
                   only_primitive_operations := true,
                   ) : FinalizeCategory := false );
    
    # this is a workhorse category -> no logic and caching only via IsIdenticalObj
    CapCategorySwitchLogicOff( skeletal_finsets_with_morphisms_given_by_lists );
    
    SetRangeCategoryOfHomomorphismStructure( skeletal_finsets_with_morphisms_given_by_lists, skeletal_finsets_with_morphisms_given_by_lists );
    SetIsEquippedWithHomomorphismStructure( skeletal_finsets_with_morphisms_given_by_lists, true );
    
    ##
    AddIsEqualForMorphisms( skeletal_finsets_with_morphisms_given_by_lists,
      function ( cat, mor1, mor2 )
        
        return AsList( mor1 ) = AsList( mor2 );
        
    end );
    
    ## the function SKELETAL_FIN_SETS_IsEpimorphism
    ## has linear runtime complexity
    AddIsEpimorphism( skeletal_finsets_with_morphisms_given_by_lists,
      function ( cat, phi )
        local imgs, t;
        
        imgs := AsList( phi );
        
        t := Length( Range( phi ) );
        
        ## we do not have a linear purely functional test (yet),
        ## the following linear runtime function works with side effects,
        ## so we hide it from the compiler
        
        return not (false in SKELETAL_FIN_SETS_IsEpimorphism( imgs, t ));
        
    end );
    
    ##
    AddIsMonomorphism( skeletal_finsets_with_morphisms_given_by_lists,
      function ( cat, phi )
        local imgs, t;
        
        imgs := AsList( phi );
        
        t := Length( Range( phi ) );
        
        ## we do not have a linear purely functional test (yet),
        ## the following linear runtime function works with side effects,
        ## so we hide it from the compiler
        
        return SKELETAL_FIN_SETS_IsMonomorphism( imgs, t );
        
    end );
    
    ##
    AddUniversalMorphismFromCoproductWithGivenCoproduct( skeletal_finsets_with_morphisms_given_by_lists,
      function ( cat, L, test_object, tau, S )
        local concat;
        
        concat := Concatenation( List( tau, AsList ) );
        
        return MorphismConstructor( cat, S, concat, test_object );
        
    end );
    
    ##
    AddCoequalizer( skeletal_finsets_with_morphisms_given_by_lists,
     function ( cat, s, D )
        
        return ObjectConstructor( cat, BigInt( Length( SKELETAL_FIN_SETS_ExplicitCoequalizer( s, D ) ) ) );
        
    end );
    
    ##
    AddProjectionOntoCoequalizerWithGivenCoequalizer( skeletal_finsets_with_morphisms_given_by_lists,
      function ( cat, s, D, C )
        local Cq, cmp;
        
        Cq := SKELETAL_FIN_SETS_ExplicitCoequalizer( s, D );
        
        cmp := List( s, x -> -1 + BigInt( SafeUniquePositionProperty( Cq, c -> x in c ) ) );
        
        return MorphismConstructor( cat, s, cmp, C );
        
    end );
    
    ##
    AddUniversalMorphismFromCoequalizerWithGivenCoequalizer( skeletal_finsets_with_morphisms_given_by_lists,
      function ( cat, s, D, test_object, tau, C )
        local Cq;
        
        Cq := SKELETAL_FIN_SETS_ExplicitCoequalizer( s, D );
        
        return MorphismConstructor( cat, C, List( Cq, x -> tau( x[1] ) ), Range( tau ) );
        
    end );
    
    ##
    AddExactCoverWithGlobalElements( skeletal_finsets_with_morphisms_given_by_lists,
      function ( cat, A )
        local T;
        
        T := TerminalObject( cat );
        
        return List( [ 0 .. Length( A ) - 1 ], i ->
                     MorphismConstructor( cat,
                             T,
                             [ i ],
                             A ) );
        
    end );
    
    ##
    AddMorphismsOfExternalHom( skeletal_finsets_with_morphisms_given_by_lists,
      function ( cat, A, B )
        local hom_A_B, mors;
        
        hom_A_B := ExponentialOnObjects( cat, A, B );
        
        mors := ExactCoverWithGlobalElements( cat, hom_A_B );
        
        return List( mors,
                     mor -> CartesianLambdaElimination( cat,
                             A,
                             B,
                             mor ) );
        
    end, 1 + Sum( [ [ "ExponentialOnObjects", 1 ],
            [ "ExactCoverWithGlobalElements", 1 ],
            [ "CartesianLambdaElimination", 2 ] ],
            e -> e[2] * CurrentOperationWeight( skeletal_finsets_with_morphisms_given_by_lists!.derivations_weight_list, e[1] ) ) );
    
    if ValueOption( "no_precompiled_code" ) <> true then
        
        ADD_FUNCTIONS_FOR_CategoryOfSkeletalFinSetsWithMorphismsGivenByListsPrecompiled( skeletal_finsets_with_morphisms_given_by_lists );
        
    fi;
    
    Finalize( skeletal_finsets_with_morphisms_given_by_lists );
    
    return skeletal_finsets_with_morphisms_given_by_lists;
    
end );

##
InstallMethod( CategoryOfSkeletalFinSets, "for no input", [ ], CategoryOfSkeletalFinSetsWithMorphismsGivenByLists );

##
InstallOtherMethod( FinSet,
        "for a nonnegative integer",
        [ IsBigInt ],
        
  function ( n )
    
    return FinSet( SkeletalFinSets, n );
    
end );

##
InstallMethod( MapOfFinSets,
        "for two CAP skeletal finite sets and a list",
        [ IsObjectInCategoryOfSkeletalFinSetsWithMorphismsGivenByLists, IsList, IsObjectInCategoryOfSkeletalFinSetsWithMorphismsGivenByLists ],
        
  function ( s, list_of_images, t )
    
    return MorphismConstructor( CapCategory( s ), s, list_of_images, t );
    
end );

##
InstallMethod( AsFunc,
        "for a CAP map of skeletal finite sets",
        [ IsMorphismInCategoryOfSkeletalFinSetsWithMorphismsGivenByLists ],
        
  function ( map )
    local images;
    
    images := AsList( map );
    
    return i -> images[1 + i];
    
end );
