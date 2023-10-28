# SPDX-License-Identifier: GPL-2.0-or-later
# FinSetsForCAP: The elementary topos of (skeletal) finite sets
#
# Implementations
#

##
InstallMethod( SkeletalCategoryOfFiniteSets,
               [ ],
               
  function ( )
    local cat;
    
    cat := CreateCapCategoryWithDataTypes(
        "SkeletalFinSets", IsSkeletalCategoryOfFiniteSets,
        IsObjectInSkeletalCategoryOfFiniteSets, IsMorphismInSkeletalCategoryOfFiniteSets, IsCapCategoryTwoCell,
        IsBigInt, CapJitDataTypeOfListOf( IsBigInt ), fail
    );
    
    cat!.category_as_first_argument := true;
    
    cat!.supports_empty_limits := true;
    
    # this is a workhorse category -> no logic and caching only via IsIdenticalObj
    CapCategorySwitchLogicOff( cat );
    
    SetIsSkeletalCategory( cat, true );
    
    SetIsElementaryTopos( cat, true );
    
    SetRangeCategoryOfHomomorphismStructure( cat, cat );
    SetIsEquippedWithHomomorphismStructure( cat, true );
    
    INSTALL_FUNCTIONS_FOR_SKELETAL_FIN_SETS( cat );
    
    #= comment for Julia
    AddTheoremFileToCategory( cat,
            Filename( DirectoriesPackageLibrary( "Toposes", "LogicForToposes" ), "PropositionsForToposes.tex" ) );
    # =#
    
    if ValueOption( "no_precompiled_code" ) <> true then
        
        ADD_FUNCTIONS_FOR_SkeletalCategoryOfFiniteSetsWithMorphismsGivenByListsPrecompiled( cat );
        
    fi;
    
    Finalize( cat );
    
    return cat;
    
end );

##
InstallMethod( FinSetOp,
        [ IsSkeletalCategoryOfFiniteSets, IsBigInt ],
        
  function ( cat, n )
    
    return ObjectConstructor( cat, n );
    
end );

##
InstallMethod( AsList,
        "for a CAP skeletal finite set",
        [ IsObjectInSkeletalCategoryOfFiniteSets ],
        
  function ( s )
    
    return [ 0 .. Length( s ) - 1 ];
    
end );

##
InstallMethod( ListOp,
        "for a CAP skeletal finite set and a function",
        [ IsObjectInSkeletalCategoryOfFiniteSets, IsFunction ],
        
  function ( s, f )
    
    return List( AsList( s ), x -> f(x) );
    
end );

## Morphisms

##
InstallMethod( MapOfFinSets,
        "for two CAP skeletal finite sets and a list",
        [ IsObjectInSkeletalCategoryOfFiniteSets, IsList, IsObjectInSkeletalCategoryOfFiniteSets ],
        
  function ( s, G, t )
    
    return MapOfFinSets( CapCategory( s ), s, G, t );
    
end );

##
InstallOtherMethod( MapOfFinSets,
        "for a category of skeletal finite sets, two CAP skeletal finite sets and a list",
        [ IsSkeletalCategoryOfFiniteSets, IsObjectInSkeletalCategoryOfFiniteSets, IsList, IsObjectInSkeletalCategoryOfFiniteSets ],
        
  function ( cat, s, G, t )
    
    return MorphismConstructor( cat, s, G, t );
    
end );

##
InstallMethod( EmbeddingOfFinSets,
        "for two CAP skeletal finite sets",
        [ IsObjectInSkeletalCategoryOfFiniteSets, IsObjectInSkeletalCategoryOfFiniteSets ],
        
  function ( s, t )
    local iota;
    
    iota := MapOfFinSets( s, AsList( s ), t );
    
    Assert( 3, IsMonomorphism( iota ) );
    SetIsMonomorphism( iota, true );
    
    return iota;
    
end );

##
InstallMethod( Preimage,
        "for a CAP map of skeletal finite sets and a CAP skeletal finite set",
        [ IsMorphismInSkeletalCategoryOfFiniteSets, IsList ],
        
  function ( phi, t )
    local S;
    
    S := AsList( Source( phi ) );
    
    phi := AsList( phi );
    
    return Filtered( S, i -> phi[1 + i] in t );
    
end );

##
InstallMethod( ImageObject,
     "for a CAP map of skeletal finite sets and a CAP skeletal finite set",
     [ IsMorphismInSkeletalCategoryOfFiniteSets, IsObjectInSkeletalCategoryOfFiniteSets ],
      function ( phi, s_ )

    return ImageObject( PreCompose( EmbeddingOfFinSets( s_, Source( phi ) ), phi ) );

end );

##
InstallMethod( CallFuncList,
        "for a CAP map of skeletal finite sets and a list",
    [ IsMorphismInSkeletalCategoryOfFiniteSets, IsList ],
        
  function ( phi, L )
    local x;
    
    x := L[1];
    
    return AsList( phi )[1 + x];
    
end );

##
InstallMethodForCompilerForCAP( SKELETAL_FIN_SETS_ExplicitCoequalizer,
        [ IsSkeletalCategoryOfFiniteSets, IsObjectInSkeletalCategoryOfFiniteSets, IsList ],
        
  function ( cat, target, D )
    local data, s, t, imgs, predicate_inner, func_inner, preidcate_outer, func_outer, initial_outer, Cq;
    
    data := List( D, f -> AsList( f ) );
    
    s := Length( data[1] );
    t := Length( target );
    
    imgs := List( [ 0 .. s - 1 ], x -> Set( List( data, f -> f[1 + x] ) ) );
    
    predicate_inner :=
      function ( eq_class_old, eq_class )
        
        return Length( eq_class_old[1] ) = Length( eq_class[1] );
        
    end;
    
    func_inner :=
      function ( eq_class )
        local Cy, imgs, l, pos;
        
        Cy := eq_class[1];
        
        imgs := eq_class[2];
        
        l := Length( imgs );
        
        pos := PositionsProperty( [ 1 .. l ], j -> Length( Intersection( Cy, imgs[j] ) ) > 0 );
        
        return Pair( Set( Concatenation( Cy, Concatenation( imgs{pos} ) ) ),
                     imgs{Difference( [ 1 .. l ], pos )} );
        
    end;
    
    preidcate_outer :=
      function ( coeq_old, coeq )
        
        return Length( coeq[1] ) = t;
        
    end;
    
    func_outer :=
      function ( coeq )
        local covered, y, imgs, initial_inner, eq_class, Cy, eq_classes;
        
        covered := coeq[1];
        
        y := SafeFirst( [ coeq[2] + 1 .. t - 1 ], y -> not ( y in covered ) );
        
        imgs := coeq[3];
        
        initial_inner := Pair( [ y ], imgs );
        
        eq_class := CapFixpoint( predicate_inner, func_inner, initial_inner );
        
        Cy := eq_class[1];
        
        eq_classes := Concatenation( coeq[4], [ Cy ] );
        
        return NTuple( 4,
                       Set( Concatenation( covered, Cy ) ),
                       y,
                       eq_class[2],
                       eq_classes );
        
    end;
    
    initial_outer := NTuple( 4,
                             [ ], #### list of points covered sofar
                             -1, ##### smallest uncovered element
                             imgs, ### list of pre-equivalence classes unused sofar
                             [ ] ); ## list of equivalence classes found sofar
    
    return CapFixpoint( preidcate_outer, func_outer, initial_outer )[4];
    
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
    
    int := CreateCapCategoryObjectWithAttributes( cat, Length, n );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 4, IsWellDefined( int ) );
    
    return int;
    
end );

##
AddObjectDatum( SkeletalFinSets,
  function ( cat, n )
    
    return Length( n );
    
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
   { cat, n } -> Length( n ) >= 0 );

##
AddIsEqualForObjects( SkeletalFinSets,
  function ( cat, n1, n2 )
    
    return Length( n1 ) = Length( n2 );
    
end );

##
AddIsWellDefinedForMorphisms( SkeletalFinSets,
  function ( cat, mor )
    local s, rel, t;
    
    s := Length( Source( mor ) );
    
    rel := AsList( mor );
    
    t := Length( Range( mor ) );
    
    ## For CompilerForCAP we need if-elif-else with the same structure
    if not ForAll( rel, a -> IsBigInt( a ) and a >= 0 ) then
        return false;
    elif s <> Length( rel ) then
        return false;
    elif not ForAll( rel, a -> a < t ) then
        return false;
    else
        return true;
    fi;
    
end );

##
AddIsEqualForMorphisms( SkeletalFinSets,
  function ( cat, mor1, mor2 )
    
    return AsList( mor1 ) = AsList( mor2 );
    
end );

##
AddIdentityMorphism( SkeletalFinSets,
  function ( cat, n )
    
    return MorphismConstructor( cat, n, [ 0 .. Length( n ) - 1 ], n );
    
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

##
AddImageObject( SkeletalFinSets,
  function ( cat, phi )
    
    return ObjectConstructor( cat, BigInt( Length( Set( AsList( phi ) ) ) ) );
    
end );

## the function SKELETAL_FIN_SETS_IsEpimorphism
## has linear runtime complexity
AddIsEpimorphism( SkeletalFinSets,
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
AddIsSplitEpimorphism( SkeletalFinSets,
  { cat, phi } -> IsEpimorphism( cat, phi ) );

##
AddIsMonomorphism( SkeletalFinSets,
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
AddImageEmbeddingWithGivenImageObject( SkeletalFinSets,
  function ( cat, phi, image )
    
    return MorphismConstructor( cat, image, Set( AsList( phi ) ), Range( phi ) );

end );

##
AddCoastrictionToImageWithGivenImageObject( SkeletalFinSets,
  function ( cat, phi, image_object )
    local G, images, s, L, l, pi;
    
    G := AsList( phi );
    
    images := Set( G );
    
    s := Source( phi );
    
    L := List( s, i -> -1 + BigInt( SafePosition( images, G[1 + i] ) ) );
    
    pi := MorphismConstructor( cat, s, L, image_object );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 3, IsEpimorphism( cat, pi ) );
    
    return pi;
    
end );


## Limits

##
AddIsTerminal( SkeletalFinSets,
  function ( cat, M )
    
    return Length( M ) = 1;
    
end );

##
AddTerminalObject( SkeletalFinSets,
  function ( cat )
    
    return ObjectConstructor( cat, BigInt( 1 ) );
    
end );

##
AddUniversalMorphismIntoTerminalObjectWithGivenTerminalObject( SkeletalFinSets,
  function ( cat, m, t )
    
    return MorphismConstructor( cat, m, ListWithIdenticalEntries( Length( m ), BigInt( 0 ) ), t );
    
end );

##
AddDirectProduct( SkeletalFinSets,
  function ( cat, L )
    
    return ObjectConstructor( cat, Product( List( L, Length ) ) );
    
end );

##
AddProjectionInFactorOfDirectProductWithGivenDirectProduct( SkeletalFinSets,
  function ( cat, D, k, P )
    local T, l, a;
    
    T := D[k];
    
    l := Length( T );
    
    a := Product( List( D{[ 1 .. k - 1 ]}, Length ) );
    
    return MorphismConstructor( cat, P, List( P, i -> RemInt( QuoInt( i, a ), l ) ), T );
    
end );

##
AddUniversalMorphismIntoDirectProductWithGivenDirectProduct( SkeletalFinSets,
  function ( cat, D, T, tau, P )
    local l, d, dd, taus;
    
    l := Length( D );
    
    d := List( D, Length );
    
    dd := List( [ 0 .. l - 1 ], j -> Product( d{[ 1 .. j ]} ) );
    
    taus := List( tau, AsList );
    
    # if l = 0, then Sum( [ 0 .. l - 1 ], j -> ... ) = 0 ∈ TerminalObject = P
    return MorphismConstructor( cat, T, List( T, i -> Sum( [ 0 .. l - 1 ], j -> taus[1 + j][1 + i] * dd[1 + j] ) ), P );
    
end );

##
AddEqualizer( SkeletalFinSets,
  function ( cat, s, D )
    local D2, Eq;
    
    D2 := List( D, AsList );
    
    Eq := Filtered( [ 0 .. Length( s ) - 1 ], x -> ForAll( [ 1 .. Length( D ) - 1 ], j -> D2[j][1 + x] = D2[j + 1][1 + x] ) );
    
    return ObjectConstructor( cat, Length( Eq ) );
    
end );

##
AddEmbeddingOfEqualizerWithGivenEqualizer( SkeletalFinSets,
  function ( cat, s, D, E )
    local D2, Eq;
    
    D2 := List( D, AsList );
    
    Eq := Filtered( [ 0 .. Length( s ) - 1 ], x -> ForAll( [ 1 .. Length( D ) - 1 ], j -> D2[j][1 + x] = D2[j + 1][1 + x] ) );
    
    return MorphismConstructor( cat, E, Eq, s );
    
end );

##
AddUniversalMorphismIntoEqualizerWithGivenEqualizer( SkeletalFinSets,
  function ( cat, s, D, test_object, tau, E )
    local D2, Eq, t;
    
    D2 := List( D, AsList );
    
    Eq := Filtered( [ 0 .. Length( s ) - 1 ], x -> ForAll( [ 1 .. Length( D ) - 1 ], j -> D2[j][1 + x] = D2[j + 1][1 + x] ) );
    
    t := AsList( tau );
    
    return MorphismConstructor( cat, test_object, List( test_object, x -> -1 + BigInt( SafePosition( Eq, t[1 + x] ) ) ), E );
    
end );


## Colimits

##
AddIsInitial( SkeletalFinSets,
  function ( cat, M )
    
    return Length( M ) = 0;
    
end );

##
AddInitialObject( SkeletalFinSets,
  function ( cat )
    
    return ObjectConstructor( cat, BigInt( 0 ) );
    
end );

##
AddUniversalMorphismFromInitialObjectWithGivenInitialObject( SkeletalFinSets,
  function ( cat, m, I )
    
    return MorphismConstructor( cat, I, [ ], m );
    
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
    
    return MorphismConstructor( cat, M, [ 0 .. Length( M ) - 1 ], injective_object );
    
end );

##
AddCoproduct( SkeletalFinSets,
  function ( cat, L )
    
    return ObjectConstructor( cat, Sum( List( L, Length ) ) );
    
end );

##
AddInjectionOfCofactorOfCoproductWithGivenCoproduct( SkeletalFinSets,
  function ( cat, L, i, coproduct )
    local O, sum, s;
    
    O := L{[ 1 .. i - 1 ]};
    
    sum := Sum( List( O, Length ) );
    
    s := L[i];
    
    return MorphismConstructor( cat, s, [ sum .. sum + Length( s ) - 1 ], coproduct );
    
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
  
    return ObjectConstructor( cat, BigInt( Length( SKELETAL_FIN_SETS_ExplicitCoequalizer( cat, s, D ) ) ) );
    
end );

##
AddProjectionOntoCoequalizerWithGivenCoequalizer( SkeletalFinSets,
  function ( cat, s, D, C )
    local Cq, cmp;
    
    Cq := SKELETAL_FIN_SETS_ExplicitCoequalizer( cat, s, D );
    
    cmp := List( s, x -> -1 + BigInt( SafeUniquePositionProperty( Cq, c -> x in c ) ) );
    
    return MorphismConstructor( cat, s, cmp, C );
    
end );

##
AddUniversalMorphismFromCoequalizerWithGivenCoequalizer( SkeletalFinSets,
  function ( cat, s, D, test_object, tau, C )
    local Cq;
    
    Cq := SKELETAL_FIN_SETS_ExplicitCoequalizer( cat, s, D );

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
AddCartesianBraidingInverseWithGivenDirectProducts( SkeletalFinSets,
  function ( cat, MN, M, N, NM )
    local m, n;
    
    m := Length( M );
    
    n := Length( N );
    
    return MorphismConstructor( cat, MN, List( MN , i -> RemInt( i, n ) * m + QuoInt( i, n ) ), NM );
    
end );

##
AddExponentialOnObjects( SkeletalFinSets,
  function ( cat, M, N )
    local m, n;
    
    m := Length( M );
    n := Length( N );
    
    return ObjectConstructor( cat, n ^ m );
    
end );

## InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism
AddCartesianLambdaElimination( SkeletalFinSets,
  function ( cat, M, N, intro )
    local m, n, v;
    
    m := Length( M );
    n := Length( N );
    
    v := AsList( intro )[1];
    
    return MorphismConstructor( cat,
                   M,
                   List( [ 0 .. m - 1 ], i -> RemInt( QuoInt( v, n^i ), n ) ),
                   N );
    
end );

## InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure
AddCartesianLambdaIntroduction( SkeletalFinSets,
  function ( cat, map )
    local M, m, N, n, images;
    
    M := Source( map );
    m := Length( M );
    N := Range( map );
    n := Length( N );
    
    images := AsList( map );
    
    return MorphismConstructor( cat,
                   TerminalObject( cat ),
                   [ Sum( List( [ 0 .. m - 1 ], k -> images[1 + k] * n^k ) ) ],
                   ExponentialOnObjects( cat, M, N ) );
    
end );

##
AddExactCoverWithGlobalElements( SkeletalFinSets,
  function ( cat, A )
    local T;
    
    T := TerminalObject( cat );
    
    return List( [ 0 .. Length( A ) - 1 ], i -> MorphismConstructor( cat, T, [ i ], A ) );
    
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
    
end, 1 + Sum( [ [ "ExponentialOnObjects", 1 ],
                [ "ExactCoverWithGlobalElements", 1 ],
                [ "PreComposeList", 2 ],
                [ "CartesianLambdaElimination", 2 ],
                [ "CartesianLambdaIntroduction", 2 ] ],
        e -> e[2] * CurrentOperationWeight( SkeletalFinSets!.derivations_weight_list, e[1] ) ) );

##
AddCartesianEvaluationMorphismWithGivenSource( SkeletalFinSets,
  function ( cat, M, N, HM_NxM )
    local m, n, exp;
    
    m := Length( M );
    n := Length( N );
    
    exp := n ^ m;
    
    return MorphismConstructor( cat, HM_NxM, List( [ 0 .. ( n^m * m ) - 1 ], i -> RemInt( QuoInt( i, n^QuoInt( i, exp ) ), n ) ), N );
    
end );

##
AddCartesianCoevaluationMorphismWithGivenRange( SkeletalFinSets,
  function ( cat, M, N, HN_MxN )
    local m, n, mn;
    
    m := Length( M );
    n := Length( N );
    
    mn := m * n;
    
    #return MorphismConstructor( cat, M, List( [ 0 .. m - 1 ], i -> Sum( [ 0 .. n - 1 ], j -> ( i + m * j ) * (m*n)^j ) ), HN_MxN );
    
    return MorphismConstructor( cat, M, List( [ 0 .. m - 1 ], i -> i * GeometricSum( mn, n ) + m * mn * GeometricSumDiff1( mn, n ) ), HN_MxN );
    
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
    
    chi := List( range,
                 function ( x )
                   
                   if x in images then
                       return BigInt( 1 );
                   fi;
                   
                   return BigInt( 0 );
                   
               end );
      
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
    
end, 1 + Sum( [ [ "ExponentialOnObjects", 1 ],
                [ "ExactCoverWithGlobalElements", 1 ],
                [ "CartesianLambdaElimination", 2 ] ],
        e -> e[2] * CurrentOperationWeight( SkeletalFinSets!.derivations_weight_list, e[1] ) ) );

end );

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

##
InstallMethod( String,
        "for a CAP skeletal finite set",
        [ IsObjectInSkeletalCategoryOfFiniteSets ],
        
  function ( s )
    return Concatenation( "FinSet( SkeletalFinSets, ", String( Length( s ) ), " )" );
end );

##
InstallMethod( String,
        "for a CAP map of skeletal finite sets",
        [ IsMorphismInSkeletalCategoryOfFiniteSets ],
        
  function ( phi )
    return Concatenation( "MapOfFinSets( SkeletalFinSets, ", String( Source( phi ) ), ", ", String( AsList( phi ) ), ", ", String( Range( phi ) ), " )" );
end );

##
InstallMethod( ViewString,
        "for a CAP skeletal finite set",
        [ IsObjectInSkeletalCategoryOfFiniteSets ],
        
  function ( s )
    return Concatenation( "|", String( Length( s ) ), "|" );
end );

##
InstallMethod( ViewString,
        "for a CAP map of skeletal finite sets",
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
        "for a CAP skeletal finite set",
        [ IsObjectInSkeletalCategoryOfFiniteSets ],
        
  function ( s )
    local l, string;
    
    l := Length( s );
    
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
        "for a CAP map of skeletal finite sets",
        [ IsMorphismInSkeletalCategoryOfFiniteSets ],
        
  function ( phi )
    
    return Concatenation(
                   PrintString( Source( phi ) ),
                   " ⱶ", PrintString( AsList( phi ) ), "→ ",
                   PrintString( Range( phi ) ) );
    
end );

##
InstallMethod( DisplayString,
        "for a CAP skeletal finite set",
        [ IsObjectInSkeletalCategoryOfFiniteSets ],
        
  function ( s )
    
    return Concatenation( PrintString( s ), "\n" );
    
end );

##
InstallMethod( DisplayString,
        "for a CAP map of skeletal finite sets",
        [ IsMorphismInSkeletalCategoryOfFiniteSets ],
        
  function ( phi )
    
    return Concatenation( PrintString( phi ), "\n" );
    
end );

##
InstallOtherMethod( FinSet,
        "for a nonnegative integer",
        [ IsBigInt ],
        
  function ( n )
    
    return FinSet( SkeletalFinSets, n );
    
end );
