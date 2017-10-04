#
# SkeletalGSetsForCAP: The skeletal category of G sets
#
# Implementations
#

BindGlobal( "SkeletalGSets", CreateCapCategory( "SkeletalGSets" ) );

##
InstallMethod( GSet,
        "for a nonnegative integer",
        [ IsGroup, IsList ],
        
  function( G, L )
    local Omega;
    
    Omega := rec( );
    
    ObjectifyWithAttributes( Omega, TheTypeOfSkeletalGSets,
            AsList,  L, 
            UnderlyingGroup, G );
    
    Add( SkeletalGSets, Omega );
    
    return Omega;
    
end );

##
InstallMethod( TableOfMarks,
        "for a finite skeletal G-set",
        [ IsSkeletalGSetRep ],
        
  function( Omega )
    
    return TableOfMarks( UnderlyingGroup( Omega ) );
    
end );

##
InstallMethod( NrConjugacyClassesOfSubgroups,
        "for a finite skeletal G-set",
        [ IsSkeletalGSetRep ],
        
  function( Omega )
    
    return Length( MatTom( TableOfMarks( Omega ) ) );
    
end );

##
AddIsWellDefinedForObjects( SkeletalGSets,
  function( Omega )
    local L;
    
    L := AsList( Omega );
    
    if not Length( L ) = NrConjugacyClassesOfSubgroups( Omega ) then
        return false;
    fi;
    
    if not ForAll( L, a -> IsInt( a ) and a >= 0 ) then
        return false;
    fi;
    
    return true;
    
end );

##
InstallOtherMethod( Set,
        "for CAP skeletal G sets",
        [ IsSkeletalGSetRep ],
  function( N )
    local ToM1, ToM2, l, V, B, C, L, i, U, R, Co, List, j, E, k, m, n, K;
    
    ToM1:= TableOfMarks( UnderlyingGroup( N ) );
    
    ToM2:= MatTom(ToM1);
    
    l := Length( ToM2 );
    
    V := VectorSpace( Rationals, ToM2 );
    
    B := Basis( V, ToM2 );
    
    C := Coefficients( B, AsList( N ) );
    
    L := [];
    
    for i in [ 1 .. l ] do
        U := RepresentativeTom( ToM1, i );
        Add( L, U );
    od;
    
    R := [];
    
    for i in [ 1 .. l ] do 
        Co := RightCosets( UnderlyingGroup( N ), L[ i ] ); 
        List := [ 1 .. Size( Co) ];
        
        for j in [ 1 .. Size( Co ) ] do
            List[ j ] := Set( AsList( Co[ j ] ) ); 
        od;
        
        Add( R, List );
    od;
    
    E := [];
    
    for k in [ 1 .. l ] do
        for m in [ 1 .. C[ k ] ] do
            Add( E, R[ k ] );
        od;
    od;
    
    K := [];
    
    for n in [ 1 .. Size( E ) ] do
        n := Cartesian( E[ n ], [ n ] );
        Add( K, n );
    od;
    
    return Concatenation( K );
    
end );

##
AddIsEqualForObjects( SkeletalGSets,
  function( Omega1, Omega2 )
    
    return UnderlyingGroup( Omega1 ) = UnderlyingGroup( Omega2 ) and AsList( Omega1 ) = AsList( Omega2 );
    
end );


## Morphisms

##
InstallMethod( MapOfGSets,
        "for two CAP skeletal G sets and a list",
        [ IsSkeletalGSetRep, IsList, IsSkeletalGSetRep ],
        
  function( S, I, T )
    local map;
    
    map := rec( );
    
    ObjectifyWithAttributes( map, TheTypeOfMapsOfSkeletalGSets,
            AsList, I,
            Source, S,
            Range, T 
	    );
    
    Add( SkeletalGSets, map );
     
    return map;
    
end );

##
AddIsWellDefinedForMorphisms( SkeletalGSets,
  function( mor )
    local S, T, G, img, tom, k, s, t;

    S := Source( mor );

    T := Range( mor );

    G := UnderlyingGroup( S );
    
    if not G = UnderlyingGroup( T ) then 
	return false;
    fi;
    
    img := AsList( mor );
    
    k := NrConjugacyClassesOfSubgroups( S );
    
    if not Length( img ) = k then
        return false;
    fi;
    
    tom := MatTom( TableOfMarks( G ) );
    
    s := AsList( S );
    t := AsList( T );
    
    if not ForAll( [ 1 .. k ], i -> IsList( img[i] ) and Length( img[i] ) = s[i] and
               ForAll( img[i], function( e )
                                 local r, g, j;
                                 
                                 if not ( IsList( e ) and Length( e ) = 3 ) then
                                     return false;
                                 fi;
                                 
                                 r := e[1];
                                 g := e[2];
                                 j := e[3];
                                 
                                 if not ( IsPosInt( j ) and j <= k and IsPosInt( r ) and r <= t[j] and g in G and tom[j][i] > 0 ) then
                                     return false;
                                 fi;
                               end
                     )
                 ) then
        return false;
    fi;
    
    return true;
    
end );

##
InstallMethod( CallFuncList,
        "for a CAP map of skeletal G-sets and a list",
    [ IsSkeletalGSetMapRep, IsList ],
        
  function( phi, L )
    local x;
    
    x := L[ 1 ];
    
    if x = fail then
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
            Error( "please check if the map is well-defined\n" );
        fi;
    fi;
    
    return Set( Range( phi ) )[ AsList( phi )[ x ] ];
    
end );


##
AddIsEqualForMorphisms( SkeletalGSets,
  function( mor1, mor2 )
    
    return AsList( mor1 ) = AsList( mor2 );
    
end );

##
AddIdentityMorphism( SkeletalGSets,
  function( N )
    
    return MapOfGSets( N, [ 1 .. AsList( N )[ 1 ] ], N );
    
end );

##
AddPreCompose( SkeletalGSets,
  function( map_pre, map_post )
    local S, cmp;

    if IsWellDefined( map_pre ) = false or IsWellDefined( map_post ) = false then
	Error( "Check if the maps are well defined\n" );
    fi;

    S := Source( map_pre );

    cmp := List( S , i -> map_post( map_pre( i ) ) );

    return MapOfGSets( S, cmp, Range( map_post ) );
    
end );

## Limits

##
AddTerminalObject( SkeletalGSets,
  function( M )    
    
    return GSet( UnderlyingGroup( M ), List( [ 1 .. AsList( M )[ 1 ] ], x -> 1 ) );
    
end );

## Colimits

##
AddInitialObject( SkeletalGSets,
  function( arg )
    
    return GSet( UnderlyingGroup( arg ), [] );
    
end );

Finalize( SkeletalGSets );

##
InstallMethod( Display,
        "for a CAP skeletal G set",
        [ IsSkeletalGSetRep ],
        
  function( N )
    Display( [ UnderlyingGroup( N ), AsList( N ) ] );
end );