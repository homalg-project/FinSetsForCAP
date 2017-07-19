#
# FinSetsForCAP: The elementary topos of finite sets
#
# Implementations
#

BindGlobal( "FinSets", CreateCapCategory( "FinSets" ) );

##
InstallMethod( FinSet,
        "for a list",
        [ IsList ],
        
  function( L )
    local set;
    
    set := rec( );
    
    ObjectifyWithAttributes( set, TheTypeOfFiniteSets,
            AsList, Set( L )
            );
    
    Add( FinSets, set );
    
    return set;
    
end );

##
AddIsWellDefinedForObjects( FinSets,
  ReturnTrue );

##
InstallMethod( Length,
        "for CAP finite sets",
        [ IsFiniteSetRep ],
        
  set -> Length( AsList( set ) ) );

##
AddIsEqualForObjects( FinSets,
  function( set1, set2 )
    if not Length( set1 ) = Length( set2 ) then
        return false;
    fi;
    
    return AsList( set1 ) = AsList( set2 );
    
end );

##
InstallMethod( MapOfFinSets,
        "for a two CAP finite sets and a list",
        [ IsFiniteSetRep, IsList, IsFiniteSetRep ],
        
  function( S, G, T )
    local map;
    
    if not ForAll( G, a -> IsList( a ) and Length( a ) = 2 ) then
        Error( "the list of relations has a wrong syntax\n" );
    fi;
    
    map := rec( );
    
    ObjectifyWithAttributes( map, TheTypeOfMapsOfFiniteSets,
            AsList, Set( G ),
            Source, S,
            Range, T
            );
    
    Add( FinSets, map );
    
    return map;
    
end );

##
InstallMethod( EmbeddingOfFinSets,
        "for a two CAP finite sets",
        [ IsFiniteSetRep, IsFiniteSetRep ],
        
  function( S, T )
    local iota;
    
    iota := MapOfFinSets( S, List( S, x -> [ x, x ] ), T );
    
    Assert( 3, IsMonomorphism( iota ) );
    SetIsMonomorphism( iota, true );
    
    return iota;
    
end );

##
InstallMethod( ProjectionOfFinSets,
        "for a two CAP finite sets",
        [ IsFiniteSetRep, IsFiniteSetRep ],
        
  function( S, T )
    local L, pi;
    
    L := AsList( T );
    
    pi := MapOfFinSets( S, List( S, x -> [ x, L[PositionProperty( L, t -> x in t )] ] ), T );
    
    Assert( 3, IsEpimorphism( pi ) );
    SetIsEpimorphism( pi, true );
    
    return pi;
    
end );

##
AddIsWellDefinedForMorphisms( FinSets,
  function( mor )
    local S, rel, T;
    
    S := AsList( Source( mor ) );
    
    rel := AsList( mor );
    
    if not Length( S ) = Length( rel ) then
        return false;
    fi;
    
    if not Set( List( rel, a -> a[1] ) ) = S then
        return false;
    fi;
    
    T := AsList( Range( mor ) );
    
    return ForAll( rel, a -> a[2] in T );
    
end );

##
AddIsEqualForMorphisms( FinSets,
  function( map1, map2 )
    
    return AsList( map1 ) = AsList( map2 );
    
end );

##
InstallOtherMethod( ListOp,
        "for a CAP finite set and a function",
        [ IsFiniteSetRep, IsFunction ],
        
  function( F, f )
    
    return List( AsList( F ), f );
    
end );

##
AddIdentityMorphism( FinSets,
  function( set )
    
    return MapOfFinSets( set, List( set, e -> [ e, e ] ), set );
    
end );

##
InstallMethod( CallFuncList,
        "for a CAP map of finite sets and a list",
        [ IsFiniteSetMapRep, IsList ],
        
  function( phi, L )
    local x, y;
    
    x := L[1];
    
    y := First( AsList( phi ), pair -> pair[1] = x );
    
    if y = fail then
        if HasIsWellDefined( phi ) then
            if IsWellDefined( phi ) then
                Error( "the element ", x, " is not in the source of the map\n" );
            else
                if not x in AsList( Source( phi ) ) then
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
        [ IsFiniteSetRep, IsFiniteSetMapRep ],
        
  function( F, phi )
    
    return List( AsList( F ), phi );
    
end );

##
AddPreCompose( FinSets,
  function( map_pre, map_post )
    local S, cmp;
    
    S := Source( map_pre );
    
    cmp := List( S, s -> [ s, map_post( map_pre( s ) ) ] );
    
    return MapOfFinSets( S, cmp, Range( map_post ) );
    
end );

##
AddTerminalObject( FinSets,
  function( arg )
    
    return FinSet( [ "*" ] );
    
end );

##
AddUniversalMorphismIntoTerminalObjectWithGivenTerminalObject( FinSets,
  function( M, T )
    local t;
    
    t := AsList( T );
    
    if not Length( t ) = 1 then
        Error( "the second argument is not a terminal object" );
    fi;

    t := t[1];
    
    return MapOfFinSets( M, List( M, x -> [ x, t ] ), T );
    
end );

##
AddDirectProduct( FinSets,
  function( L )
    
    return FinSet( Cartesian( List( L, AsList ) ) );
    
end );

##
AddProjectionInFactorOfDirectProduct( FinSets,
  function( L, i )
    local S, T;
    
    S := DirectProduct( L );
    
    T := L[i];
    
    return MapOfFinSets( S, List( S, x -> [ x, x[i] ] ), T );
    
end );

##
AddUniversalMorphismIntoDirectProductWithGivenDirectProduct( FinSets,
  function( D, tau, T )
    local S;
    
    S := Source( tau[1] );
    
    return MapOfFinSets( S, List( S, x -> List( tau, f -> f(x) ) ), T );
    
end );

##
AddInitialObject( FinSets,
  function( arg )
    
    return FinSet( [  ] );
    
end );

##
AddUniversalMorphismFromInitialObjectWithGivenInitialObject( FinSets,
  function( M, I )
    
    if not Length( I ) = 0 then
        Error( "the second argument is not an initial object" );
    fi;

    return MapOfFinSets( I, [ ], M );
    
end );

##
AddCoproduct( FinSets,
  function( L )
    
    L := List( [ 1 .. Length( L ) ], i -> Cartesian( [ i ], AsList( L[i] ) ) );
    
    return FinSet( Concatenation( L ) );
    
end );

##
AddInjectionOfCofactorOfCoproduct( FinSets,
  function( L, i )
    local S, T;
    
    S := L[i];
    
    T := Coproduct( L );
    
    return MapOfFinSets( S, List( S, x -> [ x, [ i, x ] ] ), T );
    
end );

##
AddUniversalMorphismFromCoproductWithGivenCoproduct( FinSets,
  function( D, tau, S )
    local T;
    
    T := Range( tau[1] );
    
    return MapOfFinSets( S, List( S, i_x -> [ i_x, tau[i_x[1]]( i_x[2] ) ] ), T );
    
end );

##
AddImageObject( FinSets,
  function( phi )
    
    return FinSet( Set( List( Source( phi ), phi ) ) );
    
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
    
    return MapOfFinSets( I, List( I, e -> [ e, e ] ), Range( phi ) );
    
end );

##
AddCoastrictionToImage( FinSets,
  function( phi )
    local pi;
    
    pi := MapOfFinSets( Source( phi ), AsList( phi ), ImageObject( phi ) );
    
    Assert( 3, IsEpimorphism( pi ) );
    
    SetIsEpimorphism( pi, true );
    
    return pi;
    
end );

##
InstallOtherMethod( FilteredOp,
        "for a CAP finite set and a function",
        [ IsFiniteSetRep, IsFunction ],
        
  function( M, b )
    
    return FinSet( Filtered( AsList( M ), b ) );
    
end );

##
AddEqualizer( FinSets,
  function( D )
    local f1, S;
    
    f1 := D[1];
    
    S := Source( f1 );
    
    D := D{[ 2 .. Length( D ) ]};
    
    return Filtered( S, x -> ForAll( D, fj -> f1( x ) = fj( x ) ) );
    
end );

##
AddEmbeddingOfEqualizerWithGivenEqualizer( FinSets,
  function( D, E )
    
    return EmbeddingOfFinSets( E, Source( D[1] ) );
    
end );

##
AddUniversalMorphismIntoEqualizerWithGivenEqualizer( FinSets,
  function( D, tau, E )
    
    return MapOfFinSets( Source( tau ), AsList( tau ), E );
    
end );

##
InstallMethod( \in,
        "for an object and a CAP finite set",
        [ IsObject, IsFiniteSetRep ],
        
  function( y, M )
    
    return y in AsList( M );
    
end );

##
InstallMethod( Preimage,
        "for a CAP map of finite sets and a CAP finite set",
        [ IsFiniteSetMapRep, IsFiniteSetRep ],
        
  function( f, T_ )
    
    return Filtered( Source( f ), x -> f(x) in T_ );
    
end );

##
InstallOtherMethod( Union2,
        "for a CAP map of finite sets and a CAP finite set",
        [ IsFiniteSetRep, IsFiniteSetRep ],
        
  function( M, N )
    
    return FinSet( Union2( AsList( M ), AsList( N ) ) );
    
end );

##
InstallMethod( ImageObject,
        "for a CAP map of finite sets and a CAP finite set",
        [ IsFiniteSetMapRep, IsFiniteSetRep ],
        
  function( f, S_ )
    
    return ImageObject( PreCompose( EmbeddingOfFinSets( S_, Source( f ) ), f ) );
    
end );

##
AddCoequalizer( FinSets,
  function( D )
    local T, C, t;
    
    T := Range( D[1] );
    T := AsList( T );
    
    C := [ ];
    
    for t in T do
        t := FinSet( [ t ] );
        t := Union( List( D, f_j -> ImageObject( f_j, Union( List( D, f_i -> Preimage( f_i, t ) ) ) ) ) );
        t := AsList( t );
        if not t = [ ] then
            Add( C, t );
            T := Difference( T, t );
        fi;
    od;
    
    Append( C, List( T, t -> [ t ] ) );
    
    return FinSet( C );
    
end );

##
AddProjectionOntoCoequalizerWithGivenCoequalizer( FinSets,
  function( D, C )
    
    return ProjectionOfFinSets( Range( D[1] ), C );
    
end );

##
AddUniversalMorphismFromCoequalizerWithGivenCoequalizer( FinSets,
  function( D, tau, C )
    local pi, G;
    
    pi := ProjectionOntoCoequalizerWithGivenCoequalizer( D, C );
    
    Assert( 0, IsWellDefined( tau ) );
    
    G := AsList( tau );
    
    G := List( G, t_y -> [ pi( t_y[1] ), t_y[2] ] );
    
    return MapOfFinSets( C, G, Range( tau ) );
    
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
    
    return MapOfFinSets( TM, List( TM, x -> [ x, x[2] ] ), M );
    
end );

##
AddLeftUnitorInverseWithGivenTensorProduct( FinSets,
  function( M, TM )
    
    return MapOfFinSets( M, List( TM, x -> [ x[2], x ] ), TM );
    
end );

##
AddRightUnitorWithGivenTensorProduct( FinSets,
  function( M, MT )
    
    return MapOfFinSets( MT, List( MT, x -> [ x, x[1] ] ), M );
    
end );

##
AddRightUnitorInverseWithGivenTensorProduct( FinSets,
  function( M, MT )
    
    return MapOfFinSets( M, List( MT, x -> [ x[1], x ] ), MT );
    
end );

##
AddBraidingInverseWithGivenTensorProducts( FinSets,
  function( MN, M, N, NM )
    
    return MapOfFinSets( MN, List( MN, x -> [ x, x{[2,1]} ] ), NM );
    
end );

##
InstallMethod( \[\],
        "for CAP finite sets",
        [ IsFiniteSetRep, IsInt ],

  function( M, i )
    
    return AsList( M )[i];
    
end );

##
AddInternalHomOnObjects( FinSets,
  function( M, N )
    local m;
    
    m := Length( M );
    
    return FinSet( List( Tuples( AsList( N ), m ), L -> MapOfFinSets( M, List( [ 1 .. m ], i -> [ M[i], L[i] ] ), N ) ) );
    
end );

##
AddInternalHomOnMorphismsWithGivenInternalHoms( FinSets,
  function( S, alpha, beta, T )
    
    return MapOfFinSets( S, List( S, f -> PreCompose( alpha, f, beta ) ), T );
    
end );

##
AddEvaluationMorphismWithGivenSource( FinSets,
  function( M, N, HM_NxM )
    
    return MapOfFinSets( HM_NxM, List( HM_NxM, fx -> [ fx, fx[1](fx[2]) ] ), N );
    
end );

##
AddCoevaluationMorphismWithGivenRange( FinSets,
  function( M, N, HN_MxN )
    local MN;
    
    MN := TensorProduct( M, N );
    
    return MapOfFinSets( M, List( M, x -> [ x, MapOfFinSets( N, List( N, y -> [ y, [ x, y ] ] ), MN ) ] ), HN_MxN );
    
end );

##
AddTensorProductToInternalHomAdjunctionMap( FinSets,
  function( M, N, f )
    local L;
    
    L := Range( f );
    
    return MapOfFinSets( M, List( M, x -> [ x, MapOfFinSets( N, List( N, y -> [ y, f( [ x, y ] ) ] ), L ) ] ), InternalHomOnObjects( N, L ) );
    
end );

##
AddInternalHomToTensorProductAdjunctionMap( FinSets,
  function( N, L, g )
    local M, MN;
    
    M := Source( g );
    
    MN := TensorProduct( M, N );
    
    return MapOfFinSets( MN, List( MN, xy -> [ xy, g( xy[1] )( xy[2] ) ] ), L );
    
end );

##
AddMonoidalPreComposeMorphismWithGivenObjects( FinSets,
  function( HM_NxH_N_L, M, N, L, HM_L );
    
    return MapOfFinSets( HM_NxH_N_L, List( HM_NxH_N_L, fg -> [ fg, PreCompose( fg[1], fg[2] ) ] ), HM_L );
    
end );

##
AddMonoidalPostComposeMorphismWithGivenObjects( FinSets,
  function( HM_NxH_N_L, M, N, L, HM_L );
    
    return MapOfFinSets( HM_NxH_N_L, List( HM_NxH_N_L, fg -> [ fg, PostCompose( fg[2], fg[1] ) ] ), HM_L );
    
end );

##
AddTensorProductInternalHomCompatibilityMorphismWithGivenObjects( FinSets,
  function( S1, T1, S2, T2, L )
    local S1S2, T1T2;
    
    S1S2 := TensorProduct( S1, S2 );
    T1T2 := TensorProduct( T1, T2 );
    
    return MapOfFinSets( L[1], List( L[1], fg -> [ fg, TensorProductOnMorphismsWithGivenTensorProducts( S1S2, fg[1], fg[2], T1T2 ) ] ), L[2] );
    
end );

##
Finalize( FinSets );

##
InstallMethod( Display,
        "for a CAP finite set",
        [ IsFiniteSetRep ],
        
  function( S )
    Display( AsList( S ) );
end );
