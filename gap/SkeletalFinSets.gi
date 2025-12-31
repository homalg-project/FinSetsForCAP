# SPDX-License-Identifier: GPL-2.0-or-later
# FinSetsForCAP: The (skeletal) elementary topos of finite sets
#
# Implementations
#

##
InstallMethod( SkeletalCategoryOfFiniteSets,
               [ ],
               
 FunctionWithNamedArguments(
  [
    [ "cartesian_monoidal_structure", true ],
    [ "cocartesian_monoidal_structure", false ],
    [ "FinalizeCategory", true ],
    [ "no_precompiled_code", false ],
    [ "overhead", true ],
  ],
  function ( CAP_NAMED_ARGUMENTS )
    local cat, expected_weight;
    
    cat := CreateCapCategoryWithDataTypes(
        "SkeletalFinSets", IsSkeletalCategoryOfFiniteSets,
        IsObjectInSkeletalCategoryOfFiniteSets, IsMorphismInSkeletalCategoryOfFiniteSets, IsCapCategoryTwoCell,
        IsBigInt, CapJitDataTypeOfListOf( IsBigInt ), fail
        : overhead := CAP_NAMED_ARGUMENTS.overhead
    );
    
    cat!.category_as_first_argument := true;
    
    cat!.supports_empty_limits := true;
    
    # this is a workhorse category -> no logic and caching only via IsIdenticalObj
    CapCategorySwitchLogicOff( cat );
    
    SetIsSkeletalCategory( cat, true );
    
    SetIsCategoryWithDecidableLifts( cat, true );
    SetIsCategoryWithDecidableColifts( cat, true );
    
    SetIsStrictCartesianCategory( cat, true );
    SetIsStrictCocartesianCategory( cat, true );
    
    if CAP_NAMED_ARGUMENTS.cartesian_monoidal_structure and not CAP_NAMED_ARGUMENTS.cocartesian_monoidal_structure then
        SetIsSymmetricMonoidalCategoryStructureGivenByDirectProduct( cat, true );
    elif CAP_NAMED_ARGUMENTS.cocartesian_monoidal_structure then
        SetIsSymmetricMonoidalCategoryStructureGivenByCoproduct( cat, true );
    fi;
    
    SetIsElementaryTopos( cat, true );
    
    SetRangeCategoryOfHomomorphismStructure( cat, cat );
    SetIsEquippedWithHomomorphismStructure( cat, true );
    
    #= comment for Julia
    AddTheoremFileToCategory( cat,
            Filename( DirectoriesPackageLibrary( "Toposes", "LogicForToposes" ), "PropositionsForToposes.tex" ) );
    # =#
    
    if CAP_NAMED_ARGUMENTS.no_precompiled_code then
        
        INSTALL_FUNCTIONS_FOR_SKELETAL_FIN_SETS( cat );
        
    else
        
        ADD_FUNCTIONS_FOR_SkeletalCategoryOfFiniteSetsWithMorphismsGivenByLists_precompiled( cat );
        
    fi;
    
    if CAP_NAMED_ARGUMENTS.FinalizeCategory then
        
        Finalize( cat );
        
        # check weights of operations using other primitive operations
        if CAP_NAMED_ARGUMENTS.no_precompiled_code then
            
            ##
            expected_weight := 1 + Sum( [ [ "ExponentialOnObjects", 1 ],
                                          [ "ExactCoverWithGlobalElements", 1 ],
                                          [ "PreComposeList", 2 ],
                                          [ "CartesianLambdaElimination", 2 ],
                                          [ "DirectProductToExponentialRightAdjunctMorphismWithGivenExponential", 2 ] ],
                                  e -> e[2] * CurrentOperationWeight( cat!.derivations_weight_list, e[1] ) );
            
            if CurrentOperationWeight( cat!.derivations_weight_list, "ExponentialOnMorphismsWithGivenExponentials" ) <> expected_weight then
                
                # COVERAGE_IGNORE_NEXT_LINE
                Print( "WARNING: please update the weight of ExponentialOnMorphismsWithGivenExponentials in SkeletalFinSetsForCAP to ", String( expected_weight ), "\n" );
                
            fi;
            
            ##
            expected_weight := 1 + Sum( [ [ "ExponentialOnObjects", 1 ],
                                          [ "ExactCoverWithGlobalElements", 1 ],
                                          [ "CartesianLambdaElimination", 2 ] ],
                                  e -> e[2] * CurrentOperationWeight( cat!.derivations_weight_list, e[1] ) );
            
            if CurrentOperationWeight( cat!.derivations_weight_list, "MorphismsOfExternalHom" ) <> expected_weight then
                
                # COVERAGE_IGNORE_NEXT_LINE
                Print( "WARNING: please update the weight of MorphismsOfExternalHom in SkeletalFinSetsForCAP to ", String( expected_weight ), "\n" );
                
            fi;
            
        fi;
        
    fi;
    
    return cat;
    
end ) );

##
InstallMethod( FinSetOp,
        "for a skeletal category of finite sets and a nonnegative integer",
        [ IsSkeletalCategoryOfFiniteSets, IsBigInt ],
        
  function ( cat, n )
    
    return ObjectConstructor( cat, n );
    
end );

##
InstallOtherMethod( FinSet,
        "for a nonnegative integer",
        [ IsBigInt ],
        
  function ( n )
    
    return FinSet( SkeletalFinSets, n );
    
end );

##
InstallMethod( AsList,
        "for an object in a skeletal category of finite sets",
        [ IsObjectInSkeletalCategoryOfFiniteSets ],
        
  function ( s )
    
    return [ 0 .. Cardinality( s ) - 1 ];
    
end );

##
InstallMethod( ListOp,
        "for an object in a skeletal category of finite sets and a function",
        [ IsObjectInSkeletalCategoryOfFiniteSets, IsFunction ],
        
  function ( s, f )
    
    return List( AsList( s ), x -> f(x) );
    
end );

## Morphisms

##
InstallMethod( MapOfFinSets,
        "for two objects in a skeletal category of finite sets and a list",
        [ IsObjectInSkeletalCategoryOfFiniteSets, IsList, IsObjectInSkeletalCategoryOfFiniteSets ],
        
  function ( s, G, t )
    
    return MapOfFinSets( CapCategory( s ), s, G, t );
    
end );

##
InstallOtherMethod( MapOfFinSets,
        "for a skeletal category of finite sets, two objects therein and a list",
        [ IsSkeletalCategoryOfFiniteSets, IsObjectInSkeletalCategoryOfFiniteSets, IsList, IsObjectInSkeletalCategoryOfFiniteSets ],
        
  function ( cat, s, G, t )
    
    return MorphismConstructor( cat, s, G, t );
    
end );

##
InstallMethod( EmbeddingOfFinSets,
        "for two objects in a skeletal category of finite sets",
        [ IsObjectInSkeletalCategoryOfFiniteSets, IsObjectInSkeletalCategoryOfFiniteSets ],
        
  function ( s, t )
    local iota;
    
    iota := MapOfFinSets( s, AsList( s ), t );
    
    Assert( 3, IsMonomorphism( iota ) );
    SetIsMonomorphism( iota, true );
    
    return iota;
    
end );

##
InstallOtherMethod( Preimage,
        "for two lists",
        [ IsList, IsList ],
        
  function ( images, t )
    local positions;
    
    positions := PositionsProperty( images, x -> x in t );
    
    return List( positions, i -> BigInt( -1 + i ) );
    
end );

##
InstallMethod( Preimage,
        "for a morphism in a skeletal category of finite sets and a list",
        [ IsMorphismInSkeletalCategoryOfFiniteSets, IsList ],
        
  function ( phi, t )
    
    return Preimage( AsList( phi ), t );
    
end );

##
InstallMethod( ImageObject,
        "for a morphism and an object in a skeletal category of finite sets",
        [ IsMorphismInSkeletalCategoryOfFiniteSets, IsObjectInSkeletalCategoryOfFiniteSets ],
        
  function ( phi, s_ )
    
    return ImageObject( PreCompose( EmbeddingOfFinSets( s_, Source( phi ) ), phi ) );
    
end );

##
InstallMethod( CallFuncList,
        "for a morphism in a skeletal category of finite sets and a list",
        [ IsMorphismInSkeletalCategoryOfFiniteSets, IsList ],
        
  function ( phi, L )
    local x;
    
    x := L[1];
    
    return AsList( phi )[1 + x];
    
end );

##
InstallGlobalFunction( SKELETAL_FIN_SETS_ExplicitCoequalizer,
  function ( s, D )
    local T, Cq, t, L, i;
    
    T := [ 0 .. s - 1 ];
    
    Cq := [ ];
    
    while not IsEmpty( T ) do
        t := T[1];
        t := Union( List( D, f_j -> f_j{1 + Union( List( D, f_i -> Preimage( f_i, [ t ] ) ) )} ) );
        if IsEmpty( t ) then
            t := [ T[1] ];
        fi;
        Add( Cq, t );
        T := Difference( T, t );
    od;
    
    T := [ 0 .. s - 1 ];
    
    if Concatenation( Cq ) <> T then
        for t in T do
            L := [ ];
            for i in [ 1 .. Length( Cq ) ] do
                if t in Cq[i] then
                    Add( L, Cq[i] );
                fi;
            od;
            if Length( L ) > 1 then
                Cq := Difference( Cq, L );
                Add( Cq, Set( Concatenation( L ) ) );
            fi;
        od;
    fi;
    
    return Set( Cq );
    
end );

##
InstallGlobalFunction( SKELETAL_FIN_SETS_IsEpimorphism,
  function ( imgs, t )
    local testList, img;
    
    testList := ListWithIdenticalEntries( t, false );
    
    for img in imgs do
        testList[1 + img] := true;
    od;
    
    return testList;
    
end );

##
InstallGlobalFunction( SKELETAL_FIN_SETS_IsMonomorphism,
  function ( imgs, t )
    local testList, img;
    
    testList := ListWithIdenticalEntries( t, false );
    
    for img in imgs do
        if testList[1 + img] then
            return false;
        fi;
        testList[1 + img] := true;
    od;
    
    return true;
    
end );

##
InstallGlobalFunction( INSTALL_FUNCTIONS_FOR_SKELETAL_FIN_SETS,
  function ( SkeletalFinSets )
    
##
AddObjectConstructor( SkeletalFinSets,
  function ( cat, n )
    local int;
    
    int := CreateCapCategoryObjectWithAttributes( cat, Cardinality, n );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 4, IsWellDefined( int ) );
    
    return int;
    
end );

##
AddObjectDatum( SkeletalFinSets,
  function ( cat, n )
    
    return Cardinality( n );
    
end );

##
AddMorphismConstructor( SkeletalFinSets,
  function ( cat, source, images, range )
    local map;
    
    map := CreateCapCategoryMorphismWithAttributes( cat,
            source,
            range,
            AsList, images );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 4, IsWellDefined( map ) );
    
    return map;
    
end );

##
AddMorphismDatum( SkeletalFinSets,
  function ( cat, map )
    
    return AsList( map );
    
end );

##
AddIsWellDefinedForObjects( SkeletalFinSets,
  function ( cat, n )
    
    return IsBigInt( Cardinality( n ) ) and
           Cardinality( n ) >= 0;
    
end );

##
AddIsEqualForObjects( SkeletalFinSets,
  function ( cat, n1, n2 )
    
    return Cardinality( n1 ) = Cardinality( n2 );
    
end );

##
AddIsWellDefinedForMorphisms( SkeletalFinSets,
  function ( cat, mor )
    local s, rel, t;
    
    s := Cardinality( Source( mor ) );
    
    rel := AsList( mor );
    
    t := Cardinality( Range( mor ) );
    
    return ForAll( rel, a -> IsBigInt( a ) and a >= 0 ) and
           s = Length( rel ) and
           ForAll( rel, a -> a < t );
    
end );

##
AddIsEqualForMorphisms( SkeletalFinSets,
  function ( cat, mor1, mor2 )
    
    return AsList( mor1 ) = AsList( mor2 );
    
end );

##
AddIdentityMorphism( SkeletalFinSets,
  function ( cat, n )
    
    return MorphismConstructor( cat, n, [ 0 .. Cardinality( n ) - 1 ], n );
    
end );

##
AddPreCompose( SkeletalFinSets,
  function ( cat, map_pre, map_post )
    local s, t, im_pre, im_post, cmp;
    
    s := Source( map_pre );
    t := Range( map_post );
    
    im_pre := AsList( map_pre );
    im_post := AsList( map_post );
    
    cmp := List( s, i -> im_post[1 + im_pre[1 + i]] );
    
    return MorphismConstructor( cat, s, cmp, t );
    
end );

## the function SKELETAL_FIN_SETS_IsEpimorphism
## has linear runtime complexity
AddIsEpimorphism( SkeletalFinSets,
  function ( cat, phi )
    local imgs, t;
    
    imgs := AsList( phi );
    
    t := Cardinality( Range( phi ) );
    
    ## we do not have a linear purely functional test (yet),
    ## the following linear runtime function works with side effects,
    ## so we hide it from the compiler
    
    return not (false in SKELETAL_FIN_SETS_IsEpimorphism( imgs, t ));
    
end );

##
AddIsSplitEpimorphism( SkeletalFinSets,
  { cat, phi } -> IsEpimorphism( cat, phi ) );

##
AddIsMonomorphism( SkeletalFinSets,
  function ( cat, phi )
    local imgs, t;
    
    imgs := AsList( phi );
    
    t := Cardinality( Range( phi ) );
    
    ## we do not have a linear purely functional test (yet),
    ## the following linear runtime function works with side effects,
    ## so we hide it from the compiler
    
    return SKELETAL_FIN_SETS_IsMonomorphism( imgs, t );
    
end );

##
AddIsSplitMonomorphism( SkeletalFinSets,
  function ( cat, phi )
    return IsInitial( cat, Range( phi ) ) or ( not IsInitial( cat, Source( phi ) ) and IsMonomorphism( cat, phi ) );
end );

##
AddIsLiftable( SkeletalFinSets,
  function ( cat, f, g )
    local ff, gg, fff;
    
    ff := AsList( f );
    gg := AsList( g );
    
    if 100 * Length( ff ) < Length( gg ) then
        fff := Set( ff );
    else ## this is for CompilerForCAP
        fff := ff;
    fi;
    
    return ForAll( fff, y -> y in gg );
    
end );

##
AddLift( SkeletalFinSets,
  function ( cat, f, g )
    local S, T, gg, ff;
    
    S := Source( f );
    T := Source( g );
    
    gg := AsList( g );
    ff := AsList( f );
    
    return MorphismConstructor( cat, S, List( S, x -> -1 + BigInt( SafePosition( gg, ff[1 + x] ) ) ), T );
    
end );

## g \circ f^{-1} is again an ordinary function,
## i.e., fibers of f are mapped under g to the same element
AddIsColiftable( SkeletalFinSets,
  function ( cat, f, g )
    local ff, gg;
    
    ff := AsList( f );
    gg := AsList( g );
    
    ## Range( g ) initial implies Range( f ) initial
    if IsInitial( cat, Range( g ) ) and not IsInitial( cat, Range( f ) ) then
        return false;
    else
        return ForAll( Set( ff ), i -> Length( Set( gg{Positions( ff, i )} ) ) = 1 );
    fi;
    
end );

##
AddColift( SkeletalFinSets,
  function ( cat, f, g )
    local S, T, ff, gg, chi;
    
    S := Range( f );
    T := Range( g );
    
    ff := AsList( f );
    gg := AsList( g );
    
    chi :=
      function ( y )
        if not y in ff then
            return BigInt( 0 );
        fi;
        return gg[SafePosition( ff, y )];
    end;
    
    return MorphismConstructor( cat, S, List( S, y -> chi(y) ), T );
    
end );

##
AddImageEmbedding( SkeletalFinSets,
  function ( cat, phi )
    local map;
    
    map := Set( AsList( phi ) );
    
    return MorphismConstructor( cat, ObjectConstructor( cat, BigInt( Length( map ) ) ), map, Range( phi ) );
    
end );

##
AddAstrictionToCoimage( SkeletalFinSets,
  function ( cat, phi )
    local L, map;
    
    L := AsList( phi );
    
    ## unlike ImageObject which is a subobject of the range,
    ## the CoimageObject is a factor object of the source,
    ## and we want to retain the sorting of the source:
    map := DuplicateFreeList( L );
    
    return MorphismConstructor( cat, ObjectConstructor( cat, BigInt( Length( map ) ) ), map, Range( phi ) );
    
end );

## Limits

##
AddIsTerminal( SkeletalFinSets,
  function ( cat, M )
    
    return Cardinality( M ) = 1;
    
end );

##
AddTerminalObject( SkeletalFinSets,
  function ( cat )
    
    return ObjectConstructor( cat, BigInt( 1 ) );
    
end );

##
AddUniversalMorphismIntoTerminalObjectWithGivenTerminalObject( SkeletalFinSets,
  function ( cat, m, t )
    
    return MorphismConstructor( cat, m, ListWithIdenticalEntries( Cardinality( m ), BigInt( 0 ) ), t );
    
end );

##
AddDirectProduct( SkeletalFinSets,
  function ( cat, L )
    
    return ObjectConstructor( cat, Product( List( L, Cardinality ) ) );
    
end );

##
AddProjectionInFactorOfDirectProductWithGivenDirectProduct( SkeletalFinSets,
  function ( cat, D, k, P )
    local T, d, a, b, p;
    
    T := D[k];
    
    d := Cardinality( T );
    
    a := Product( List( D{[ 1 .. k - 1 ]}, Cardinality ) );
    b := Product( List( D{[ k + 1 .. Length( D ) ]}, Cardinality ) );
    
    p := Cardinality( P );
    
    return MorphismConstructor( cat, P, List( P, i -> RemIntWithDomain( QuoIntWithDomain( i, a, p ), d, DivIntWithGivenQuotient( p, a, d * b ) ) ), T );
    
end );

##
AddUniversalMorphismIntoDirectProductWithGivenDirectProduct( SkeletalFinSets,
  function ( cat, D, T, tau, P )
    local l, d, dd, taus;
    
    l := Length( D );
    
    d := List( D, Cardinality );
    
    dd := List( [ 1 .. l ], j -> Product( d{[ 1 .. j - 1 ]} ) );
    
    taus := List( tau, AsList );
    
    # if l = 0, then Sum( [ 1 .. l ], j -> ... ) = 0 ∈ TerminalObject = P
    return MorphismConstructor( cat, T, List( T, i -> Sum( [ 1 .. l ], j -> taus[j][1 + i] * dd[j] ) ), P );
    
end );

##
AddEqualizer( SkeletalFinSets,
  function ( cat, s, D )
    local D2, Eq;
    
    D2 := List( D, AsList );
    
    Eq := Filtered( [ 0 .. Cardinality( s ) - 1 ], x -> ForAll( [ 1 .. Length( D ) - 1 ], j -> D2[j][1 + x] = D2[j + 1][1 + x] ) );
    
    return ObjectConstructor( cat, BigInt( Length( Eq ) ) );
    
end );

##
AddEmbeddingOfEqualizerWithGivenEqualizer( SkeletalFinSets,
  function ( cat, s, D, E )
    local D2, Eq;
    
    D2 := List( D, AsList );
    
    Eq := Filtered( [ 0 .. Cardinality( s ) - 1 ], x -> ForAll( [ 1 .. Length( D ) - 1 ], j -> D2[j][1 + x] = D2[j + 1][1 + x] ) );
    
    return MorphismConstructor( cat, E, Eq, s );
    
end );

##
AddUniversalMorphismIntoEqualizerWithGivenEqualizer( SkeletalFinSets,
  function ( cat, s, D, test_object, tau, E )
    local D2, Eq, t;
    
    D2 := List( D, AsList );
    
    Eq := Filtered( [ 0 .. Cardinality( s ) - 1 ], x -> ForAll( [ 1 .. Length( D ) - 1 ], j -> D2[j][1 + x] = D2[j + 1][1 + x] ) );
    
    t := AsList( tau );
    
    return MorphismConstructor( cat, test_object, List( test_object, x -> -1 + BigInt( SafePosition( Eq, t[1 + x] ) ) ), E );
    
end );


## Colimits

##
AddIsInitial( SkeletalFinSets,
  function ( cat, M )
    
    return Cardinality( M ) = 0;
    
end );

##
AddInitialObject( SkeletalFinSets,
  function ( cat )
    
    return ObjectConstructor( cat, BigInt( 0 ) );
    
end );

##
AddUniversalMorphismFromInitialObjectWithGivenInitialObject( SkeletalFinSets,
  function ( cat, m, I )
    
    return MorphismConstructor( cat, I, CapJitTypedExpression( [ ], { } -> CapJitDataTypeOfListOf( IsBigInt ) ), m );
    
end );

##
AddIsProjective( SkeletalFinSets,
  function ( cat, M )
    
    return true;
    
end );

##
AddEpimorphismFromSomeProjectiveObject( SkeletalFinSets,
  { cat, m } -> IdentityMorphism( cat, m ) );

##
AddIsInjective( SkeletalFinSets,
  function ( cat, M )
    
    return not IsInitial( cat, M );
    
end );

##
AddSomeInjectiveObject( SkeletalFinSets,
  function ( cat, M )
    
    if IsInitial( cat, M ) then
        
        return TerminalObject( cat );
        
    else
        
        return M;
        
    fi;
    
end );

##
AddMonomorphismIntoSomeInjectiveObjectWithGivenSomeInjectiveObject( SkeletalFinSets,
  function ( cat, M, injective_object )
    
    return MorphismConstructor( cat, M, [ 0 .. Cardinality( M ) - 1 ], injective_object );
    
end );

##
AddCoproduct( SkeletalFinSets,
  function ( cat, L )
    
    return ObjectConstructor( cat, Sum( List( L, Cardinality ) ) );
    
end );

##
AddInjectionOfCofactorOfCoproductWithGivenCoproduct( SkeletalFinSets,
  function ( cat, L, i, coproduct )
    local O, sum, s;
    
    O := L{[ 1 .. i - 1 ]};
    
    sum := Sum( List( O, Cardinality ) );
    
    s := L[i];
    
    return MorphismConstructor( cat, s, [ sum .. sum + Cardinality( s ) - 1 ], coproduct );
    
end );

##
AddUniversalMorphismFromCoproductWithGivenCoproduct( SkeletalFinSets,
  function ( cat, L, test_object, tau, S )
    local concat;
    
    concat := Concatenation( List( tau, AsList ) );
    
    return MorphismConstructor( cat, S, concat, test_object );
    
end );

##
AddCoequalizer( SkeletalFinSets,
  function ( cat, s, D )
    
    return ObjectConstructor( cat, BigInt( Length( SKELETAL_FIN_SETS_ExplicitCoequalizer( Cardinality( s ), List( D, AsList ) ) ) ) );
    
end );

##
AddProjectionOntoCoequalizerWithGivenCoequalizer( SkeletalFinSets,
  function ( cat, s, D, C )
    local Cq, cmp;
    
    Cq := SKELETAL_FIN_SETS_ExplicitCoequalizer( Cardinality( s ), List( D, AsList ) );
    
    cmp := List( s, x -> -1 + BigInt( SafeUniquePositionProperty( Cq, c -> x in c ) ) );
    
    return MorphismConstructor( cat, s, cmp, C );
    
end );

##
AddUniversalMorphismFromCoequalizerWithGivenCoequalizer( SkeletalFinSets,
  function ( cat, s, D, test_object, tau, C )
    local Cq;
    
    Cq := SKELETAL_FIN_SETS_ExplicitCoequalizer( Cardinality( s ), List( D, AsList ) );
    
    return MorphismConstructor( cat, C, List( Cq, x -> AsList( tau )[1 + x[1]] ), Range( tau ) );
    
end );

## The cartesian monoidal structure

##
AddCartesianLeftUnitorWithGivenDirectProduct( SkeletalFinSets,
  function ( cat, M, TM )
    
    return IdentityMorphism( cat, M );
    
end );

##
AddCartesianLeftUnitorInverseWithGivenDirectProduct( SkeletalFinSets,
  function ( cat, M, TM )
    
    return IdentityMorphism( cat, M );
    
end );

##
AddCartesianRightUnitorWithGivenDirectProduct( SkeletalFinSets,
  function ( cat, M, MT )
    
    return IdentityMorphism( cat, M );
    
end );

##
AddCartesianRightUnitorInverseWithGivenDirectProduct( SkeletalFinSets,
  function ( cat, M, MT )
    
    return IdentityMorphism( cat, M );
    
end );

##
AddExponentialOnObjects( SkeletalFinSets,
  function ( cat, M, N )
    local m, n;
    
    m := Cardinality( M );
    n := Cardinality( N );
    
    return ObjectConstructor( cat, n ^ m );
    
end );

## A special case of ExponentialToDirectProductRightAdjunctMorphism for A = 𝟙 = TerminalObject
## InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism
## (g: 𝟙 → Bᴸ) ↦ (f: L = L × 𝟙 → B)
AddCartesianLambdaElimination( SkeletalFinSets,
  function ( cat, L, B, g )
    local l, b, v;
    
    l := Cardinality( L );
    b := Cardinality( B );
    
    v := AsList( g )[1];
    
    return MorphismConstructor( cat,
                   L,
                   List( [ 0 .. l - 1 ], i -> DigitInPositionalNotation( v, i, l, b ) ),
                   B );
    
end );

## base-change from b^l to b:
## (g: A → Bᴸ) ↦ (f: L × A → B)
AddExponentialToDirectProductRightAdjunctMorphismWithGivenDirectProduct( SkeletalFinSets,
  function ( cat, L, B, g, LxA )
    local l, b, g_map, la;
    
    l := Cardinality( L );
    b := Cardinality( B );
    la := Cardinality( LxA );
    
    g_map := AsList( g );
    
    return MorphismConstructor( cat,
                   LxA,
                   List( LxA, i ->
                         DigitInPositionalNotation(
                                 g_map[1 + QuoIntWithDomain( i, l, la )],
                                 RemIntWithDomain( i, l, la ),
                                 l,
                                 b ) ),
                   B );
    
end );

## base-change from b to b^l:
## (f: L × A → B) ↦ (g: A → Bᴸ)
AddDirectProductToExponentialRightAdjunctMorphismWithGivenExponential( SkeletalFinSets,
  function ( cat, L, A, f, expLB )
    local B, l, b, f_map;
    
    B := Range( f );
    
    l := Cardinality( L );
    b := Cardinality( B );
    
    f_map := AsList( f );
    
    return MorphismConstructor( cat,
                   A,
                   List( A, i ->
                         Sum( List( L, k ->
                                 f_map[1 + k + i * l] * b^k ) ) ),
                   expLB );
    
end );

##
AddExactCoverWithGlobalElements( SkeletalFinSets,
  function ( cat, A )
    local T;
    
    T := TerminalObject( cat );
    
    return List( [ 0 .. Cardinality( A ) - 1 ], i -> MorphismConstructor( cat, T, [ i ], A ) );
    
end );

##
AddExponentialOnMorphismsWithGivenExponentials( SkeletalFinSets,
  function ( cat, S, alpha, beta, T )
    local source_alpha, range_beta, M, N, MN, mors;
    
    source_alpha := Source( alpha );
    range_beta := Range( beta );
    
    M := Range( alpha );
    N := Source( beta );
    
    MN := ExponentialOnObjects( cat, M, N );
    
    mors := ExactCoverWithGlobalElements( cat, MN );
    
    return MorphismConstructor( cat,
                   S,
                   List( mors, mor ->
                         AsList( CartesianLambdaIntroduction( cat,
                                 PreComposeList( cat,
                                         source_alpha,
                                         [ alpha,
                                           CartesianLambdaElimination( cat,
                                                   M,
                                                   N,
                                                   mor ),
                                           beta ],
                                         range_beta ) ) )[1 + 0] ),
                   T );
    
end, 1403 ); # weight = 1 + Sum(
             # [ [ "ExponentialOnObjects", 1 ],
             # [ "ExactCoverWithGlobalElements", 1 ],
             # [ "PreComposeList", 2 ],
             # [ "CartesianLambdaElimination", 2 ],
             # [ "DirectProductToExponentialRightAdjunctMorphismWithGivenExponential", 2 ] ],
             # e -> e[2] * CurrentOperationWeight( SkeletalFinSets!.derivations_weight_list, e[1] ) )

## Bᴸ × L → B
AddCartesianLeftEvaluationMorphismWithGivenSource( SkeletalFinSets,
  function ( cat, L, B, HL_BxL )
    local l, b, s, exp, eval;
    
    l := Cardinality( L );
    b := Cardinality( B );
    
    s := Cardinality( HL_BxL );
    
    exp := b ^ l;
    
    ## (f,i) ↦ f(i)
    eval :=
      function( f_i ) ## (f,i)
        local i, f;
        
        ## lhs
        f := RemIntWithDomain( f_i, exp, s ); ## ∈ { 0, ..., exp - 1 }
        
        ## rhs
        i := QuoIntWithDomain( f_i, exp, s ); ## ∈ { 0, ..., l - 1 }
        
        return DigitInPositionalNotation( f, i, l, b ); ## f(i)
    end;
    
    ## (i,f) ↦ f(i)
    return MorphismConstructor( cat,
                   HL_BxL,
                   List( [ 0 .. s - 1 ], eval ),
                   B );
    
end );

##
AddCartesianLeftCoevaluationMorphismWithGivenRange( SkeletalFinSets,
  function ( cat, L, B, HL_BxL )
    local l, b, bl;
    
    l := Cardinality( L );
    b := Cardinality( B );
    
    bl := b * l;
    
    #return MorphismConstructor( cat, B, List( [ 0 .. b - 1 ], i -> Sum( [ 0 .. l - 1 ], j -> ( i + b * j ) * (b*l)^j ) ), HL_BxL );
    
    return MorphismConstructor( cat, B, List( [ 0 .. b - 1 ], i -> i * GeometricSum( bl, l ) + b * bl * GeometricSumDiff1( bl, l ) ), HL_BxL );
    
end );

##
AddSubobjectClassifier( SkeletalFinSets,
  function ( cat )
      
      return ObjectConstructor( cat, BigInt( 2 ) );
      
end );

##
AddClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier( SkeletalFinSets,
  function ( cat, monomorphism, Omega )
    local range, images, chi;
    
    range := Range( monomorphism );
    
    images := AsList( monomorphism );
    
    chi := List( range, x -> BoolToBigInt( x in images ) );
    
    return MorphismConstructor( cat, range, chi, Omega );
    
end );

##
AddMorphismsOfExternalHom( SkeletalFinSets,
  function ( cat, A, B )
    local hom_A_B, mors;
    
    hom_A_B := ExponentialOnObjects( cat, A, B );
    
    mors := ExactCoverWithGlobalElements( cat, hom_A_B );
    
    return List( mors,
                 mor -> CartesianLambdaElimination( cat,
                         A,
                         B,
                         mor ) );
    
end, 401 ); # weight = 1 + Sum( [
            # [ "ExponentialOnObjects", 1 ],
            # [ "ExactCoverWithGlobalElements", 1 ],
            # [ "CartesianLambdaElimination", 2 ] ],
            # e -> e[2] * CurrentOperationWeight( SkeletalFinSets!.derivations_weight_list, e[1] ) ) );

end );

#####

##
AddDerivationToCAP( IsHomSetInhabited,
        "IsHomSetInhabited using IsInitial when the range category of the homomorphism structure is the skeletal category of finite sets",
        [ [ HomomorphismStructureOnObjects, 1 ],
          [ IsInitial, 1, RangeCategoryOfHomomorphismStructure ] ],
        
  function ( cat, a, b )
    local range_cat;
    
    range_cat := RangeCategoryOfHomomorphismStructure( cat );
    
    return not IsInitial( range_cat,
                   HomomorphismStructureOnObjects( cat, a, b ) );
    
end : CategoryGetters := rec( range_cat := RangeCategoryOfHomomorphismStructure ),
CategoryFilter :=
  function ( cat )
    return HasRangeCategoryOfHomomorphismStructure( cat ) and
           IsSkeletalCategoryOfFiniteSets( RangeCategoryOfHomomorphismStructure( cat ) );
end );

## backwards compatibility
InstallOtherMethod( Length,
        "for an object in a skeletal category of finite sets",
        [ IsObjectInSkeletalCategoryOfFiniteSets ],
        
  function ( s )
    
    return Cardinality( s );
    
end );

##
InstallMethod( String,
        "for an object in a skeletal category of finite sets",
        [ IsObjectInSkeletalCategoryOfFiniteSets ],
        
  function ( s )
    
    return Concatenation( "FinSet( SkeletalFinSets, ", String( Cardinality( s ) ), " )" );
    
end );

##
InstallMethod( String,
        "for a morphism in a skeletal category of finite sets",
        [ IsMorphismInSkeletalCategoryOfFiniteSets ],
        
  function ( phi )
    
    return Concatenation( "MapOfFinSets( SkeletalFinSets, ", String( Source( phi ) ), ", ", String( AsList( phi ) ), ", ", String( Range( phi ) ), " )" );
    
end );

##
InstallMethod( ViewString,
        "for an object in a skeletal category of finite sets",
        [ IsObjectInSkeletalCategoryOfFiniteSets ],
        
  function ( s )
    
    return Concatenation( "|", String( Cardinality( s ) ), "|" );
    
end );

##
InstallMethod( ViewString,
        "for a morphism in a skeletal category of finite sets",
        [ IsMorphismInSkeletalCategoryOfFiniteSets ],
        
  function ( phi )
    local arrow;
    
    if HasIsIsomorphism( phi ) and IsIsomorphism( phi ) then
        
        arrow := "⭇";
        
    elif HasIsMonomorphism( phi ) and IsMonomorphism( phi ) then
        
        arrow := "↪";
        
    elif HasIsEpimorphism( phi ) and IsEpimorphism( phi ) then
        
        arrow := "↠";
        
    else
        
        arrow := "→";
        
    fi;
    
    return Concatenation( ViewString( Source( phi ) ), " ", arrow, " ", ViewString( Range( phi ) ) );
    
end );

# We want lists of skeletal finite sets and maps to be displayed in a "fancy" way.
# Since `Display` of list redirects to `Print`, we have to make `PrintString` "fancy",
# even if the documentation of `PrintString` suggests that it should not be "fancy".

##
InstallMethod( PrintString,
        "for an object in a skeletal category of finite sets",
        [ IsObjectInSkeletalCategoryOfFiniteSets ],
        
  function ( s )
    local l, string;
    
    l := Cardinality( s );
    
    if l = 0 then
        return "∅";
    elif l = 1 then
        return "{ 0 }";
    elif l = 2 then
        return "{ 0, 1 }";
    elif l = 3 then
        return "{ 0, 1, 2 }";
    fi;
    
    return Concatenation( "{ 0,..., ", String( l - 1 ), " }" );
    
end );

##
InstallMethod( PrintString,
        "for a morphism in a skeletal category of finite sets",
        [ IsMorphismInSkeletalCategoryOfFiniteSets ],
        
  function ( phi )
    
    return Concatenation(
                   PrintString( Source( phi ) ),
                   " ⱶ", PrintString( AsList( phi ) ), "→ ",
                   PrintString( Range( phi ) ) );
    
end );

##
InstallMethod( DisplayString,
        "for an object in a skeletal category of finite sets",
        [ IsObjectInSkeletalCategoryOfFiniteSets ],
        
  function ( s )
    
    return Concatenation( PrintString( s ), "\n" );
    
end );

##
InstallMethod( DisplayString,
        "for a morphism in a skeletal category of finite sets",
        [ IsMorphismInSkeletalCategoryOfFiniteSets ],
        
  function ( phi )
    
    return Concatenation( PrintString( phi ), "\n" );
    
end );
