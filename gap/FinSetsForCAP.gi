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
            UnderlyingGAPSet, Set( L )
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
        
  set -> Length( UnderlyingGAPSet( set ) ) );

##
AddIsEqualForObjects( FinSets,
  function( set1, set2 )
    if not Length( set1 ) = Length( set2 ) then
        return false;
    fi;
    
    return UnderlyingGAPSet( set1 ) = UnderlyingGAPSet( set2 );
    
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
            UnderlyingRelation, Set( G ),
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
    
    L := UnderlyingGAPSet( T );
    
    pi := MapOfFinSets( S, List( S, x -> [ x, L[PositionProperty( L, t -> x in t )] ] ), T );
    
    Assert( 3, IsEpimorphism( pi ) );
    SetIsEpimorphism( pi, true );
    
    return pi;
    
end );

##
AddIsWellDefinedForMorphisms( FinSets,
  function( mor )
    local S, rel, T;
    
    S := UnderlyingGAPSet( Source( mor ) );
    
    rel := UnderlyingRelation( mor );
    
    if not Length( S ) = Length( rel ) then
        return false;
    fi;
    
    if not Set( List( rel, a -> a[1] ) ) = S then
        return false;
    fi;
    
    T := UnderlyingGAPSet( Range( mor ) );
    
    return ForAll( rel, a -> a[2] in T );
    
end );

##
AddIsEqualForMorphisms( FinSets,
  function( map1, map2 )
    
    return UnderlyingRelation( map1 ) = UnderlyingRelation( map2 );
    
end );

##
InstallOtherMethod( ListOp,
        "for a CAP finite set and a function",
        [ IsFiniteSetRep, IsFunction ],
        
  function( F, f )
    
    return List( UnderlyingGAPSet( F ), f );
    
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
    
    y := First( UnderlyingRelation( phi ), pair -> pair[1] = x );
    
    if y = fail then
        if HasIsWellDefined( phi ) then
            if IsWellDefined( phi ) then
                Error( "the element ", x, " is not in the source of the map\n" );
            else
                if not x in UnderlyingGAPSet( Source( phi ) ) then
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
    
    return List( UnderlyingGAPSet( F ), phi );
    
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
AddDirectProduct( FinSets,
  function( L )
    
    return FinSet( Cartesian( List( L, UnderlyingGAPSet ) ) );
    
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
AddCoproduct( FinSets,
  function( L )
    
    L := List( [ 1 .. Length( L ) ], i -> Cartesian( [ i ], UnderlyingGAPSet( L[i] ) ) );
    
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
    
    pi := MapOfFinSets( Source( phi ), UnderlyingRelation( phi ), ImageObject( phi ) );
    
    Assert( 3, IsEpimorphism( pi ) );
    
    SetIsEpimorphism( pi, true );
    
    return pi;
    
end );

##
InstallOtherMethod( FilteredOp,
        "for a CAP finite set and a function",
        [ IsFiniteSetRep, IsFunction ],
        
  function( M, b )
    
    return FinSet( Filtered( UnderlyingGAPSet( M ), b ) );
    
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
    
    return MapOfFinSets( Source( tau ), UnderlyingRelation( tau ), E );
    
end );

##
InstallMethod( \in,
        "for an object and a CAP finite set",
        [ IsObject, IsFiniteSetRep ],
        
  function( y, M )
    
    return y in UnderlyingGAPSet( M );
    
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
    
    return FinSet( Union2( UnderlyingGAPSet( M ), UnderlyingGAPSet( N ) ) );
    
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
    T := UnderlyingGAPSet( T );
    
    C := [ ];
    
    for t in T do
        t := FinSet( [ t ] );
        t := Union( List( D, f_j -> ImageObject( f_j, Union( List( D, f_i -> Preimage( f_i, t ) ) ) ) ) );
        t := UnderlyingGAPSet( t );
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
    
    G := UnderlyingRelation( tau );
    
    G := List( G, t_y -> [ pi( t_y[1] ), t_y[2] ] );
    
    return MapOfFinSets( C, G, Range( tau ) );
    
end );

##
Finalize( FinSets );

##
InstallMethod( Display,
        "for a CAP finite set",
        [ IsFiniteSetRep ],
        
  function( S )
    Display( UnderlyingGAPSet( S ) );
end );
