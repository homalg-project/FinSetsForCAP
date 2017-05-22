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
            UnderlyingGAPFinSet, Set( L )
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
        
  set -> Length( UnderlyingGAPFinSet( set ) ) );

##
AddIsEqualForObjects( FinSets,
  function( set1, set2 )
    if not Length( set1 ) = Length( set2 ) then
        return false;
    fi;
    
    return UnderlyingGAPFinSet( set1 ) = UnderlyingGAPFinSet( set2 );
    
end );

##
InstallMethod( MapOfFinSets,
        "for a two CAP finite sets and a list",
        [ IsFiniteSetRep, IsList, IsFiniteSetRep ],
        
  function( S, M, T )
    local map;
    
    if not ForAll( M, a -> IsList( a ) and Length( a ) = 2 ) then
        Error( "the list of relations has a wrong syntax\n" );
    fi;
    
    map := rec( );
    
    ObjectifyWithAttributes( map, TheTypeOfMapsOfFiniteSets,
            UnderlyingRelation, M,
            Source, S,
            Range, T
            );
    
    Add( FinSets, map );
    
    return map;
    
end );

##
AddIsWellDefinedForMorphisms( FinSets,
  function( mor )
    local S, rel, T;
    
    S := UnderlyingGAPFinSet( Source( mor ) );
    
    rel := UnderlyingRelation( mor );
    
    if not Length( S ) = Length( rel ) then
        return false;
    fi;
    
    if not Set( List( rel, a -> a[1] ) ) = S then
        return false;
    fi;
    
    T := UnderlyingGAPFinSet( Range( mor ) );
    
    return ForAll( rel, a -> a[2] in T );
    
end );

##
AddIsEqualForMorphisms( FinSets,
  function( map1, map2 )
    
    return UnderlyingRelation( map1 ) = UnderlyingRelation( map2 );
    
end );

##
AddIdentityMorphism( FinSets,
  function( set )
    local gap_set;
    
    gap_set := UnderlyingGAPFinSet( set );
    
    return MapOfFinSets( set, List( gap_set, -> e -> [ e, e ] ), set );
    
end );

##
InstallGlobalFunction( ImageFinSet,
  function( f, x )
    
    return First( UnderlyingRelation( f ), pair -> pair[1] = x )[2];
    
end );


##
AddPreCompose( FinSets,
  function( map_pre, map_post )
    local S, cmp;
    
    S := Source( map_pre );
    
    cmp := List( UnderlyingGAPFinSet( S ),
                 s -> [ s, ImageFinSet( map_post, ImageFinSet( map_pre, s ) ) ] );
    
    return MapOfFinSets( S, cmp, Range( map_post ) );
    
end );
