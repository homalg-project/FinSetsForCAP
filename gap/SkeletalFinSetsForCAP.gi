#
# SkeletalFinSetsForCAP: The elementary topos of skeletal finite sets
#
# Implementations
#

BindGlobal( "SkeletalFinSets", CreateCapCategory( "SkeletalFinSets" ) );

DisableAddForCategoricalOperations( SkeletalFinSets );

AddObjectRepresentation( SkeletalFinSets, IsSkeletalFiniteSet );

AddMorphismRepresentation( SkeletalFinSets, IsSkeletalFiniteSetMap );

##
InstallMethod( FinSet,
        "for a nonnegative integer",
        [ IsInt ],
        
  function( n )
    local int;
    
    int := rec( );
    
    ObjectifyObjectForCAPWithAttributes( int, SkeletalFinSets,
        Length, n,
        AsList, [ 1 .. n ]
        );

    Assert( 4, IsWellDefined( int ) );
    
    return int;
    
end );

##
InstallOtherMethod( ListOp,
        "for a CAP skeletal finite set and a function",
        [ IsSkeletalFiniteSet, IsFunction ],
        
  function( s, f )

    return List( AsList( s ), f );
end );

##
AddIsWellDefinedForObjects( SkeletalFinSets, 
   n -> Length( n ) >= 0 );

##
AddIsEqualForObjects( SkeletalFinSets,
  function( n1, n2 )

    return Length( n1 ) = Length( n2 );
    
end );


## Morphisms

##
InstallMethod( MapOfFinSets,
        "for two CAP skeletal finite sets and a list",
        [ IsSkeletalFiniteSet, IsList, IsSkeletalFiniteSet ],
        
  function( s, G, t )
    local map;
    
    map := rec( );
    
    ObjectifyMorphismForCAPWithAttributes( map, SkeletalFinSets,
            AsList, G,
            Source, s,
            Range, t
        );
    
    Assert( 4, IsWellDefined( map ) );
    
    return map;
    
end );

##
InstallMethod( EmbeddingOfFinSets,
        "for two CAP skeletal finite sets",
        [ IsSkeletalFiniteSet, IsSkeletalFiniteSet ],
        
  function( s, t )
    local iota;
    
    iota := MapOfFinSets( s, List( s, x -> x  ), t );
    
    Assert( 3, IsMonomorphism( iota ) );
    SetIsMonomorphism( iota, true );
    
    return iota;
    
end );

##
InstallMethod( Preimage,
        "for a CAP map of skeletal finite sets and a CAP skeletal finite set",
        [ IsSkeletalFiniteSetMap, IsList ],
        
  function( phi, t )

    return Filtered( AsList( Source( phi ) ), x -> phi( x ) in t );

end );

##
InstallMethod( ImageObject,
     "for a CAP map of skeletal finite sets and a CAP skeletal finite set",
     [ IsSkeletalFiniteSetMap, IsSkeletalFiniteSet ],
      function( phi, s_ )

    return ImageObject( PreCompose( EmbeddingOfFinSets( s_, Source( phi ) ), phi ) );

end );

##
InstallMethod( CallFuncList,
        "for a CAP map of skeletal finite sets and a list",
    [ IsSkeletalFiniteSetMap, IsList ],
        
  function( phi, L )
    local x;
    
    x := L[ 1 ];
    
    return AsList( phi )[ x ];
    
end );

##
InstallOtherMethod( ListOp,
        "for a CAP skeletal finite set and a CAP map of skeletal finite sets",
        [ IsSkeletalFiniteSet, IsSkeletalFiniteSetMap ],
        
  function( s, phi )
    
    return List( AsList( s ), phi );
       
end );

##
AddIsWellDefinedForMorphisms( SkeletalFinSets,
  function( mor )
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
    
    if not ForAll( rel, a -> a <= t  ) then
        return false;
    fi;
    
    return true;
    
end );

##
AddIsEqualForMorphisms( SkeletalFinSets,
  function( mor1, mor2 )
    
    return AsList( mor1 ) = AsList( mor2 );
    
end );

##
AddIdentityMorphism( SkeletalFinSets,
  function( n )
    
    return MapOfFinSets( n, [ 1 .. Length( n ) ], n );
    
end );

##
AddPreCompose( SkeletalFinSets,
  function( map_pre, map_post )
    local s, cmp;

    s := Source( map_pre );

    cmp := List( s, i -> AsList( map_post )[ AsList( map_pre )[ i ] ] );

    return MapOfFinSets( s, cmp, Range( map_post ) );
    
end );
    
##
AddImageObject( SkeletalFinSets,
  function( phi )
    
    return FinSet( Length( Set( AsList( phi ) ) ) );
    
end );

##
AddIsEpimorphism( SkeletalFinSets,
  function( phi )
    local imgs, testList, img;
    
    imgs := AsList( phi );
    
    testList := ListWithIdenticalEntries( Length( Range( phi ) ), 0 );
    
    for img in imgs do
        testList[ img ] := 1;
    od;

    return ForAll( testList, test -> test = 1 );
    
end );

##
AddIsMonomorphism( SkeletalFinSets,
  function( phi )
    local imgs, testList, img;
    
    imgs := AsList( phi );
    
    testList := ListWithIdenticalEntries( Length( Range( phi ) ), 0 );
    
    for img in imgs do
        if testList[ img ] = 1 then
            return false;
        fi;
        testList[ img ] := 1;
    od;

    return true;
    
end );

##
AddImageEmbedding( SkeletalFinSets,
  function( phi )
    
    return MapOfFinSets( ImageObject( phi ), Set( AsList( phi ) ), Range( phi ) );

end );

##
AddCoastrictionToImage( SkeletalFinSets,
  function( phi )
    local G, L, l, pi;
    
    G := AsList( phi );
    
    L := [];
    
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
AddTerminalObject( SkeletalFinSets,
  function( arg )
    
    return FinSet( 1 );
    
end );

##
AddUniversalMorphismIntoTerminalObjectWithGivenTerminalObject( SkeletalFinSets,
  function( m, t )
    local M;
    
    M := AsList( m );

    return MapOfFinSets( m, List( M, a -> Length( t ) ), t );
    
end );

##
AddDirectProduct( SkeletalFinSets,
  function( L )
    local int, l;

    int := 1;
    for l in L do
        int := int * Length( l );
    od;

    return FinSet( int );
    
end );

##
ProjectionInFactorOfBinaryDirectProduct := function( L, pos )
    local S, T, n, imgs, i;
    
    S := DirectProduct( L );
    T := L[ pos ];
    
    n := Length( L[ 2 ] );
    
    imgs := [];

    for i in AsList( S ) do
        if pos = 2 then
            Add( imgs, ( i-1 ) mod n );
        else
            Add( imgs, Int( ( i-1 ) / n ) );
        fi;
    od;
    
    imgs := List( imgs, img -> img + 1 );

    return MapOfFinSets( S, imgs, T );
end;

AddProjectionInFactorOfDirectProduct( SkeletalFinSets,
  function( L, pos )
    local P, pi1, pi2;
    
    if Length( L ) = 1 then
        return IdentityMorphism( L[ 1 ] );
    fi;
    
    P := DirectProduct( L{ [ 2 .. Length( L ) ] } );
    
    if pos = 1 then
        return ProjectionInFactorOfBinaryDirectProduct( [ L[ 1 ], P ], 1 );
    else
        pi1 := ProjectionInFactorOfBinaryDirectProduct( [ L[ 1 ], P ], 2 );
        pi2 := ProjectionInFactorOfDirectProduct( L{ [ 2 .. Length( L ) ] }, pos - 1 );
        return PreCompose( pi1, pi2 );
    fi;
    
end );

##
UniversalMorphismIntoBinaryDirectProductWithGivenDirectProduct := function( D, tau, T )
    local S, n, imgs, i;
    
    S := Source( tau[ 1 ] );
    
    n := Length( D[ 2 ] );
    
    imgs := [];
    
    for i in AsList( S ) do
    
        Add( imgs, ( AsList( tau[ 1 ] )[ i ] - 1 ) * n + AsList( tau[ 2 ] )[ i ] );
        
    od;
    
    return MapOfFinSets( S, imgs, T );
    
end;

AddUniversalMorphismIntoDirectProductWithGivenDirectProduct( SkeletalFinSets,
  function( D, tau, T )
    local D2, tau2, sigma;
    
    if Length( D ) = 1 then
        return tau[ 1 ];
    fi;
    
    if Length( D ) = 2 then
        return UniversalMorphismIntoBinaryDirectProductWithGivenDirectProduct( D, tau, T );
    fi;
    
    D2 := D{ [ 2 .. Length( D ) ] };
    tau2 := tau{ [ 2 .. Length( tau ) ] };
    
    sigma := UniversalMorphismIntoDirectProduct( D2, tau2 );
    return UniversalMorphismIntoBinaryDirectProductWithGivenDirectProduct( [ D[ 1 ], DirectProduct( D2 ) ], [ tau[ 1 ], sigma ], T );
    
end );

##
AddEqualizer(SkeletalFinSets,
  function( D )
    local f1, s, Eq;
    
    f1 := D[ 1 ];
    
    s := Source( f1 );
    
    D := D{ [ 2 .. Length( D ) ] };
    
    Eq := Filtered( AsList( s ), x -> ForAll( D, fj -> f1( x ) = fj( x ) ) );
    
    return FinSet( Length( Eq ) );
    
end);

##
AddEmbeddingOfEqualizerWithGivenEqualizer( SkeletalFinSets,
  function( D, E )
    local f1, s, cmp;
    
    f1 := D[ 1 ];
    
    s := Source( f1 );
    D := D{ [ 2 .. Length( D ) ] };

    cmp := Filtered( AsList( s ), x -> ForAll( D, fj -> f1( x ) = fj( x ) ) );

    return MapOfFinSets( E, cmp, s );
    
end );

##
AddUniversalMorphismIntoEqualizerWithGivenEqualizer( SkeletalFinSets,
  function( D, tau, E )
    local f1, s, Eq;

    f1 := D[ 1 ];
    
    s := Source( f1 );

    Eq := Filtered( AsList( s ), x -> ForAll( D, fj -> f1( x ) = fj( x ) ) );

    return MapOfFinSets( Source( tau ), List( Source( tau ), x -> Position( Eq, tau( x ) ) ), E );
    
end );


## Colimits

##
AddInitialObject( SkeletalFinSets,
  function( arg )
    
    return FinSet( 0 );
    
end );

##
AddUniversalMorphismFromInitialObjectWithGivenInitialObject( SkeletalFinSets,
  function( m, I )
    
    return MapOfFinSets( I, [ ], m );
    
end );

##
AddCoproduct( SkeletalFinSets,
  function( L )
    
    return FinSet( Sum( L, x -> Length( x ) ) );
    
end );

##
AddInjectionOfCofactorOfCoproduct( SkeletalFinSets,
  function( L, i )
    local s, O, sum, cmp;
    
    O := L{ [ 1 .. i-1 ] };
    
    sum := Sum( O, x -> Length( x ) );
    
    s := L[ i ]; 
    
    cmp := List( s, x -> sum + x );
    
    return MapOfFinSets( s, cmp, Coproduct( L ) );

end );

##
AddUniversalMorphismFromCoproductWithGivenCoproduct( SkeletalFinSets,
  function( L, tau, S )
    local T, cmp;
    
    T := Range( tau[ 1 ] );

    cmp := Concatenation( List( [ 1 .. Length( tau ) ], x -> AsList( tau[ x ] ) ) );    

    return MapOfFinSets( S, cmp, T );
    
end );

##
ExplicitCoequalizer := function( D )
    local T, Cq, t, L, i;
    
    T := Range( D[ 1 ] );
    T := AsList( T );
    
    Cq := [ ];
    
    while not IsEmpty( T ) do
        t := T[ 1 ]; 
        t := Union( List( D, f_j -> List( Union( List( D, f_i -> Preimage( f_i, [ t ] ) ) ), f_j ) ) );
        t := AsList( t );
        if IsEmpty( t ) then
            t := [ T[ 1 ] ];
        fi;
        Add( Cq, t );
        T := Difference( T, t );
    od;
    
    T := AsList( Range( D[ 1 ] ) );
    
    if not Concatenation( Cq ) = T then
        for t in T do
            L := [];
            for i in [ 1 .. Length( Cq )] do
                if t in Cq[ i ] then 
                    Add( L, Cq[ i ] );
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
  function( D )
  
    return FinSet( Length( ExplicitCoequalizer( D ) ) );
    
end );

##
AddProjectionOntoCoequalizerWithGivenCoequalizer( SkeletalFinSets,
  function( D, C )
    local Cq, s, cmp;

    Cq := ExplicitCoequalizer( D );
    
    s := Range( D[ 1 ] );
    
    cmp := List( s, x -> First( Cq, c -> x in c ) ); 
    
    cmp := List( cmp, x -> Position( Cq, x ) );
    
    return MapOfFinSets( s, cmp, C );
    
end );

##
AddUniversalMorphismFromCoequalizerWithGivenCoequalizer( SkeletalFinSets,
  function( D, tau, C )
    local Cq;
    
    Cq := ExplicitCoequalizer( D );

    return MapOfFinSets( C, List( Cq, x -> tau( x[ 1 ] ) ), Range( tau ) );
    
 end ); 

Finalize( SkeletalFinSets );

##
InstallMethod( Display,
        "for a CAP skeletal finite set",
        [ IsSkeletalFiniteSet ],
        
  function( s )
    Display( Length( s ) );
end );

##
InstallMethod( Display,
    "for a CAP map of skeletal finite sets",
        [ IsSkeletalFiniteSetMap ],
        
  function( phi )
    Display( [ Length( Source( phi ) ), AsList( phi ), Length( Range( phi ) ) ] );
end );
