#
# FinSetsForCAP: The elementary topos of (skeletal) finite sets
#
# Implementations
#

##
InstallMethod( CategoryOfSkeletalFinSets,
               [ ],
               
  function ( )
    local overhead_option, finalize_option, cat;
    
    overhead_option := CAP_INTERNAL_RETURN_OPTION_OR_DEFAULT( "overhead", true );
    
    finalize_option := CAP_INTERNAL_RETURN_OPTION_OR_DEFAULT( "FinalizeCategory", true );
    
    cat := CreateCapCategory( "SkeletalFinSets" : overhead := overhead_option );
    
    SetFilterObj( cat, IsCategoryOfSkeletalFinSets );
    
    SetIsElementaryTopos( cat, true );
    
    AddObjectRepresentation( cat, IsSkeletalFiniteSet and HasLength and HasAsList );
    
    AddMorphismRepresentation( cat, IsSkeletalFiniteSetMap and HasAsList );
    
    INSTALL_FUNCTIONS_FOR_SKELETAL_FIN_SETS( cat );
    
    if finalize_option then
        
        Finalize( cat );
        
    fi;
    
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

InstallGlobalFunction( INSTALL_FUNCTIONS_FOR_SKELETAL_FIN_SETS,

    function ( SkeletalFinSets )
        local ExplicitCoequalizer;
##
AddIsWellDefinedForObjects( SkeletalFinSets,
   n -> Length( n ) >= 0 );

##
AddIsEqualForObjects( SkeletalFinSets,
  function ( n1, n2 )

    return Length( n1 ) = Length( n2 );
    
end );

##
AddIsWellDefinedForMorphisms( SkeletalFinSets,
  function ( mor )
    local s, rel, t;
    
    s := Length( Source( mor ) );
    
    rel := AsList( mor );
    
    if not ForAll( rel, a -> IsPosInt( a ) ) then
        return false;
    fi;
    
    if not s = Length( rel ) then
        return false;
    fi;
    
    t := Length( Range( mor ) );
    
    if not ForAll( rel, a -> a <= t ) then
        return false;
    fi;
    
    return true;
    
end );

##
AddIsEqualForMorphisms( SkeletalFinSets,
  function ( mor1, mor2 )
    
    return AsList( mor1 ) = AsList( mor2 );
    
end );

##
AddIsHomSetInhabited( SkeletalFinSets,
  function ( A, B )
    
    return IsInitial( A ) or not IsInitial( B );
    
end );

##
AddIdentityMorphism( SkeletalFinSets,
  function ( n )
    
    return MapOfFinSets( n, [ 1 .. Length( n ) ], n );
    
end );

##
AddPreCompose( SkeletalFinSets,
  function ( map_pre, map_post )
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
  function ( phi )
    
    return FinSet( SkeletalFinSets, Length( Set( AsList( phi ) ) ) );
    
end );

##
AddIsEpimorphism( SkeletalFinSets,
  function ( phi )
    local imgs, testList, img;
    
    imgs := AsList( phi );
    
    testList := ListWithIdenticalEntries( Length( Range( phi ) ), 0 );
    
    for img in imgs do
        testList[img] := 1;
    od;

    return ForAll( testList, test -> test = 1 );
    
end );

##
AddIsSplitEpimorphism( SkeletalFinSets,
  IsEpimorphism );

##
AddIsMonomorphism( SkeletalFinSets,
  function ( phi )
    local imgs, testList, img;
    
    imgs := AsList( phi );
    
    testList := ListWithIdenticalEntries( Length( Range( phi ) ), 0 );
    
    for img in imgs do
        if testList[img] = 1 then
            return false;
        fi;
        testList[img] := 1;
    od;

    return true;
    
end );

##
AddIsSplitMonomorphism( SkeletalFinSets,
  function ( phi )
    return IsInitial( Range( phi ) ) or ( not IsInitial( Source( phi ) ) and IsMonomorphism( phi ) );
end );

##
AddIsLiftable( SkeletalFinSets,
  function ( f, g )
    
    f := AsList( f );
    g := AsList( g );
    
    if 100 * Length( f ) < Length( g ) then
        f := Set( f );
    fi;
    
    return ForAll( f, y -> y in g );
    
end );

##
AddLift( SkeletalFinSets,
  function ( f, g )
    local S, T;
    
    if not IsLiftable( f, g ) then
        return fail;
    fi;
    
    S := Source( f );
    T := Source( g );
    
    g := AsList( g );
    f := AsList( f );
    
    return MapOfFinSets( S, List( AsList( S ), x -> Position( g, f[x] ) ), T );
    
end );

## g \circ f^{-1} is again an ordinary function,
## i.e., fibers of f are mapped under g to the same element
AddIsColiftable( SkeletalFinSets,
  function ( f, g )
    
    f := AsList( f );
    g := AsList( g );
    
    return ForAll( Set( f ), i -> Length( Set( g{Positions( f, i )} ) ) = 1 );
    
end );
##
AddColift( SkeletalFinSets,
  function ( f, g )
    local S, T, chi;
    
    if not IsColiftable( f, g ) then
        return fail;
    fi;
    
    S := Range( f );
    T := Range( g );
    
    f := AsList( f );
    g := AsList( g );
    
    chi :=
      function ( y )
        if not y in f then
            return 1;
        fi;
        return g[Position( f, y )];
    end;
    
    return MapOfFinSets( S, List( AsList( S ), chi ), T );
    
end );

##
AddImageEmbedding( SkeletalFinSets,
  function ( phi )
    
    return MapOfFinSets( ImageObject( phi ), Set( AsList( phi ) ), Range( phi ) );

end );

##
AddCoastrictionToImage( SkeletalFinSets,
  function ( phi )
    local G, L, l, pi;
    
    G := AsList( phi );
    
    L := [ ];
    
    for l in G do
        Add( L, Position( Set( G ), l ) );
    od;
    
    pi := MapOfFinSets( Source( phi ), L, ImageObject( phi ) );
    
    Assert( 3, IsEpimorphism( pi ) );
    
    SetIsEpimorphism( pi, true );
    
    return pi;
    
end );


## Limits

##
AddIsTerminal( SkeletalFinSets,
  function ( M )
    
    return Length( M ) = 1;
    
end );

##
AddTerminalObject( SkeletalFinSets,
  function ( arg )
    
    return FinSet( SkeletalFinSets, 1 );
    
end );

##
AddUniversalMorphismIntoTerminalObjectWithGivenTerminalObject( SkeletalFinSets,
  function ( m, t )
    local M;
    
    M := AsList( m );

    return MapOfFinSets( m, List( M, a -> Length( t ) ), t );
    
end );

##
AddDirectProduct( SkeletalFinSets,
  function ( L )
    local int, l;

    int := 1;
    for l in L do
        int := int * Length( l );
    od;

    return FinSet( SkeletalFinSets, int );
    
end );

##
AddProjectionInFactorOfDirectProduct( SkeletalFinSets, CAPOperationPrepareFunction( "ProjectionInFactorOfBinaryDirectProductToProjectionInFactorOfDirectProduct", SkeletalFinSets, function ( M, N, pos )
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
AddUniversalMorphismIntoDirectProduct( SkeletalFinSets, CAPOperationPrepareFunction( "UniversalMorphismIntoBinaryDirectProductToUniversalMorphismIntoDirectProduct", SkeletalFinSets, function ( tau1, tau2 )
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
  function ( D )
    local f1, s, Eq;
    
    f1 := D[1];
    
    s := Source( f1 );
    
    D := D{[ 2 .. Length( D ) ]};
    
    Eq := Filtered( AsList( s ), x -> ForAll( D, fj -> f1( x ) = fj( x ) ) );
    
    return FinSet( SkeletalFinSets, Length( Eq ) );
    
end );

##
AddEmbeddingOfEqualizerWithGivenEqualizer( SkeletalFinSets,
  function ( D, E )
    local f1, s, cmp;
    
    f1 := D[1];
    
    s := Source( f1 );
    D := D{[ 2 .. Length( D ) ]};

    cmp := Filtered( AsList( s ), x -> ForAll( D, fj -> f1( x ) = fj( x ) ) );

    return MapOfFinSets( E, cmp, s );
    
end );

##
AddUniversalMorphismIntoEqualizerWithGivenEqualizer( SkeletalFinSets,
  function ( D, tau, E )
    local f1, s, Eq;

    f1 := D[1];
    
    s := Source( f1 );

    Eq := Filtered( AsList( s ), x -> ForAll( D, fj -> f1( x ) = fj( x ) ) );

    return MapOfFinSets( Source( tau ), List( Source( tau ), x -> Position( Eq, tau( x ) ) ), E );
    
end );


## Colimits

##
AddIsInitial( SkeletalFinSets,
  function ( M )
    
    return Length( M ) = 0;
    
end );

##
AddInitialObject( SkeletalFinSets,
  function ( arg )
    
    return FinSet( SkeletalFinSets, 0 );
    
end );

##
AddUniversalMorphismFromInitialObjectWithGivenInitialObject( SkeletalFinSets,
  function ( m, I )
    
    return MapOfFinSets( I, [ ], m );
    
end );

##
AddIsProjective( SkeletalFinSets,
  ReturnTrue );

##
AddEpimorphismFromSomeProjectiveObject( SkeletalFinSets,
  IdentityMorphism );

##
AddIsInjective( SkeletalFinSets,
  function ( M )
    
    return not IsInitial( M );
    
end );

##
AddMonomorphismIntoSomeInjectiveObject( SkeletalFinSets,
  function ( M )
    
    if IsInitial( M ) then
        return UniversalMorphismIntoTerminalObject( M );
    fi;
    
    return IdentityMorphism( M );
    
end );

##
AddCoproduct( SkeletalFinSets,
  function ( L )
    
    return FinSet( SkeletalFinSets, Sum( L, x -> Length( x ) ) );
    
end );

##
AddInjectionOfCofactorOfCoproduct( SkeletalFinSets,
  function ( L, i )
    local s, O, sum, cmp;
    
    O := L{[ 1 .. i - 1 ]};
    
    sum := Sum( O, x -> Length( x ) );
    
    s := L[i];
    
    cmp := List( s, x -> sum + x );
    
    return MapOfFinSets( s, cmp, Coproduct( L ) );

end );

##
AddUniversalMorphismFromCoproductWithGivenCoproduct( SkeletalFinSets,
  function ( L, tau, S )
    local T, cmp;
    
    T := Range( tau[1] );

    cmp := Concatenation( List( [ 1 .. Length( tau ) ], x -> AsList( tau[x] ) ) );

    return MapOfFinSets( S, cmp, T );
    
end );

##
ExplicitCoequalizer := function ( D )
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

end;

##
AddCoequalizer( SkeletalFinSets,
  function ( D )
  
    return FinSet( SkeletalFinSets, Length( ExplicitCoequalizer( D ) ) );
    
end );

##
AddProjectionOntoCoequalizerWithGivenCoequalizer( SkeletalFinSets,
  function ( D, C )
    local Cq, s, cmp;

    Cq := ExplicitCoequalizer( D );
    
    s := Range( D[1] );
    
    cmp := List( s, x -> First( Cq, c -> x in c ) );
    
    cmp := List( cmp, x -> Position( Cq, x ) );
    
    return MapOfFinSets( s, cmp, C );
    
end );

##
AddUniversalMorphismFromCoequalizerWithGivenCoequalizer( SkeletalFinSets,
  function ( D, tau, C )
    local Cq;
    
    Cq := ExplicitCoequalizer( D );

    return MapOfFinSets( C, List( Cq, x -> tau( x[1] ) ), Range( tau ) );
    
end );

## The cartesian monoidal structure

##
AddCartesianLeftUnitorWithGivenDirectProduct( SkeletalFinSets,
  function ( M, TM )
    
    return IdentityMorphism( M );
    
end );

##
AddCartesianLeftUnitorInverseWithGivenDirectProduct( SkeletalFinSets,
  function ( M, TM )
    
    return IdentityMorphism( M );
    
end );

##
AddCartesianRightUnitorWithGivenDirectProduct( SkeletalFinSets,
  function ( M, MT )
    
    return IdentityMorphism( M );
    
end );

##
AddCartesianRightUnitorInverseWithGivenDirectProduct( SkeletalFinSets,
  function ( M, MT )
    
    return IdentityMorphism( M );
    
end );

##
AddCartesianBraidingInverseWithGivenDirectProducts( SkeletalFinSets,
  function ( MN, M, N, NM )
    local m, n;
    
    m := Length( M );
    n := Length( N );
    
    return MapOfFinSets( MN, List( AsList( MN ), k -> ( k-1 ) mod n * m + Int( ( k-1 ) / n ) + 1 ), NM );
    
end );

##
AddExponentialOnObjects( SkeletalFinSets,
  function ( M, N )
    local m;
    
    m := Length( M );
    
    return FinSet( SkeletalFinSets, Length( Tuples( AsList( N ), m ) ) );
    
end );

##
AddExponentialOnMorphismsWithGivenExponentials( SkeletalFinSets,
  function ( S, alpha, beta, T )
    local M, m, N, A, a, B, S_int, T_int;
    
    M := Range( alpha );
    m := Length( M );
    N := Source( beta );
    
    A := Source( alpha );
    a := Length( A );
    B := Range( beta );
    
    S_int := List( Tuples( AsList( N ), m ), x -> MapOfFinSets( M, x, N ) );
    T_int := List( Tuples( AsList( B ), a ), x -> MapOfFinSets( A, x, B ) );
    
    return MapOfFinSets( S, List( List( S_int, f -> PreCompose( [ alpha, f, beta ] ) ), f -> Position( T_int, f ) ), T );
    
end );

##
AddCartesianEvaluationMorphismWithGivenSource( SkeletalFinSets,
  function ( M, N, HM_NxM )
    local HM_N, m;
    
    m := Length( M );
    
    HM_N := List( Tuples( AsList( N ), m ), x -> MapOfFinSets( M, x, N ) );
    
    return MapOfFinSets( HM_NxM, List( Cartesian( HM_N, AsList( M ) ), fx -> fx[1](fx[2]) ), N );
    
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
