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
    local gset;
    
    gset:= rec( );
       
    ObjectifyWithAttributes( gset, TheTypeOfSkeletalGSets,
		AsList,  L, 
		AsGroup, G );

    Add( SkeletalGSets, gset );

    return gset;
    
end );

##
AddIsWellDefinedForObjects( SkeletalGSets,
  function( N )
    local ToM, V, B, C;

    ToM:= TableOfMarks( AsGroup( N ) );

    ToM:= MatTom(ToM);

    V := VectorSpace( Rationals, ToM );

    B := Basis( V, ToM );

    C := Coefficients( B, AsList( N ) );

    return ForAll( C, a -> a >= 0 and IsInt( a )); 
    
end );

##
InstallOtherMethod( Set,
        "for CAP skeletal G sets",
        [ IsSkeletalGSetRep ],
  function( N )
    local ToM1, ToM2, l, V, B, C, L, i, U, R, Co, List, j, E, k, m, n, K;

    ToM1:= TableOfMarks( AsGroup( N ) );

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
	Co := RightCosets( AsGroup( N ), L[ i ] ); 
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
  function( N1, N2 )

    return AsGroup( N1 ) = AsGroup( N2 ) and AsList( N1 ) = AsList( N2 );
    
end );


## Morphisms

##
InstallMethod( MapOfGSets,
        "for two CAP skeletal G sets and a list",
        [ IsSkeletalGSetRep, IsList, IsSkeletalGSetRep ],
        
  function( S, G, T )
    local map;
    
    map := rec( );
    
    ObjectifyWithAttributes( map, TheTypeOfMapsOfSkeletalGSets,
            AsList, G,
            Source, S,
            Range, T 
	    );
    
    Add( SkeletalGSets, map );
     
    return map;
    
end );

##
AddIsWellDefinedForMorphisms( SkeletalGSets,
  function( mor )
    local S, T, rel;

    S := Source( mor );

    T := Range( mor );

    if not AsGroup( S ) = AsGroup( T ) then 
	return false;
    fi;
    
    rel := AsList( mor );
    
    if not AsList( S )[ 1 ] = Length( rel ) then
	return false;
    fi;
     
    if not ForAll( rel, a -> a <= AsList( T )[ 1 ] and IsPosInt( a ) ) then
	return false;
    fi;

    if not ForAll( AsGroup( S ), g -> ForAll( Set( S ), x -> [ Set( x[ 1 ] * g ), x[ 2 ] ]  in Set( S ) ) ) then
	return false;
    fi;

    if not ForAll( Set( S ), x -> ForAll( AsGroup( S ), g -> mor( Position( Set( S ), [ Set( x[ 1 ] * g ), x[ 2 ] ] ) ) = [ Set( mor( Position( Set( S ), x ) )[ 1 ] * g ), x[ 2 ] ] ) ) then
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
    
    return GSet( AsGroup( M ), List( [ 1 .. AsList( M )[ 1 ] ], x -> 1 ) );
    
end );

## Colimits

##
AddInitialObject( SkeletalGSets,
  function( arg )
    
    return GSet( AsGroup( arg ), [] );
    
end );

Finalize( SkeletalGSets );

##
InstallMethod( Display,
        "for a CAP skeletal G set",
        [ IsSkeletalGSetRep ],
        
  function( N )
    Display( [ AsGroup( N ), AsList( N ) ] );
end );