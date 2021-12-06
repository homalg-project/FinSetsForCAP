# SPDX-License-Identifier: GPL-2.0-or-later
# FinSetsForCAP: The elementary topos of (skeletal) finite sets
#
# Implementations
#

##
InstallMethod( CategoryOfSkeletalFinSets,
               [ ],
               
  function ( )
    local cat;
    
    cat := CreateCapCategory( "SkeletalFinSets" );
    
    cat!.category_as_first_argument := true;
    
    SetFilterObj( cat, IsCategoryOfSkeletalFinSets );
    
    SetIsSkeletalCategory( cat, true );
    
    SetIsElementaryTopos( cat, true );
    
    AddObjectRepresentation( cat, IsSkeletalFiniteSet and HasLength and HasAsList );
    
    AddMorphismRepresentation( cat, IsSkeletalFiniteSetMap and HasAsList );
    
    INSTALL_FUNCTIONS_FOR_SKELETAL_FIN_SETS( cat );
    
    AddTheoremFileToCategory( FinSets,
            Filename( DirectoriesPackageLibrary( "Toposes", "LogicForToposes" ), "PropositionsForToposes.tex" ) );
    
    if not IsIdenticalObj( ValueOption( "no_precompiled_code" ), true ) then
        
        ADD_FUNCTIONS_FOR_CategoryOfSkeletalFinSetsPrecompiled( cat );
        
    fi;
    
    Finalize( cat );
    
    return cat;
    
end );

##
InstallMethod( FinSetOp,
        [ IsCategoryOfSkeletalFinSets, IsInt ],
        
  function ( cat, n )
    local int;
    
    int := rec( );
    
    ObjectifyObjectForCAPWithAttributes( int, cat,
        Length, n,
        AsList, [ 1 .. n ]
        );

    Assert( 4, IsWellDefined( int ) );
    
    return int;
    
end );

##
InstallMethod( ListOp,
        "for a CAP skeletal finite set and a function",
        [ IsSkeletalFiniteSet, IsFunction ],
        
  function ( s, f )

    return List( AsList( s ), f );
end );

## Morphisms

##
InstallMethod( MapOfFinSets,
        "for two CAP skeletal finite sets and a list",
        [ IsSkeletalFiniteSet, IsList, IsSkeletalFiniteSet ],
        
  function ( s, G, t )
    local map;
    
    map := rec( );
    
    ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( map, CapCategory( s ),
            s,
            t,
            AsList, G
        );
    
    Assert( 4, IsWellDefined( map ) );
    
    return map;
    
end );

##
InstallMethod( EmbeddingOfFinSets,
        "for two CAP skeletal finite sets",
        [ IsSkeletalFiniteSet, IsSkeletalFiniteSet ],
        
  function ( s, t )
    local iota;
    
    iota := MapOfFinSets( s, List( s, x -> x ), t );
    
    Assert( 3, IsMonomorphism( iota ) );
    SetIsMonomorphism( iota, true );
    
    return iota;
    
end );

##
InstallMethod( Preimage,
        "for a CAP map of skeletal finite sets and a CAP skeletal finite set",
        [ IsSkeletalFiniteSetMap, IsList ],
        
  function ( phi, t )
    local S;
    
    S := AsList( Source( phi ) );
    
    phi := AsList( phi );
    
    return Filtered( S, i -> phi[i] in t );
    
end );

##
InstallMethod( ImageObject,
     "for a CAP map of skeletal finite sets and a CAP skeletal finite set",
     [ IsSkeletalFiniteSetMap, IsSkeletalFiniteSet ],
      function ( phi, s_ )

    return ImageObject( PreCompose( EmbeddingOfFinSets( s_, Source( phi ) ), phi ) );

end );

##
InstallMethod( CallFuncList,
        "for a CAP map of skeletal finite sets and a list",
    [ IsSkeletalFiniteSetMap, IsList ],
        
  function ( phi, L )
    local x;
    
    x := L[1];
    
    return AsList( phi )[x];
    
end );

##
InstallGlobalFunction( SKELETAL_FIN_SETS_Coequalizer,
  function ( D )
    local T, Cq, t, L, i;
    
    T := Range( D[1] );
    T := AsList( T );
    
    Cq := [ ];
    
    while not IsEmpty( T ) do
        t := T[1];
        t := Union( List( D, f_j -> List( Union( List( D, f_i -> Preimage( f_i, [ t ] ) ) ), f_j ) ) );
        t := AsList( t );
        if IsEmpty( t ) then
            t := [ T[1] ];
        fi;
        Add( Cq, t );
        T := Difference( T, t );
    od;
    
    T := AsList( Range( D[1] ) );
    
    if not Concatenation( Cq ) = T then
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
        testList[img] := true;
    od;
    
    return testList;
    
end );

##
InstallGlobalFunction( SKELETAL_FIN_SETS_IsMonomorphism,
  function ( imgs, t )
    local testList, img;
    
    testList := ListWithIdenticalEntries( t, false );
    
    for img in imgs do
        if testList[img] then
            return false;
        fi;
        testList[img] := true;
    od;
    
    return true;
    
end );

##
InstallGlobalFunction( INSTALL_FUNCTIONS_FOR_SKELETAL_FIN_SETS,
  function ( SkeletalFinSets )
    
##
AddObjectConstructor( SkeletalFinSets,
  function ( SkeletalFinSets, n )
    
    return FinSet( SkeletalFinSets, n );
    
end );

##
AddObjectDatum( SkeletalFinSets,
  function ( SkeletalFinSets, n )
    
    return Length( n );
    
end );

##
AddMorphismConstructor( SkeletalFinSets,
  function ( SkeletalFinSets, source, map, range )
    
    return MapOfFinSets( source, map, range );
    
end );

##
AddMorphismDatum( SkeletalFinSets,
  function ( SkeletalFinSets, map )
    
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
    if not ForAll( rel, a -> IsPosInt( a ) ) then
        return false;
    elif not s = Length( rel ) then
        return false;
    elif not ForAll( rel, a -> a <= t ) then
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
AddIsHomSetInhabited( SkeletalFinSets,
  function ( cat, A, B )
    
    return IsInitial( cat, A ) or not IsInitial( cat, B );
    
end );

##
AddIdentityMorphism( SkeletalFinSets,
  function ( cat, n )
    
    return MapOfFinSets( n, [ 1 .. Length( n ) ], n );
    
end );

##
AddPreCompose( SkeletalFinSets,
  function ( cat, map_pre, map_post )
    local s, t, im_pre, im_post, cmp;
    
    s := Source( map_pre );
    t := Range( map_post );
    
    im_pre := AsList( map_pre );
    im_post := AsList( map_post );
    
    cmp := List( s, i -> im_post[ im_pre[i] ] );
    
    return MapOfFinSets( s, cmp, t );
    
end );

##
AddImageObject( SkeletalFinSets,
  function ( cat, phi )
    
    return FinSet( SkeletalFinSets, Length( Set( AsList( phi ) ) ) );
    
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
    
    return not false in SKELETAL_FIN_SETS_IsEpimorphism( imgs, t );
    
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
    
    return MapOfFinSets( S, List( AsList( S ), x -> Position( gg, ff[x] ) ), T );
    
end );

## g \circ f^{-1} is again an ordinary function,
## i.e., fibers of f are mapped under g to the same element
AddIsColiftable( SkeletalFinSets,
  function ( cat, f, g )
    local ff, gg;
    
    ff := AsList( f );
    gg := AsList( g );
    
    return ForAll( Set( ff ), i -> Length( Set( gg{Positions( ff, i )} ) ) = 1 );
    
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
            return 1;
        fi;
        return gg[Position( ff, y )];
    end;
    
    return MapOfFinSets( S, List( AsList( S ), chi ), T );
    
end );

##
AddImageEmbeddingWithGivenImageObject( SkeletalFinSets,
  function ( cat, phi, image )
    
    return MapOfFinSets( image, Set( AsList( phi ) ), Range( phi ) );

end );

##
AddCoastrictionToImage( SkeletalFinSets,
  function ( cat, phi )
    local G, L, l, pi;
    
    G := AsList( phi );
    
    L := List( G, l -> Position( Set( G ), l ) );
    
    pi := MapOfFinSets( Source( phi ), L, ImageObject( cat, phi ) );

    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 3, IsEpimorphism( cat, pi ) );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    SetIsEpimorphism( pi, true );
    
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
    
    return FinSet( SkeletalFinSets, 1 );
    
end );

##
AddUniversalMorphismIntoTerminalObjectWithGivenTerminalObject( SkeletalFinSets,
  function ( cat, m, t )
    local M;
    
    M := AsList( m );

    return MapOfFinSets( m, List( M, a -> Length( t ) ), t );
    
end );

##
AddDirectProduct( SkeletalFinSets,
  function ( cat, L )
    
    return FinSet( SkeletalFinSets, Product( List( L, o -> Length( o ) ) ) );
    
end );

##
AddProjectionInFactorOfDirectProduct( SkeletalFinSets, CAPOperationPrepareFunction( "ProjectionInFactorOfBinaryDirectProductToProjectionInFactorOfDirectProduct", SkeletalFinSets, function ( cat, M, N, pos )
    local S, T, n, imgs, i;
    
    S := DirectProduct( [ M, N ] );
    if pos = 1 then
        T := M;
    else
        T := N;
    fi;
    
    n := Length( N );
    
    imgs := [ ];

    for i in AsList( S ) do
        if pos = 2 then
            Add( imgs, (i - 1) mod n );
        else
            Add( imgs, Int( (i - 1) / n ) );
        fi;
    od;
    
    imgs := List( imgs, img -> img + 1 );

    return MapOfFinSets( S, imgs, T );
end ) );

##
AddUniversalMorphismIntoDirectProduct( SkeletalFinSets, CAPOperationPrepareFunction( "UniversalMorphismIntoBinaryDirectProductToUniversalMorphismIntoDirectProduct", SkeletalFinSets, function ( cat, tau1, tau2 )
    local S, T, n, imgs, i;
    
    S := Source( tau1 );
    T := DirectProduct( [ Range( tau1 ), Range( tau2 ) ] );
    
    n := Length( Range( tau2 ) );
    
    imgs := [ ];
    
    for i in AsList( S ) do
        Add( imgs, (AsList( tau1 )[i] - 1) * n + AsList( tau2 )[i] );
    od;
    
    return MapOfFinSets( S, imgs, T );
    
end ) );

##
AddEqualizer( SkeletalFinSets,
  function ( cat, D )
    local f1, s, D2, Eq;
    
    f1 := D[1];
    
    s := Source( f1 );
    
    D2 := D{[ 2 .. Length( D ) ]};
    
    Eq := Filtered( AsList( s ), x -> ForAll( D2, fj -> f1( x ) = fj( x ) ) );
    
    return FinSet( SkeletalFinSets, Length( Eq ) );
    
end );

##
AddEmbeddingOfEqualizerWithGivenEqualizer( SkeletalFinSets,
  function ( cat, D, E )
    local f1, s, D2, cmp;
    
    f1 := D[1];
    
    s := Source( f1 );
    D2 := D{[ 2 .. Length( D ) ]};
    
    cmp := Filtered( AsList( s ), x -> ForAll( D2, fj -> f1( x ) = fj( x ) ) );
    
    return MapOfFinSets( E, cmp, s );
    
end );

##
AddUniversalMorphismIntoEqualizerWithGivenEqualizer( SkeletalFinSets,
  function ( cat, D, test_object, tau, E )
    local f1, s, Eq;

    f1 := D[1];
    
    s := Source( f1 );

    Eq := Filtered( AsList( s ), x -> ForAll( D, fj -> f1( x ) = fj( x ) ) );

    return MapOfFinSets( Source( tau ), List( Source( tau ), x -> Position( Eq, tau( x ) ) ), E );
    
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
    
    return FinSet( SkeletalFinSets, 0 );
    
end );

##
AddUniversalMorphismFromInitialObjectWithGivenInitialObject( SkeletalFinSets,
  function ( cat, m, I )
    
    return MapOfFinSets( I, [ ], m );
    
end );

##
AddIsProjective( SkeletalFinSets,
  function( cat, M )
    
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
AddMonomorphismIntoSomeInjectiveObject( SkeletalFinSets,
  function ( cat, M )
    
    if IsInitial( cat, M ) then
        return UniversalMorphismIntoTerminalObject( cat, M );
    fi;
    
    return IdentityMorphism( cat, M );
    
end );

##
AddCoproduct( SkeletalFinSets,
  function ( cat, L )
    
    return FinSet( SkeletalFinSets, Sum( L, x -> Length( x ) ) );
    
end );

##
AddInjectionOfCofactorOfCoproductWithGivenCoproduct( SkeletalFinSets,
  function ( cat, L, i, coproduct )
    local s, O, sum, cmp;
    
    O := L{[ 1 .. i - 1 ]};
    
    sum := Sum( O, x -> Length( x ) );
    
    s := L[i];
    
    cmp := List( s, x -> sum + x );
    
    return MapOfFinSets( s, cmp, coproduct );

end );

##
AddUniversalMorphismFromCoproductWithGivenCoproduct( SkeletalFinSets,
  function ( cat, L, test_object, tau, S )
    local T, cmp;
    
    T := Range( tau[1] );

    cmp := Concatenation( List( [ 1 .. Length( tau ) ], x -> AsList( tau[x] ) ) );

    return MapOfFinSets( S, cmp, T );
    
end );

##
AddCoequalizer( SkeletalFinSets,
  function ( cat, D )
  
    return FinSet( SkeletalFinSets, Length( SKELETAL_FIN_SETS_Coequalizer( D ) ) );
    
end );

##
AddProjectionOntoCoequalizerWithGivenCoequalizer( SkeletalFinSets,
  function ( cat, D, C )
    local Cq, s, cmp;

    Cq := SKELETAL_FIN_SETS_Coequalizer( D );
    
    s := Range( D[1] );
    
    cmp := List( s, x -> First( Cq, c -> x in c ) );
    
    cmp := List( cmp, x -> Position( Cq, x ) );
    
    return MapOfFinSets( s, cmp, C );
    
end );

##
AddUniversalMorphismFromCoequalizerWithGivenCoequalizer( SkeletalFinSets,
  function ( cat, D, test_object, tau, C )
    local Cq;
    
    Cq := SKELETAL_FIN_SETS_Coequalizer( D );

    return MapOfFinSets( C, List( Cq, x -> tau( x[1] ) ), Range( tau ) );
    
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
    
    return MapOfFinSets( MN, List( AsList( MN ), k -> ( k-1 ) mod n * m + Int( ( k-1 ) / n ) + 1 ), NM );
    
end );

##
AddExponentialOnObjects( SkeletalFinSets,
  function ( cat, M, N )
    local m;
    
    m := Length( M );
    
    return FinSet( SkeletalFinSets, Length( Tuples( AsList( N ), m ) ) );
    
end );

##
AddExponentialOnMorphismsWithGivenExponentials( SkeletalFinSets,
  function ( cat, S, alpha, beta, T )
    local M, m, N, A, a, B, S_int, T_int;
    
    M := Range( alpha );
    m := Length( M );
    N := Source( beta );
    
    A := Source( alpha );
    a := Length( A );
    B := Range( beta );
    
    S_int := List( Tuples( AsList( N ), m ), x -> MapOfFinSets( M, x, N ) );
    T_int := List( Tuples( AsList( B ), a ), x -> MapOfFinSets( A, x, B ) );
    
    return MapOfFinSets( S, List( List( S_int, f -> PreComposeList( cat, [ alpha, f, beta ] ) ), f -> Position( T_int, f ) ), T );
    
end );

##
AddCartesianEvaluationMorphismWithGivenSource( SkeletalFinSets,
  function ( cat, M, N, HM_NxM )
    local HM_N, m;
    
    m := Length( M );
    
    HM_N := List( Tuples( AsList( N ), m ), x -> MapOfFinSets( M, x, N ) );
    
    return MapOfFinSets( HM_NxM, List( Cartesian( HM_N, AsList( M ) ), fx -> fx[1](fx[2]) ), N );
    
end );

##
AddCartesianLambdaIntroduction( SkeletalFinSets,
  function ( cat, map )
    local S, T, images, a, b;
    
    S := Source( map );
    T := Range( map );
    
    images := AsList( map );
    
    a := Length( S );
    b := Length( T );
    
    return MapOfFinSets(
                   TerminalObject( cat ),
                   [ 1 + Sum( [ 1 .. a ], i -> ( images[i] - 1 ) * b^(a - i) ) ],
                   ExponentialOnObjects( cat, S, T ) );
    
end );

##
AddSubobjectClassifier( SkeletalFinSets,
  function ( cat )
      
      return FinSet( cat, 2 );
      
end );

##
AddClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier( SkeletalFinSets,
  function ( cat, monomorphism, Omega )
    local range, images;
    
    range := Range( monomorphism );
    
    images := List( range,
                    function ( x )
                      
                      if x in AsList( monomorphism ) then
                          return 1;
                      fi;
                      
                      return 2;
                      
                  end );
      
      return MapOfFinSets( range, images, Omega );
      
end );

end );

##
InstallMethod( ViewObj,
        "for a CAP skeletal finite set",
        [ IsSkeletalFiniteSet ],
        
  function ( s )
    Print( "<An object in SkeletalFinSets>" );
end );

##
InstallMethod( Display,
        "for a CAP skeletal finite set",
        [ IsSkeletalFiniteSet ],
        
  function ( s )
    Display( Length( s ) );
end );

##
InstallMethod( Display,
    "for a CAP map of skeletal finite sets",
        [ IsSkeletalFiniteSetMap ],
        
  function ( phi )
    Display( [ Length( Source( phi ) ), AsList( phi ), Length( Range( phi ) ) ] );
end );

##
BindGlobal( "SkeletalFinSets", CategoryOfSkeletalFinSets( ) );

##
InstallOtherMethod( FinSet,
        "for a nonnegative integer",
        [ IsInt ],
        
  function ( n )
    
    return FinSet( SkeletalFinSets, n );
    
end );
