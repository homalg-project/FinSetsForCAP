#
# FinSetsForCAP: The elementary topos of finite sets
#
# Implementations
#

BindGlobal( "FinSets", CreateCapCategory( "FinSets" ) );

DisableAddForCategoricalOperations( FinSets );

AddObjectRepresentation( FinSets, IsFiniteSet );

AddMorphismRepresentation( FinSets, IsFiniteSetMap );

##
InstallMethod( FinSet,
        "for a list",
        [ IsList ],
        
  function( L )
    
    if ForAny( L, l -> IsMutable( l ) ) then
        Error( "FinSet only accepts lists of immutable objects" );
    fi;
    
    return FinSetNC( Set( L ) );
    
end );

##
InstallMethod( FinSetNC,
        "for a list",
        [ IsList ],
        
  function( L )
    local set;
    
    set := rec( );
    
    ObjectifyObjectForCAPWithAttributes( set, FinSets,
            AsList, L
            );
    
    Assert( 4, IsWellDefined( set ) );

    return set;
    
end );

##
AddIsWellDefinedForObjects( FinSets,
  function( set )
    local L, i, j;
    
    L := AsList( set );
    
    if not IsDenseList( L ) then
        return false;
    fi;
    
    for i in [ 1 .. Length( L ) ] do
        for j in [ 1 .. ( i - 1 ) ] do
            if IsIdenticalObj( L[ i ], L[ j ] ) then
                return false;
            fi;
        od;
    od;
    
    return true;
  
end  );

##
InstallMethod( Length,
        "for CAP finite sets",
        [ IsFiniteSet ],
        
  set -> Length( AsList( set ) ) );

##
InstallMethod( \in,
        "for an object and a CAP finite set",
        [ IsObject, IsFiniteSet ],
        
  function( y, M )
    
    return ForAny( AsList( M ), m -> IsIdenticalObj( m, y ) );
    
end );

##
AddIsEqualForObjects( FinSets,
  function( set1, set2 )
    if not Length( set1 ) = Length( set2 ) then
        return false;
    fi;
    
    return ForAll( AsList( set1 ), element -> element in set2 );
    
end );

##
InstallMethod( MapOfFinSets,
        "for two CAP finite sets and a list",
        [ IsFiniteSet, IsList, IsFiniteSet ],
        
  function( S, G, T )
    
    return MapOfFinSetsNC( S, Set( G ), T );
    
end );

##
InstallMethod( MapOfFinSetsNC,
        "for a two CAP finite sets and a list",
        [ IsFiniteSet, IsList, IsFiniteSet ],
        
  function( S, G, T )
    local map;
    
    if not ForAll( G, a -> IsList( a ) and Length( a ) = 2 ) then
        Error( "the list of relations has a wrong syntax\n" );
    fi;
    
    map := rec( );
    
    ObjectifyMorphismForCAPWithAttributes( map, FinSets,
            AsList, G,
            Source, S,
            Range, T
            );
    
    Assert( 4, IsWellDefined( map ) );
    
    return map;
    
end );

##
InstallMethod( EmbeddingOfFinSets,
        "for a two CAP finite sets",
        [ IsFiniteSet, IsFiniteSet ],
        
  function( S, T )
    local iota;
    
    iota := MapOfFinSetsNC( S, List( S, x -> [ x, x ] ), T );
    
    Assert( 3, IsMonomorphism( iota ) );
    SetIsMonomorphism( iota, true );
    
    return iota;
    
end );

##
InstallMethod( ProjectionOfFinSets,
        "for a two CAP finite sets",
        [ IsFiniteSet, IsFiniteSet ],
        
  function( S, T )
    local pi;
    
    pi := MapOfFinSetsNC( S, List( S, x -> [ x, First( T, t -> ForAny( t, element -> IsIdenticalObj( element, x ) ) ) ] ), T );
    
    Assert( 3, IsEpimorphism( pi ) );
    SetIsEpimorphism( pi, true );
    
    return pi;
    
end );

##
AddIsWellDefinedForMorphisms( FinSets,
  function( mor )
    local S, T, rel, i, j;
    
    S := Source( mor );
    T := Range( mor );
    
    rel := AsList( mor );

    if not IsDenseList( rel ) then
        return false;
    fi;
    
    if not Length( S ) = Length( rel ) then
        return false;
    fi;
    
    if not ForAll( rel, a -> a[ 1 ] in S and a[ 2 ] in T ) then
        return false;
    fi;
    
    for i in [ 1 .. Length( rel ) ] do
        for j in [ 1 .. ( i - 1 ) ] do
            if IsIdenticalObj( rel[ i ][ 1 ], rel[ j ][ 1 ] ) then
                return false;
            fi;
        od;
    od;

    # since Length( S ) = Length( rel ) and the list of first components of rel is duplicate free, any element in S has to appear as a first component in rel
    
    return true;
    
end );

##
AddIsEqualForMorphisms( FinSets,
  function( map1, map2 )
    local S;
    
    if not Length( AsList( map1 ) ) = Length( AsList( map2 ) ) then
        return false;
    fi;
    
    S := Source( map1 );
    return ForAll( AsList( S ), s -> IsIdenticalObj( map1( s ), map2( s ) ) );
    
end );

##
InstallOtherMethod( ListOp,
        "for a CAP finite set and a function",
        [ IsFiniteSet, IsFunction ],
        
  function( M, f )
    
    return List( AsList( M ), f );
    
end );

##
InstallOtherMethod( FilteredOp,
        "for a CAP finite set and a function",
        [ IsFiniteSet, IsFunction ],
        
  function( M, f )
    
    return FinSetNC( Filtered( AsList( M ), f ) );
    
end );

##
InstallOtherMethod( FirstOp,
        "for a CAP finite set and a function",
        [ IsFiniteSet, IsFunction ],
        
  function( M, f )
    
    return First( AsList( M ), f );
    
end );

##
AddIdentityMorphism( FinSets,
  function( set )
    
    return MapOfFinSetsNC( set, List( set, e -> [ e, e ] ), set );
    
end );

##
InstallMethod( CallFuncList,
        "for a CAP map of finite sets and a list",
        [ IsFiniteSetMap, IsList ],
        
  function( phi, L )
    local x, y;
    
    x := L[1];
    
    y := First( AsList( phi ), pair -> IsIdenticalObj( pair[1], x) );
    
    if y = fail then
        if HasIsWellDefined( phi ) then
            if IsWellDefined( phi ) then
                Error( "the element ", x, " is not in the source of the map\n" );
            else
                if not x in Source( phi ) then
                    Error( "the element ", x, " is not in the source of the map\n" );
                else
                    Error( "the element ", x, " is in the source of the map, however, the map is not well-defined\n" );
                fi;
            fi;
        else
            Error( "the element ", x, " may not be in the source of the map, please check if the map is well-defined\n" );
        fi;
    fi;
    
    return y[2];
    
end );

##
InstallOtherMethod( ListOp,
        "for a CAP finite set and a CAP map of finite sets",
        [ IsFiniteSet, IsFiniteSetMap ],
        
  function( F, phi )
    
    return List( AsList( F ), phi );
    
end );

##
AddPreCompose( FinSets,
  function( map_pre, map_post )
    local S, cmp;
    
    S := Source( map_pre );
    
    cmp := List( S, s -> [ s, map_post( map_pre( s ) ) ] );
    
    return MapOfFinSetsNC( S, cmp, Range( map_post ) );
    
end );

##
AddTerminalObject( FinSets,
  function( arg )
    
    return FinSetNC( [ MakeImmutable( "*" ) ] );
    
end );

##
AddUniversalMorphismIntoTerminalObjectWithGivenTerminalObject( FinSets,
  function( M, T )
    local t;
    
    t := AsList( T );
    
    if not Length( t ) = 1 then
        Error( "the second argument is not a terminal object" );
    fi;

    t := t[ 1 ];
    
    return MapOfFinSetsNC( M, List( M, x -> [ x, t ] ), T );
    
end );

##
AddDirectProduct( FinSets,
  function( L )
    
    return FinSetNC( MakeImmutable( Cartesian( List( L, AsList ) ) ) );
    
end );

##
AddProjectionInFactorOfDirectProductWithGivenDirectProduct( FinSets,
  function( L, i, S)
    local T, Graph;
    
    T := L[i];
    
    Graph := List( S, x -> [ x, x[i] ] );
    
    return MapOfFinSetsNC( S, Graph, T );
    
end );

##
AddUniversalMorphismIntoDirectProductWithGivenDirectProduct( FinSets,
  function( D, tau, T )
    local S, Graph;
    
    S := Source( tau[1] );
    
    Graph := List( AsList( S ), x -> [ x, First( T, t -> ForAll( [ 1 .. Length( t ) ], i -> IsIdenticalObj( t[ i ], tau[ i ]( x ) ) ) ) ] );
    
    return MapOfFinSetsNC( S, Graph, T );
    
end );

##
AddInitialObject( FinSets,
  function( arg )
    
    return FinSetNC( [  ] );
    
end );

##
AddUniversalMorphismFromInitialObjectWithGivenInitialObject( FinSets,
  function( M, I )
    
    if not Length( I ) = 0 then
        Error( "the second argument is not an initial object" );
    fi;

    return MapOfFinSetsNC( I, [ ], M );
    
end );

##
AddCoproduct( FinSets,
  function( L )
    
    L := List( [ 1 .. Length( L ) ], i -> MakeImmutable( Cartesian( [ i ], AsList( L[i] ) ) ) );
    
    return FinSetNC( Concatenation( L ) );
    
end );

##
AddInjectionOfCofactorOfCoproductWithGivenCoproduct( FinSets,
  function( L, i, T )
    local S;
    
    S := L[i];
    
    return MapOfFinSetsNC( S, List( S, x -> [ x, First( T, t -> t[1] = i and IsIdenticalObj( t[2], x ) ) ] ), T );
    
end );

##
AddUniversalMorphismFromCoproductWithGivenCoproduct( FinSets,
  function( D, tau, S )
    local T;
    
    T := Range( tau[1] );
    
    return MapOfFinSetsNC( S, List( S, i_x -> [ i_x, tau[i_x[1]]( i_x[2] ) ] ), T );
    
end );

##
AddImageObject( FinSets,
  function( phi )
    local S, T;
    
    S := Source( phi );
    T := Range( phi );
    
    return Filtered( T, t -> ForAny( AsList( S ), s -> IsIdenticalObj( phi( s ), t ) ) );
    
end );

##
AddIsEpimorphism( FinSets,
  function( phi )
    
    return ImageObject( phi ) = Range( phi );
    
end );

##
AddIsMonomorphism( FinSets,
  function( phi )
    
    return Length( ImageObject( phi ) ) = Length( Source( phi ) );
    
end );

##
AddImageEmbedding( FinSets,
  function( phi )
    local I;
    
    I := ImageObject( phi );
    
    return MapOfFinSetsNC( I, List( I, e -> [ e, e ] ), Range( phi ) );
    
end );

##
AddCoastrictionToImage( FinSets,
  function( phi )
    local pi;
    
    pi := MapOfFinSetsNC( Source( phi ), AsList( phi ), ImageObject( phi ) );
    
    Assert( 3, IsEpimorphism( pi ) );
    
    SetIsEpimorphism( pi, true );
    
    return pi;
    
end );

##
AddEqualizer( FinSets,
  function( D )
    local f1, S;
    
    f1 := D[1];
    
    S := Source( f1 );
    
    D := D{[ 2 .. Length( D ) ]};
    
    return Filtered( S, x -> ForAll( D, fj -> IsIdenticalObj( f1( x ), fj( x ) ) ) );
    
end );

##
AddEmbeddingOfEqualizerWithGivenEqualizer( FinSets,
  function( D, E )
    
    return EmbeddingOfFinSets( E, Source( D[1] ) );
    
end );

##
AddUniversalMorphismIntoEqualizerWithGivenEqualizer( FinSets,
  function( D, tau, E )
    
    return MapOfFinSetsNC( Source( tau ), AsList( tau ), E );
    
end );

##
InstallMethod( Preimage,
        "for a CAP map of finite sets and a CAP finite set",
        [ IsFiniteSetMap, IsFiniteSet ],
        
  function( f, T_ )
    
    return Filtered( Source( f ), x -> f(x) in T_ );
    
end );

##
InstallMethod( UnionOfFinSets,
        "for a list of CAP finite sets",
        [ IsList ],
        
  function( L )
    local union, M, m;
    
    if Length( L ) = 0 then
        return FinSetNC( [ ] );
    fi;
    
    union := L[ 1 ];
    for M in L{ [ 2 .. Length( L ) ] } do
        for m in AsList( M ) do
            if not m in union then
                union := ShallowCopy( AsList( union ) );
                Add( union, m );
                union := FinSetNC( union );
            fi;
        od;
    od;
    
    return union;
    
end );

##
InstallMethod( ImageObject,
        "for a CAP map of finite sets and a CAP finite set",
        [ IsFiniteSetMap, IsFiniteSet ],
        
  function( f, S_ )
    
    return ImageObject( PreCompose( EmbeddingOfFinSets( S_, Source( f ) ), f ) );
    
end );

##
AddCoequalizer( FinSets,
  function( D )
    local T, C, images, previousImages, preimages;
    
    T := Range( D[1] );
    T := AsList( T );
    
    C := [ ];
    
    while not IsEmpty( T ) do
        images := FinSetNC( [ T[ 1 ] ] );
        previousImages := FinSetNC( [ ] );
        while previousImages <> images do
            previousImages := images;
            preimages := UnionOfFinSets( List( D, f_i -> Preimage( f_i, images ) ) );
            if Length( preimages ) > 0 then
                images := UnionOfFinSets( List( D, f_j -> ImageObject( f_j, preimages ) ) );
            fi;
        od;
        
        Add( C, AsList( images ) );
        T := Filtered( T, t -> not t in images );
    od;

    return FinSetNC( MakeImmutable( C ) );
    
end );

##
AddProjectionOntoCoequalizerWithGivenCoequalizer( FinSets,
  function( D, C )
    
    return ProjectionOfFinSets( Range( D[1] ), C );
    
end );

##
AddUniversalMorphismFromCoequalizerWithGivenCoequalizer( FinSets,
  function( D, tau, C )
    local G;
    
    G := List( C, x -> [ x, tau( x[1] ) ] );
    
    return MapOfFinSetsNC( C, G, Range( tau ) );
    
end );

## The cartesian monoidal structure

##
AddTensorProductOnObjects( FinSets,
  DirectProduct );

##
AddTensorProductOnMorphismsWithGivenTensorProducts( FinSets,
  function( s, alpha, beta, r )
    
    return DirectProductFunctorialWithGivenDirectProducts( s, [ alpha, beta ], r );
    
end );

##
AddAssociatorLeftToRightWithGivenTensorProducts( FinSets,
  AssociatorLeftToRightOfDirectProductsWithGivenDirectProducts );

##
AddAssociatorRightToLeftWithGivenTensorProducts( FinSets,
  AssociatorRightToLeftOfDirectProductsWithGivenDirectProducts );

##
AddTensorUnit( FinSets,
  TerminalObject );

##
AddLeftUnitorWithGivenTensorProduct( FinSets,
  function( M, TM )
    
    return MapOfFinSetsNC( TM, List( TM, x -> [ x, x[2] ] ), M );
    
end );

##
AddLeftUnitorInverseWithGivenTensorProduct( FinSets,
  function( M, TM )
    
    return MapOfFinSetsNC( M, List( TM, x -> [ x[2], x ] ), TM );
    
end );

##
AddRightUnitorWithGivenTensorProduct( FinSets,
  function( M, MT )
    
    return MapOfFinSetsNC( MT, List( MT, x -> [ x, x[1] ] ), M );
    
end );

##
AddRightUnitorInverseWithGivenTensorProduct( FinSets,
  function( M, MT )
    
    return MapOfFinSetsNC( M, List( MT, x -> [ x[1], x ] ), MT );
    
end );

##
AddBraidingInverseWithGivenTensorProducts( FinSets,
  function( MN, M, N, NM )
    
    return MapOfFinSetsNC( MN, List( MN, x -> [ x, x{[2,1]} ] ), NM );
    
end );

##
InstallMethod( \[\],
        "for CAP finite sets",
        [ IsFiniteSet, IsInt ],

  function( M, i )
    
    return AsList( M )[i];
    
end );

##
AddInternalHomOnObjects( FinSets,
  function( M, N )
    local m;
    
    m := Length( M );
    
    return FinSetNC( List( Tuples( AsList( N ), m ), L -> MapOfFinSetsNC( M, List( [ 1 .. m ], i -> [ M[i], L[i] ] ), N ) ) );
    
end );

##
AddInternalHomOnMorphismsWithGivenInternalHoms( FinSets,
  function( S, alpha, beta, T )
    
    return MapOfFinSetsNC( S, List( S, f -> PreCompose( alpha, f, beta ) ), T );
    
end );

##
AddEvaluationMorphismWithGivenSource( FinSets,
  function( M, N, HM_NxM )
    
    return MapOfFinSetsNC( HM_NxM, List( HM_NxM, fx -> [ fx, fx[1](fx[2]) ] ), N );
    
end );

##
AddCoevaluationMorphismWithGivenRange( FinSets,
  function( M, N, HN_MxN )
    local MN;
    
    MN := TensorProduct( M, N );
    
    return MapOfFinSetsNC( M, List( M, x -> [ x, MapOfFinSetsNC( N, List( N, y -> [ y, [ x, y ] ] ), MN ) ] ), HN_MxN );
    
end );

##
AddTensorProductToInternalHomAdjunctionMap( FinSets,
  function( M, N, f )
    local L;
    
    L := Range( f );
    
    return MapOfFinSetsNC( M, List( M, x -> [ x, MapOfFinSetsNC( N, List( N, y -> [ y, f( [ x, y ] ) ] ), L ) ] ), InternalHomOnObjects( N, L ) );
    
end );

##
AddInternalHomToTensorProductAdjunctionMap( FinSets,
  function( N, L, g )
    local M, MN;
    
    M := Source( g );
    
    MN := TensorProduct( M, N );
    
    return MapOfFinSetsNC( MN, List( MN, xy -> [ xy, g( xy[1] )( xy[2] ) ] ), L );
    
end );

##
AddMonoidalPreComposeMorphismWithGivenObjects( FinSets,
  function( HM_NxH_N_L, M, N, L, HM_L );
    
    return MapOfFinSetsNC( HM_NxH_N_L, List( HM_NxH_N_L, fg -> [ fg, PreCompose( fg[1], fg[2] ) ] ), HM_L );
    
end );

##
AddMonoidalPostComposeMorphismWithGivenObjects( FinSets,
  function( HM_NxH_N_L, M, N, L, HM_L );
    
    return MapOfFinSetsNC( HM_NxH_N_L, List( HM_NxH_N_L, fg -> [ fg, PostCompose( fg[2], fg[1] ) ] ), HM_L );
    
end );

##
AddTensorProductInternalHomCompatibilityMorphismWithGivenObjects( FinSets,
  function( S1, T1, S2, T2, L )
    local S1S2, T1T2;
    
    S1S2 := TensorProduct( S1, S2 );
    T1T2 := TensorProduct( T1, T2 );
    
    return MapOfFinSetsNC( L[1], List( L[1], fg -> [ fg, TensorProductOnMorphismsWithGivenTensorProducts( S1S2, fg[1], fg[2], T1T2 ) ] ), L[2] );
    
end );

##
Finalize( FinSets );

##
InstallMethod( Display,
        "for a CAP finite set",
        [ IsFiniteSet ],
        
  function( S )
    Display( AsList( S ) );
end );
