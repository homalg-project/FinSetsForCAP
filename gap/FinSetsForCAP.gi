#
# FinSetsForCAP: FinSets
#
# Implementations
#

BindGlobal( "FinSets", CreateCapCategory( "FinSets" ) );

SetIsCartesianClosedCategory( FinSets, true );

DisableAddForCategoricalOperations( FinSets );

AddObjectRepresentation( FinSets, IsFiniteSet );

AddMorphismRepresentation( FinSets, IsFiniteSetMap );

##
InstallMethod( IsEqualForElementsOfFinSets,
        "for two integers",
        [ IsInt, IsInt ],
        
  \= );

InstallMethod( IsEqualForElementsOfFinSets,
        "for two chars",
        [ IsChar, IsChar ],
        
  \= );

InstallMethod( IsEqualForElementsOfFinSets,
        "for two strings",
        [ IsString, IsString ],
        
  \= );

InstallMethod( IsEqualForElementsOfFinSets,
        "for two objects",
        [ IsObject, IsObject ],
        
  IsIdenticalObj );

InstallMethod( IsEqualForElementsOfFinSets,
        "for two lists",
        [ IsList, IsList ],
        
  function ( L1, L2 )
    local i;
    
    # compare lists recursively

    if Length( L1 ) <> Length( L2 ) then
        return false;
    fi;

    for i in [ 1 .. Length( L1 ) ] do
        if IsBound( L1[i] ) <> IsBound( L2[i] ) then
            return false;
        fi;
        
        if IsBound( L1[i] ) then
            if not IsEqualForElementsOfFinSets( L1[i], L2[i] ) then
                return false;
            fi;
        fi;
    od;
    
    return true;
    
end );

InstallMethod( IsEqualForElementsOfFinSets,
        "for two records",
        [ IsRecord, IsRecord ],
        
  function ( a, b )
    local i;
    
    # compare records recursively

    if RecNames( a ) <> RecNames( b ) then
        return false;
    fi;
    
    for i in RecNames( a ) do
        if not IsEqualForElementsOfFinSets( a.(i), b.(i) ) then
            return false;
        fi;
    od;
    
    return true;
    
end );

InstallMethod( IsEqualForElementsOfFinSets,
        "for two CAP category objects",
        [ IsCapCategoryObject, IsCapCategoryObject ],
        
  function ( a, b )
    # compare CAP category objects using IsEqualForObjects (if available)
    
    if HasCapCategory( a ) and HasCapCategory( b ) and ApplicableMethod( IsEqualForObjects, [ a, b ] ) <> fail then
        return IsIdenticalObj( CapCategory( a ), CapCategory( b ) ) and IsEqualForObjects( a, b );
    fi;
    
    TryNextMethod();
    
end );

InstallMethod( IsEqualForElementsOfFinSets,
        "for two CAP category morphisms",
        [ IsCapCategoryMorphism, IsCapCategoryMorphism ],
        
  function ( a, b )
    # compare CAP category objects using IsEqualForMorphisms (if available)
    
    if HasCapCategory( a ) and HasCapCategory( b ) and ApplicableMethod( IsEqualForMorphismsOnMor, [ a, b ] ) <> fail then
        return IsIdenticalObj( CapCategory( a ), CapCategory( b ) ) and IsEqualForMorphismsOnMor( a, b );
    fi;
    
    TryNextMethod();
    
end );

##
InstallMethod( FinSet,
        "for a list",
        [ IsList ],
        
  function ( L )
    
    return FinSetNC( Set( L ) );
    
end );

##
InstallMethod( FinSetNC,
        "for a list",
        [ IsList ],
        
  function ( L )
    local set, i;
    
    set := rec( );
    
    ObjectifyObjectForCAPWithAttributes( set, FinSets,
            AsList, L,
            Length, Length( L )
            );
    
    Assert( 4, IsWellDefined( set ) );

    for i in [ 1 .. Length( L ) ] do
        if IsBound( L[i] ) and not IsEqualForElementsOfFinSets( L[i], AsList( set )[i] ) then
            Display( "Warning: The elements of the list passed to the constructor are not equal (w.r.t. IsEqualForElementsOfFinSets) to the elements of the resulting FinSet. Either pass an immutable copy of the list or add an additional special case to IsEqualForElementsOfFinSets to avoid this warning." );
            break;
        fi;
    od;

    return set;
    
end );

##
InstallMethod( \in,
        "for an object and a CAP finite set",
        [ IsObject, IsFiniteSet ],
        
  function ( y, M )
    
    return ForAny( AsList( M ), m -> IsEqualForElementsOfFinSets( m, y ) );
    
end );

##
InstallMethod( \[\],
        "for CAP finite sets",
        [ IsFiniteSet, IsInt ],

  function ( M, i )
    
    return AsList( M )[i];
    
end );

##
InstallMethod( Iterator,
        "for CAP finite sets",
        [ IsFiniteSet ],

  function ( M )
    
    return Iterator( AsList( M ) );
    
end );

##
InstallMethod( UnionOfFinSets,
        "for a list of CAP finite sets",
        [ IsList ],
        
  function ( L )
    local union, M, m;
    
    union := FinSet( [ ] );
    for M in L do
        for m in M do
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
InstallMethod( ListOp,
        "for a CAP finite set and a function",
        [ IsFiniteSet, IsFunction ],
        
  function ( M, f )
    
    return List( AsList( M ), f );
    
end );

##
InstallMethod( FilteredOp,
        "for a CAP finite set and a function",
        [ IsFiniteSet, IsFunction ],
        
  function ( M, f )
    
    return FinSetNC( Filtered( AsList( M ), f ) );
    
end );

##
InstallMethod( FirstOp,
        "for a CAP finite set and a function",
        [ IsFiniteSet, IsFunction ],
        
  function ( M, f )
    
    return First( AsList( M ), f );
    
end );

##
AddIsWellDefinedForObjects( FinSets,
  function ( set )
    local L, i, j;
    
    L := AsList( set );
    
    if not IsDenseList( L ) then
        return false;
    fi;
    
    for i in [ 1 .. Length( L ) ] do
        for j in [ 1 .. ( i - 1 ) ] do
            if IsEqualForElementsOfFinSets( L[i], L[j] ) then
                return false;
            fi;
        od;
    od;
    
    return true;
  
end );

##
AddIsEqualForObjects( FinSets,
  function ( set1, set2 )
    if not Length( set1 ) = Length( set2 ) then
        return false;
    fi;
    
    return IsEqualForElementsOfFinSets( AsList( set1 ), AsList( set2 ) );
    
end );

##
InstallMethod( MapOfFinSets,
        "for two CAP finite sets and a list",
        [ IsFiniteSet, IsList, IsFiniteSet ],
        
  function ( S, G, T )
    
    return MapOfFinSetsNC( S, Set( G ), T );
    
end );

##
InstallMethod( MapOfFinSetsNC,
        "for a two CAP finite sets and a list",
        [ IsFiniteSet, IsList, IsFiniteSet ],
        
  function ( S, G, T )
    local map;
    
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
        
  function ( S, T )
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
        
  function ( S, T )
    local pi;
    
    pi := MapOfFinSetsNC( S, List( S, x -> [ x, First( T, t -> x in t ) ] ), T );
    
    Assert( 3, IsEpimorphism( pi ) );
    SetIsEpimorphism( pi, true );
    
    return pi;
    
end );

##
InstallMethod( Preimage,
        "for a CAP map of finite sets and a CAP finite set",
        [ IsFiniteSetMap, IsFiniteSet ],
        
  function ( f, T_ )
    
    return Filtered( Source( f ), x -> f(x) in T_ );
    
end );

##
InstallMethod( ImageObject,
        "for a CAP map of finite sets and a CAP finite set",
        [ IsFiniteSetMap, IsFiniteSet ],
        
  function ( f, S_ )
    
    return ImageObject( PreCompose( EmbeddingOfFinSets( S_, Source( f ) ), f ) );
    
end );

##
InstallMethod( CallFuncList,
        "for a CAP map of finite sets and a list",
        [ IsFiniteSetMap, IsList ],
        
  function ( phi, L )
    local x, y;
    
    x := L[1];
    
    y := First( AsList( phi ), pair -> IsEqualForElementsOfFinSets( pair[1], x ) );
    
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
InstallMethod( ListOp,
        "for a CAP finite set and a CAP map of finite sets",
        [ IsFiniteSet, IsFiniteSetMap ],
        
  function ( F, phi )
    
    return List( AsList( F ), phi );
    
end );

##
AddIsWellDefinedForMorphisms( FinSets,
  function ( mor )
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
    
    if not ForAll( rel, a -> IsList( a ) and Length( a ) = 2 and a[1] in S and a[ 2 ] in T ) then
        return false;
    fi;
    
    for i in [ 1 .. Length( rel ) ] do
        for j in [ 1 .. ( i - 1 ) ] do
            if IsEqualForElementsOfFinSets( rel[i][1], rel[j][1] ) then
                return false;
            fi;
        od;
    od;

    # since Length( S ) = Length( rel ) and the list of first components of rel is duplicate free, any element in S has to appear as a first component in rel
    
    return true;
    
end );

##
AddIsEqualForMorphisms( FinSets,
  function ( map1, map2 )
    local S;
    
    S := Source( map1 );
    
    # if map1 and map2 are well-defined, then Length( AsList( map1 ) ) = Length( AsList( S ) ) = Length( AsList( map2 ) )
    
    return ForAll( AsList( S ), s -> IsEqualForElementsOfFinSets( map1( s ), map2( s ) ) );
    
end );

##
AddIdentityMorphism( FinSets,
  function ( set )
    
    return MapOfFinSetsNC( set, List( set, e -> [ e, e ] ), set );
    
end );

##
AddPreCompose( FinSets,
  function ( map_pre, map_post )
    local S, cmp;
    
    S := Source( map_pre );
    
    cmp := List( S, s -> [ s, map_post( map_pre( s ) ) ] );
    
    return MapOfFinSetsNC( S, cmp, Range( map_post ) );
    
end );

##
AddTerminalObject( FinSets,
  function ( arg )
    
    return FinSetNC( [ "*" ] );
    
end );

##
AddUniversalMorphismIntoTerminalObjectWithGivenTerminalObject( FinSets,
  function ( M, T )
    local t;
    
    t := AsList( T );
    
    t := t[1];
    
    return MapOfFinSetsNC( M, List( M, x -> [ x, t ] ), T );
    
end );

##
AddDirectProduct( FinSets,
  function ( L )
    
    return FinSetNC( Cartesian( List( L, AsList ) ) );
    
end );

##
AddProjectionInFactorOfDirectProductWithGivenDirectProduct( FinSets,
  function ( L, i, S )
    local T, Graph;
    
    T := L[i];
    
    Graph := List( S, x -> [ x, x[i] ] );
    
    return MapOfFinSetsNC( S, Graph, T );
    
end );

##
AddUniversalMorphismIntoDirectProductWithGivenDirectProduct( FinSets,
  function ( D, tau, T )
    local S, Graph;
    
    S := Source( tau[1] );
    
    Graph := List( AsList( S ), x -> [ x, List( tau, f -> f(x) ) ] );
    
    return MapOfFinSetsNC( S, Graph, T );
    
end );

##
AddInitialObject( FinSets,
  function ( arg )
    
    return FinSetNC( [  ] );
    
end );

##
AddUniversalMorphismFromInitialObjectWithGivenInitialObject( FinSets,
  function ( M, I )
    
    return MapOfFinSetsNC( I, [ ], M );
    
end );

##
AddCoproduct( FinSets,
  function ( L )
    
    L := List( [ 1 .. Length( L ) ], i -> Cartesian( [i], AsList( L[i] ) ) );
    
    return FinSetNC( Concatenation( L ) );
    
end );

##
AddInjectionOfCofactorOfCoproductWithGivenCoproduct( FinSets,
  function ( L, i, T )
    local S;
    
    S := L[i];
    
    return MapOfFinSetsNC( S, List( S, x -> [ x, [ i, x ] ] ), T );
    
end );

##
AddUniversalMorphismFromCoproductWithGivenCoproduct( FinSets,
  function ( D, tau, S )
    local T;
    
    T := Range( tau[1] );
    
    return MapOfFinSetsNC( S, List( S, i_x -> [ i_x, tau[i_x[1]]( i_x[2] ) ] ), T );
    
end );

##
AddImageObject( FinSets,
  function ( phi )
    local S, T, I, s;
    
    S := Source( phi );
    T := Range( phi );

    I := FinSetNC( [ ] );
    for s in S do
        if not phi( s ) in I then
            I := ShallowCopy( AsList( I ) );
            Add( I, phi( s ) );
            I := FinSetNC( I );
        fi;
    od;
    
    return I;
    
end );

##
AddIsEpimorphism( FinSets,
  function ( phi )
    
    return IsEqualForObjects( ImageObject( phi ), Range( phi ) );
    
end );

##
AddIsMonomorphism( FinSets,
  function ( phi )
    
    return Length( ImageObject( phi ) ) = Length( Source( phi ) );
    
end );

##
AddImageEmbedding( FinSets,
  function ( phi )
    local I;
    
    I := ImageObject( phi );
    
    return MapOfFinSetsNC( I, List( I, e -> [ e, e ] ), Range( phi ) );
    
end );

##
AddCoastrictionToImage( FinSets,
  function ( phi )
    local pi;
    
    pi := MapOfFinSetsNC( Source( phi ), AsList( phi ), ImageObject( phi ) );
    
    Assert( 3, IsEpimorphism( pi ) );
    
    SetIsEpimorphism( pi, true );
    
    return pi;
    
end );

##
AddEqualizer( FinSets,
  function ( D )
    local f1, S;
    
    f1 := D[1];
    
    S := Source( f1 );
    
    D := D{[ 2 .. Length( D ) ]};
    
    return Filtered( S, x -> ForAll( D, fj -> IsEqualForElementsOfFinSets( f1( x ), fj( x ) ) ) );
    
end );

##
AddEmbeddingOfEqualizerWithGivenEqualizer( FinSets,
  function ( D, E )
    
    return EmbeddingOfFinSets( E, Source( D[1] ) );
    
end );

##
AddUniversalMorphismIntoEqualizerWithGivenEqualizer( FinSets,
  function ( D, tau, E )
    
    return MapOfFinSetsNC( Source( tau ), AsList( tau ), E );
    
end );

##
AddCoequalizer( FinSets,
  function ( D )
    local T, C, images, previousImages, preimages;
    
    T := Range( D[1] );
    T := AsList( T );
    
    C := [ ];
    
    while not IsEmpty( T ) do
        images := FinSetNC( [ T[1] ] );
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

    return FinSetNC( C );
    
end );

##
AddProjectionOntoCoequalizerWithGivenCoequalizer( FinSets,
  function ( D, C )
    
    return ProjectionOfFinSets( Range( D[1] ), C );
    
end );

##
AddUniversalMorphismFromCoequalizerWithGivenCoequalizer( FinSets,
  function ( D, tau, C )
    local G;
    
    G := List( C, x -> [ x, tau( x[1] ) ] );
    
    return MapOfFinSetsNC( C, G, Range( tau ) );
    
end );

## The cartesian monoidal structure

##
AddCartesianLeftUnitorWithGivenDirectProduct( FinSets,
  function ( M, TM )
    
    return MapOfFinSetsNC( TM, List( TM, x -> [ x, x[2] ] ), M );
    
end );

##
AddCartesianLeftUnitorInverseWithGivenDirectProduct( FinSets,
  function ( M, TM )
    
    return MapOfFinSetsNC( M, List( TM, x -> [ x[2], x ] ), TM );
    
end );

##
AddCartesianRightUnitorWithGivenDirectProduct( FinSets,
  function ( M, MT )
    
    return MapOfFinSetsNC( MT, List( MT, x -> [ x, x[1] ] ), M );
    
end );

##
AddCartesianRightUnitorInverseWithGivenDirectProduct( FinSets,
  function ( M, MT )
    
    return MapOfFinSetsNC( M, List( MT, x -> [ x[1], x ] ), MT );
    
end );

##
AddCartesianBraidingWithGivenDirectProducts( FinSets,
  function ( MN, M, N, NM )
    
    return MapOfFinSetsNC( MN, List( MN, x -> [ x, x{[2,1]} ] ), NM );
    
end );

##
AddCartesianBraidingInverseWithGivenDirectProducts( FinSets,
  function ( NM, M, N, MN )
    
    return MapOfFinSetsNC( NM, List( NM, x -> [ x, x{[2,1]} ] ), MN );
    
end );

##
AddExponentialOnObjects( FinSets,
  function ( M, N )
    local m;
    
    m := Length( M );
    
    return FinSetNC( List( Tuples( AsList( N ), m ), L -> MapOfFinSetsNC( M, List( [ 1 .. m ], i -> [ M[i], L[i] ] ), N ) ) );
    
end );

##
AddExponentialOnMorphismsWithGivenExponentials( FinSets,
  function ( S, alpha, beta, T )
    
    return MapOfFinSetsNC( S, List( S, f -> [ f, PreCompose( [ alpha, f, beta ] ) ] ), T );
    
end );

##
AddCartesianEvaluationMorphismWithGivenSource( FinSets,
  function ( M, N, HM_NxM )
    
    return MapOfFinSetsNC( HM_NxM, List( HM_NxM, fx -> [ fx, fx[1](fx[2]) ] ), N );
    
end );

##
AddCartesianCoevaluationMorphismWithGivenRange( FinSets,
  function ( M, N, HN_MxN )
    local MN;
    
    MN := DirectProduct( M, N );
    
    return MapOfFinSetsNC( M, List( M, x -> [ x, MapOfFinSetsNC( N, List( N, y -> [ y, [ x, y ] ] ), MN ) ] ), HN_MxN );
    
end );

##
AddDirectProductToExponentialAdjunctionMap( FinSets,
  function ( M, N, f )
    local L;
    
    L := Range( f );
    
    return MapOfFinSetsNC( M, List( M, x -> [ x, MapOfFinSetsNC( N, List( N, y -> [ y, f( [ x, y ] ) ] ), L ) ] ), ExponentialOnObjects( N, L ) );
    
end );

##
AddExponentialToDirectProductAdjunctionMap( FinSets,
  function ( N, L, g )
    local M, MN;
    
    M := Source( g );
    
    MN := DirectProduct( M, N );
    
    return MapOfFinSetsNC( MN, List( MN, xy -> [ xy, g( xy[1] )( xy[2] ) ] ), L );
    
end );

##
AddCartesianPreComposeMorphismWithGivenObjects( FinSets,
  function ( HM_NxH_N_L, M, N, L, HM_L )
    
    return MapOfFinSetsNC( HM_NxH_N_L, List( HM_NxH_N_L, fg -> [ fg, PreCompose( fg[1], fg[2] ) ] ), HM_L );
    
end );

##
AddCartesianPostComposeMorphismWithGivenObjects( FinSets,
  function ( HM_NxH_N_L, M, N, L, HM_L )
    
    return MapOfFinSetsNC( HM_NxH_N_L, List( HM_NxH_N_L, fg -> [ fg, PostCompose( fg[1], fg[2] ) ] ), HM_L );
    
end );

##
AddDirectProductExponentialCompatibilityMorphismWithGivenObjects( FinSets,
  function ( S1, T1, S2, T2, L )
    local S1S2, T1T2;
    
    S1S2 := DirectProduct( S1, S2 );
    T1T2 := DirectProduct( T1, T2 );
    
    return MapOfFinSetsNC( L[1], List( L[1], fg -> [ fg, DirectProductOnMorphismsWithGivenDirectProducts( S1S2, fg[1], fg[2], T1T2 ) ] ), L[2] );
    
end );

##
AddSubobjectClassifier( FinSets,
  function ( arg )
      
      return FinSetNC( [ "true" , "false" ] );
      
end );

##
AddTruthMorphismIntoSubobjectClassifierWithGivenObjects( FinSets,
  function ( terminal, subobject )
      
      return MapOfFinSets( terminal, [ [ "*", "true" ] ], subobject );
      
end );

##
AddClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier( FinSets,
  function ( monomorphism, omega )
      local range, image, r, x;

      r := [ ];
      range := Range( monomorphism );

      for x in range do
          if x in ImageObject( monomorphism ) then
              Add( r, [ x, "true" ] );
          else
              Add( r, [ x, "false" ] );
          fi;
      od;
            
      return MapOfFinSets( range, r, omega );
end );

##
Finalize( FinSets );

##
InstallMethod( Display,
        "for a CAP finite set",
        [ IsFiniteSet ],
        
  function ( S )
    Print( AsList( S ), "\n" );
end );

##
InstallMethod( Display,
        "for a CAP map of finite sets",
        [ IsFiniteSetMap ],
        
  function ( phi )
    Print( [ AsList( Source( phi ) ), AsList( phi ), AsList( Range( phi ) ) ], "\n" );
end );
