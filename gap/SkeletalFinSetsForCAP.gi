#
# SkeletalFinSetsForCAP: The skeletal category of finite sets
#
# Implementations
#

BindGlobal( "SkeletalFinSets", CreateCapCategory( "SkeletalFinSets" ) );

##
InstallMethod( FinSet,
        "for a nonnegative integer",
        [ IsInt ],
        
  function( n )
    local int;
    
    int:= rec( );
    
    ObjectifyWithAttributes( int, TheTypeOfSkeletalFiniteSets,
        Length, n );

    Add( SkeletalFinSets, int );
    
    Assert( 4, IsWellDefined( int ) );
    
    return int;
    
end );

##
InstallOtherMethod( AsList,
        "for CAP skeletal finite sets",
        [ IsSkeletalFiniteSetRep ],
        
  n -> Set( [ 1 .. Length( n ) ] ) );

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
        [ IsSkeletalFiniteSetRep, IsList, IsSkeletalFiniteSetRep ],
        
  function( s, G, t )
    local map;
    
    map := rec( );
    
    ObjectifyWithAttributes( map, TheTypeOfMapsOfSkeletalFiniteSets,
            AsList, G,
            Source, s,
            Range, t 
        );
    
    Add( SkeletalFinSets, map );
    
    Assert( 4, IsWellDefined( map ) );
    
    return map;
    
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
InstallOtherMethod( ListOp,
        "for a CAP skeletal finite set and a function",
        [ IsSkeletalFiniteSetRep, IsFunction ],
        
  function( s, f )

    return List( AsList( s ), f );
end );

##
InstallOtherMethod( ListOp,
        "for a CAP skeletal finite set and a CAP map of skeletal finite sets",
        [ IsSkeletalFiniteSetRep, IsSkeletalFiniteSetMapRep ],
        
  function( s, phi )
    
    return List( AsList( s ), phi );
       
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
InstallMethod( CallFuncList,
        "for a CAP map of skeletal finite sets and a list",
    [ IsSkeletalFiniteSetMapRep, IsList ],
        
  function( phi, L )
    local x;
    
    x := L[ 1 ];
    
    return AsList( phi )[ x ];
    
end );

    
##
InstallMethod( EmbeddingOfFinSets,
        "for two CAP skeletal finite sets",
        [ IsSkeletalFiniteSetRep, IsSkeletalFiniteSetRep ],
        
  function( s, t )
    local iota;
    
    iota := MapOfFinSets( s, List( s, x -> x  ), t );
    
    Assert( 3, IsMonomorphism( iota ) );
    SetIsMonomorphism( iota, true );
    
    return iota;
    
end );

##
InstallMethod( ImageObject,
     "for a CAP map of skeletal finite sets and a CAP skeletal finite set",
     [ IsSkeletalFiniteSetMapRep, IsSkeletalFiniteSetRep ],
      function( phi, s_ )

    return ImageObject( PreCompose( EmbeddingOfFinSets( s_, Source( phi ) ), phi ) );

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
    
    if not Length ( t ) = 1 then
        Error( "the second argument is not a terminal object" );
    fi;
    
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
InstallOtherMethod( FilteredOp,
        "for a CAP skeletal finite set and a function",
        [ IsSkeletalFiniteSetRep, IsFunction ],
        
  function( m, f )
    
    return FinSet( Length( Filtered( AsList( m ), f ) ) );
    
end );

##
AddEqualizer(SkeletalFinSets,
  function( D )
    local f1, s;
    
    f1 := D[ 1 ];
    
    s := Source( f1 );
    
    D := D{ [ 2 .. Length( D ) ] };
    
    return Filtered( s, x -> ForAll( D, fj -> f1( x ) = fj( x ) ) );
    
end);

##
AddEmbeddingOfEqualizerWithGivenEqualizer( SkeletalFinSets,
  function( D, E )
    local f1, s, cmp;
    
    f1 := D[ 1 ];
    
    s := Source( f1 );
    D := D{ [ 2 .. Length( D ) ] };

    cmp := Filtered( s, x -> ForAll( D, fj -> f1( x ) = fj( x ) ) );

    return MapOfFinSets( E, cmp, s );
    
end );

##
AddUniversalMorphismIntoEqualizerWithGivenEqualizer( SkeletalFinSets,
  function( D, tau, E )
    local f1, s, Eq;

    f1 := D[ 1 ];
    
    s := Source( f1 );

    Eq := Filtered( s, x -> ForAll( D, fj -> f1( x ) = fj( x ) ) );

    return MapOfFinSets( Source( tau ), List( x -> Position( Eq, tau( x ) ) ), E );
    
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
    
    if not Length( I ) = 0 then
        Error( "the second argument is not an initial object" );
    fi;

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
InstallMethod( Preimage,
        "for a CAP map of skeletal finite sets and a CAP skeletal finite set",
        [ IsSkeletalFiniteSetMapRep, IsList ],
        
  function( phi, t )

    return Filtered( Source( phi ) , x -> AsList( phi )[ x ] in t );

end );

##
ExplicitCoequalizer := function( D )
    local T, Cq, t, L, i;
    
    T := Range( D[ 1 ] );
    T := AsList( T );
    
    Cq := [ ];
    
    while not IsEmpty( T ) do
        t := T[ 1 ]; 
        t := Union( List( D, f_j -> List( Union( List( D, f_i -> Preimage( f_i, [ t ] ) ) ), f_j  ) ) );
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
    
    return Cq;

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


## The cartesian monoidal structure

##
AddTensorProductOnObjects( SkeletalFinSets,
  DirectProduct );

##
AddTensorProductOnMorphismsWithGivenTensorProducts( SkeletalFinSets,
  function( s, alpha, beta, r )
    
    return DirectProductFunctorialWithGivenDirectProducts( s, [ alpha, beta ], r );
    
end );

##
AddAssociatorLeftToRightWithGivenTensorProducts( SkeletalFinSets,
  AssociatorLeftToRightOfDirectProductsWithGivenDirectProducts );

##
AddAssociatorRightToLeftWithGivenTensorProducts( SkeletalFinSets,
  AssociatorRightToLeftOfDirectProductsWithGivenDirectProducts );

##
AddTensorUnit( SkeletalFinSets,
  TerminalObject );

##
AddLeftUnitorWithGivenTensorProduct( SkeletalFinSets,
  function( M, TM )
    
    return MapOfFinSets( TM, List( TM, x -> x ), M );
    
end );

##
AddLeftUnitorInverseWithGivenTensorProduct( SkeletalFinSets,
  function( M, TM )
    
    return MapOfFinSets( M, List( M, x -> x ), TM );
    
end );

##
AddRightUnitorWithGivenTensorProduct( SkeletalFinSets,
  function( M, MT )
    
    return MapOfFinSets( MT, List( MT, x -> x ), M );
    
end );

##
AddRightUnitorInverseWithGivenTensorProduct( SkeletalFinSets,
  function( M, MT )
    
    return MapOfFinSets( M, List( M, x -> x ), MT );
    
end );

##
AddInternalHomOnObjects( SkeletalFinSets,
  function( m, n )
        
    return FinSet( Length( List( Tuples( AsList( n ), Length( m ) ), L -> MapOfFinSets( m, L, n ) ) ) );
    
end );

##
AddInternalHomOnMorphismsWithGivenInternalHoms( SkeletalFinSets,
  function( s, alpha, beta, t )
    local S;

    S := List( Tuples( AsList( t ), Length( s ) ), L -> MapOfFinSets( s, L, t ) );

    return MapOfFinSets( s, List( S, f -> PreCompose( alpha, f, beta ) ), t );
    
end );

Finalize( SkeletalFinSets );

##
InstallMethod( Display,
        "for a CAP skeletal finite set",
        [ IsSkeletalFiniteSetRep ],
        
  function( s )
    Display( Length( s ) );
end );

##
InstallMethod( Display,
    "for a CAP map of skeletal finite sets",
        [ IsSkeletalFiniteSetMapRep ],
        
  function( phi )
    Display( [ Length( Source( phi ) ), AsList( phi ), Length( Range( phi ) ) ] );
end );
