# SPDX-License-Identifier: GPL-2.0-or-later
# FinSetsForCAP: The elementary topos of (skeletal) finite sets
#
# Implementations
#

##
InstallMethod( CategoryOfSkeletalFinSets,
               [ ],
               
  function ( )
    local cat;
    
    cat := CreateCapCategory( "SkeletalFinSets" );
    
    cat!.category_as_first_argument := true;
    
    cat!.compiler_hints := rec(
        category_filter := IsCategoryOfSkeletalFinSets,
        object_filter := IsSkeletalFiniteSet,
        morphism_filter := IsSkeletalFiniteSetMap,
    );
    
    # this is a workhorse category -> no logic and caching only via IsIdenticalObj
    CapCategorySwitchLogicOff( cat );
    
    SetFilterObj( cat, IsCategoryOfSkeletalFinSets );
    
    SetIsSkeletalCategory( cat, true );
    
    SetIsElementaryTopos( cat, true );
    
    AddObjectRepresentation( cat, IsSkeletalFiniteSet and HasLength );
    
    AddMorphismRepresentation( cat, IsSkeletalFiniteSetMap and HasAsList );
    
    INSTALL_FUNCTIONS_FOR_SKELETAL_FIN_SETS( cat );
    
    AddTheoremFileToCategory( FinSets,
            Filename( DirectoriesPackageLibrary( "Toposes", "LogicForToposes" ), "PropositionsForToposes.tex" ) );
    
    if ValueOption( "no_precompiled_code" ) <> true then
        
        ADD_FUNCTIONS_FOR_CategoryOfSkeletalFinSetsPrecompiled( cat );
        
    fi;
    
    Finalize( cat );
    
    return cat;
    
end );

##
InstallMethodForCompilerForCAP( FinSetOp,
        [ IsCategoryOfSkeletalFinSets, IsInt ],
        
  function ( cat, n )
    local int;
    
    int := ObjectifyObjectForCAPWithAttributes( rec( ), cat, Length, n );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 4, IsWellDefined( int ) );
    
    return int;
    
end );

##
InstallMethod( AsList,
        "for a CAP skeletal finite set",
        [ IsSkeletalFiniteSet ],
        
  function ( s )
    
    return [ 0 .. Length( s ) - 1 ];
    
end );

##
InstallMethod( ListOp,
        "for a CAP skeletal finite set and a function",
        [ IsSkeletalFiniteSet, IsFunction ],
        
  function ( s, f )
    
    return List( AsList( s ), x -> f(x) );
    
end );

## Morphisms

##
InstallMethod( MapOfFinSets,
        "for two CAP skeletal finite sets and a list",
        [ IsSkeletalFiniteSet, IsList, IsSkeletalFiniteSet ],
        
  function ( s, G, t )
    
    return MapOfFinSets( CapCategory( s ), s, G, t );
    
end );

##
InstallOtherMethodForCompilerForCAP( MapOfFinSets,
        "for a category of skeletal finite sets, two CAP skeletal finite sets and a list",
        [ IsCategoryOfSkeletalFinSets, IsSkeletalFiniteSet, IsList, IsSkeletalFiniteSet ],
                                     
  function ( cat, s, G, t )
    local map;
    
    map := ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec( ), cat,
            s,
            t,
            AsList, G
        );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 4, IsWellDefined( map ) );
    
    return map;
    
end );

##
InstallMethod( EmbeddingOfFinSets,
        "for two CAP skeletal finite sets",
        [ IsSkeletalFiniteSet, IsSkeletalFiniteSet ],
        
  function ( s, t )
    local iota;
    
    iota := MapOfFinSets( s, AsList( s ), t );
    
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
    
    return Filtered( S, i -> phi[1 + i] in t );
    
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
    
    return AsList( phi )[1 + x];
    
end );

##
InstallGlobalFunction( SKELETAL_FIN_SETS_ExplicitCoequalizer,
  function ( D )
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

end );

##
InstallGlobalFunction( SKELETAL_FIN_SETS_IsEpimorphism,
  function ( imgs, t )
    local testList, img;
    
    testList := ListWithIdenticalEntries( t, false );
    
    for img in imgs do
        testList[1 + img] := true;
    od;
    
    return testList;
    
end );

##
InstallGlobalFunction( SKELETAL_FIN_SETS_IsMonomorphism,
  function ( imgs, t )
    local testList, img;
    
    testList := ListWithIdenticalEntries( t, false );
    
    for img in imgs do
        if testList[1 + img] then
            return false;
        fi;
        testList[1 + img] := true;
    od;
    
    return true;
    
end );

##
InstallGlobalFunction( INSTALL_FUNCTIONS_FOR_SKELETAL_FIN_SETS,
  function ( SkeletalFinSets )
    
##
AddObjectConstructor( SkeletalFinSets,
  function ( SkeletalFinSets, n )
    
    return FinSet( SkeletalFinSets, n );
    
end );

##
AddObjectDatum( SkeletalFinSets,
  function ( SkeletalFinSets, n )
    
    return Length( n );
    
end );

##
AddMorphismConstructor( SkeletalFinSets,
  function ( SkeletalFinSets, source, map, range )
    
    return MapOfFinSets( SkeletalFinSets, source, map, range );
    
end );

##
AddMorphismDatum( SkeletalFinSets,
  function ( SkeletalFinSets, map )
    
    return AsList( map );
    
end );

##
AddIsWellDefinedForObjects( SkeletalFinSets,
   { cat, n } -> Length( n ) >= 0 );

##
AddIsEqualForObjects( SkeletalFinSets,
  function ( cat, n1, n2 )
    
    return Length( n1 ) = Length( n2 );
    
end );

##
AddIsWellDefinedForMorphisms( SkeletalFinSets,
  function ( cat, mor )
    local s, rel, t;
    
    s := Length( Source( mor ) );
    
    rel := AsList( mor );
    
    t := Length( Range( mor ) );
    
    ## For CompilerForCAP we need if-elif-else with the same structure
    if not ForAll( rel, a -> IsInt( a ) and a >= 0 ) then
        return false;
    elif not s = Length( rel ) then
        return false;
    elif not ForAll( rel, a -> a < t ) then
        return false;
    else
        return true;
    fi;
    
end );

##
AddIsEqualForMorphisms( SkeletalFinSets,
  function ( cat, mor1, mor2 )
    
    return AsList( mor1 ) = AsList( mor2 );
    
end );

##
AddIsHomSetInhabited( SkeletalFinSets,
  function ( cat, A, B )
    
    return IsInitial( cat, A ) or not IsInitial( cat, B );
    
end );

##
AddIdentityMorphism( SkeletalFinSets,
  function ( cat, n )
    
    return MapOfFinSets( cat, n, [ 0 .. Length( n ) - 1 ], n );
    
end );

##
AddPreCompose( SkeletalFinSets,
  function ( cat, map_pre, map_post )
    local s, t, im_pre, im_post, cmp;
    
    s := Source( map_pre );
    t := Range( map_post );
    
    im_pre := AsList( map_pre );
    im_post := AsList( map_post );
    
    cmp := List( [ 1 .. Length( s ) ], i -> im_post[1 + im_pre[i]] );
    
    return MapOfFinSets( cat, s, cmp, t );
    
end );

##
AddImageObject( SkeletalFinSets,
  function ( cat, phi )
    
    return FinSet( SkeletalFinSets, Length( Set( AsList( phi ) ) ) );
    
end );

## the function SKELETAL_FIN_SETS_IsEpimorphism
## has linear runtime complexity
AddIsEpimorphism( SkeletalFinSets,
  function ( cat, phi )
    local imgs, t;
    
    imgs := AsList( phi );
    
    t := Length( Range( phi ) );
    
    ## we do not have a linear purely functional test (yet),
    ## the following linear runtime function works with side effects,
    ## so we hide it from the compiler
    
    return not false in SKELETAL_FIN_SETS_IsEpimorphism( imgs, t );
    
end );

##
AddIsSplitEpimorphism( SkeletalFinSets,
  { cat, phi } -> IsEpimorphism( cat, phi ) );

##
AddIsMonomorphism( SkeletalFinSets,
  function ( cat, phi )
    local imgs, t;
    
    imgs := AsList( phi );
    
    t := Length( Range( phi ) );
    
    ## we do not have a linear purely functional test (yet),
    ## the following linear runtime function works with side effects,
    ## so we hide it from the compiler
    
    return SKELETAL_FIN_SETS_IsMonomorphism( imgs, t );
    
end );

##
AddIsSplitMonomorphism( SkeletalFinSets,
  function ( cat, phi )
    return IsInitial( cat, Range( phi ) ) or ( not IsInitial( cat, Source( phi ) ) and IsMonomorphism( cat, phi ) );
end );

##
AddIsLiftable( SkeletalFinSets,
  function ( cat, f, g )
    local ff, gg, fff;
    
    ff := AsList( f );
    gg := AsList( g );
    
    if 100 * Length( ff ) < Length( gg ) then
        fff := Set( ff );
    else ## this is for CompilerForCAP
        fff := ff;
    fi;
    
    return ForAll( fff, y -> y in gg );
    
end );

##
AddLift( SkeletalFinSets,
  function ( cat, f, g )
    local S, T, gg, ff;
    
    S := Source( f );
    T := Source( g );
    
    gg := AsList( g );
    ff := AsList( f );
    
    return MapOfFinSets( cat, S, List( [ 1 .. Length( S ) ], x -> -1 + SafePosition( gg, ff[x] ) ), T );
    
end );

## g \circ f^{-1} is again an ordinary function,
## i.e., fibers of f are mapped under g to the same element
AddIsColiftable( SkeletalFinSets,
  function ( cat, f, g )
    local ff, gg;
    
    ff := AsList( f );
    gg := AsList( g );
    
    return ForAll( Set( ff ), i -> Length( Set( gg{Positions( ff, i )} ) ) = 1 );
    
end );

##
AddColift( SkeletalFinSets,
  function ( cat, f, g )
    local S, T, ff, gg, chi;
    
    S := Range( f );
    T := Range( g );
    
    ff := AsList( f );
    gg := AsList( g );
    
    chi :=
      function ( y )
        if not y in ff then
            return 0;
        fi;
        return gg[SafePosition( ff, y )];
    end;
    
    return MapOfFinSets( cat, S, List( [ 0 .. Length( S ) - 1 ], y -> chi(y) ), T );
    
end );

##
AddImageEmbeddingWithGivenImageObject( SkeletalFinSets,
  function ( cat, phi, image )
    
    return MapOfFinSets( cat, image, Set( AsList( phi ) ), Range( phi ) );

end );

##
AddCoastrictionToImageWithGivenImageObject( SkeletalFinSets,
  function ( cat, phi, image_object )
    local G, images, L, l, pi;
    
    G := AsList( phi );
    
    images := Set( G );
    
    L := List( G, l -> -1 + SafePosition( images, l ) );
    
    pi := MapOfFinSets( cat, Source( phi ), L, image_object );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 3, IsEpimorphism( cat, pi ) );
    
    return pi;
    
end );


## Limits

##
AddIsTerminal( SkeletalFinSets,
  function ( cat, M )
    
    return Length( M ) = 1;
    
end );

##
AddTerminalObject( SkeletalFinSets,
  function ( cat )
    
    return FinSet( SkeletalFinSets, 1 );
    
end );

##
AddUniversalMorphismIntoTerminalObjectWithGivenTerminalObject( SkeletalFinSets,
  function ( cat, m, t )
    
    return MapOfFinSets( cat, m, ListWithIdenticalEntries( Length( m ), 0 ), t );
    
end );

##
AddDirectProduct( SkeletalFinSets,
  function ( cat, L )
    
    return FinSet( SkeletalFinSets, Product( List( L, Length ) ) );
    
end );

##
AddProjectionInFactorOfDirectProductWithGivenDirectProduct( SkeletalFinSets,
  function ( cat, D, k, P )
    local T, l, a;
    
    T := D[k];
    
    l := Length( T );
    
    a := Product( List( D{[ 1 .. k - 1 ]}, Length ) );
    
    return MapOfFinSets( cat, P, List( [ 0 .. Length( P ) - 1 ], i -> RemInt( QuoInt( i, a ), l ) ), T );
    
end );

##
AddUniversalMorphismIntoDirectProductWithGivenDirectProduct( SkeletalFinSets,
  function ( cat, D, T, tau, P )
    local l, d, dd, taus;
    
    l := Length( D );
    
    d := List( D, Length );
    
    dd := List( [ 0 .. l - 1 ], j -> Product( d{[ 1 .. j ]} ) );
    
    taus := List( tau, AsList );
    
    return MapOfFinSets( cat, T, List( [ 1 .. Length( T ) ], i -> Sum( [ 1 .. l ], j -> taus[j][i] * dd[j] ) ), P );
    
end );

##
AddEqualizer( SkeletalFinSets,
  function ( cat, D )
    local f1, D2, Eq;
    
    f1 := AsList( D[1] );
    
    D2 := List( D{[ 2 .. Length( D ) ]}, AsList );
    
    Eq := Filtered( [ 0 .. Length( f1 ) - 1 ], x -> ForAll( D2, fj -> f1[1 + x] = fj[1 + x] ) );
    
    return FinSet( SkeletalFinSets, Length( Eq ) );
    
end );

##
AddEmbeddingOfEqualizerWithGivenEqualizer( SkeletalFinSets,
  function ( cat, D, E )
    local s, f1, D2, Eq;
    
    s := Source( D[1] );
    
    f1 := AsList( D[1] );
    
    D2 := List( D{[ 2 .. Length( D ) ]}, AsList );
    
    Eq := Filtered( [ 0 .. Length( f1 ) - 1 ], x -> ForAll( D2, fj -> f1[1 + x] = fj[1 + x] ) );
    
    return MapOfFinSets( cat, E, Eq, s );
    
end );

##
AddUniversalMorphismIntoEqualizerWithGivenEqualizer( SkeletalFinSets,
  function ( cat, D, test_object, tau, E )
    local s, f1, D2, Eq, t;
    
    s := Source( D[1] );
    
    f1 := AsList( D[1] );
    
    D2 := List( D{[ 2 .. Length( D ) ]}, AsList );
    
    Eq := Filtered( [ 0 .. Length( f1 ) - 1 ], x -> ForAll( D2, fj -> f1[1 + x] = fj[1 + x] ) );
    
    t := AsList( tau );
    
    return MapOfFinSets( cat, test_object, List( [ 1 .. Length( test_object ) ], x -> -1 + SafePosition( Eq, t[x] ) ), E );
    
end );


## Colimits

##
AddIsInitial( SkeletalFinSets,
  function ( cat, M )
    
    return Length( M ) = 0;
    
end );

##
AddInitialObject( SkeletalFinSets,
  function ( cat )
    
    return FinSet( SkeletalFinSets, 0 );
    
end );

##
AddUniversalMorphismFromInitialObjectWithGivenInitialObject( SkeletalFinSets,
  function ( cat, m, I )
    
    return MapOfFinSets( cat, I, [ ], m );
    
end );

##
AddIsProjective( SkeletalFinSets,
  function ( cat, M )
    
    return true;
    
end );

##
AddEpimorphismFromSomeProjectiveObject( SkeletalFinSets,
  { cat, m } -> IdentityMorphism( cat, m ) );

##
AddIsInjective( SkeletalFinSets,
  function ( cat, M )
    
    return not IsInitial( cat, M );
    
end );

##
AddSomeInjectiveObject( SkeletalFinSets,
  function ( cat, M )
    
    if IsInitial( cat, M ) then
        
        return TerminalObject( cat );
        
    else
        
        return M;
        
    fi;
    
end );

##
AddMonomorphismIntoSomeInjectiveObjectWithGivenSomeInjectiveObject( SkeletalFinSets,
  function ( cat, M, injective_object )
    
    return MapOfFinSets( cat, M, [ 0 .. Length( M ) - 1 ], injective_object );
    
end );

##
AddCoproduct( SkeletalFinSets,
  function ( cat, L )
    
    return FinSet( SkeletalFinSets, Sum( L, Length ) );
    
end );

##
AddInjectionOfCofactorOfCoproductWithGivenCoproduct( SkeletalFinSets,
  function ( cat, L, i, coproduct )
    local s, O, sum, cmp;
    
    O := L{[ 1 .. i - 1 ]};
    
    sum := Sum( O, Length );
    
    s := L[i];
    
    cmp := [ sum .. sum + Length( s ) - 1 ];
    
    return MapOfFinSets( cat, s, cmp, coproduct );
    
end );

##
AddUniversalMorphismFromCoproductWithGivenCoproduct( SkeletalFinSets,
  function ( cat, L, test_object, tau, S )
    local cmp;
    
    cmp := Concatenation( List( tau, AsList ) );
    
    return MapOfFinSets( cat, S, cmp, test_object );
    
end );

##
AddCoequalizer( SkeletalFinSets,
  function ( cat, D )
  
    return FinSet( SkeletalFinSets, Length( SKELETAL_FIN_SETS_ExplicitCoequalizer( D ) ) );
    
end );

##
AddProjectionOntoCoequalizerWithGivenCoequalizer( SkeletalFinSets,
  function ( cat, D, C )
    local Cq, s, cmp;
    
    Cq := SKELETAL_FIN_SETS_ExplicitCoequalizer( D );
    
    s := Range( D[1] );
    
    cmp := List( [ 0 .. Length( s ) - 1 ], x -> -1 + SafePosition( Cq, First( Cq, c -> x in c ) ) );
    
    return MapOfFinSets( cat, s, cmp, C );
    
end );

##
AddUniversalMorphismFromCoequalizerWithGivenCoequalizer( SkeletalFinSets,
  function ( cat, D, test_object, tau, C )
    local Cq;
    
    Cq := SKELETAL_FIN_SETS_ExplicitCoequalizer( D );

    return MapOfFinSets( cat, C, List( Cq, x -> tau( x[1] ) ), Range( tau ) );
    
end );

## The cartesian monoidal structure

##
AddCartesianLeftUnitorWithGivenDirectProduct( SkeletalFinSets,
  function ( cat, M, TM )
    
    return IdentityMorphism( cat, M );
    
end );

##
AddCartesianLeftUnitorInverseWithGivenDirectProduct( SkeletalFinSets,
  function ( cat, M, TM )
    
    return IdentityMorphism( cat, M );
    
end );

##
AddCartesianRightUnitorWithGivenDirectProduct( SkeletalFinSets,
  function ( cat, M, MT )
    
    return IdentityMorphism( cat, M );
    
end );

##
AddCartesianRightUnitorInverseWithGivenDirectProduct( SkeletalFinSets,
  function ( cat, M, MT )
    
    return IdentityMorphism( cat, M );
    
end );

##
AddCartesianBraidingInverseWithGivenDirectProducts( SkeletalFinSets,
  function ( cat, MN, M, N, NM )
    local m, n;
    
    m := Length( M );
    
    n := Length( N );
    
    return MapOfFinSets( cat, MN, List( [ 0 .. Length( MN ) - 1 ] , i -> RemInt( i, n ) * m + QuoInt( i, n ) ), NM );
    
end );

##
AddExponentialOnObjects( SkeletalFinSets,
  function ( cat, M, N )
    local m, n;
    
    m := Length( M );
    n := Length( N );
    
    return FinSet( SkeletalFinSets, n ^ m );
    
end );

##
AddExponentialOnMorphismsWithGivenExponentials( SkeletalFinSets,
  function ( cat, S, alpha, beta, T )
    local M, m, N, n, A, a, B, b;
    
    M := Range( alpha );
    m := Length( M );
    N := Source( beta );
    n := Length( N );
    
    A := Source( alpha );
    a := Length( A );
    B := Range( beta );
    b := Length( B );
    
    return
      MapOfFinSets(
              cat,
              S,
              List( [ 0 .. n ^ m - 1 ],
                function ( i )
                  local composition, images;
                  
                  composition :=
                    PreComposeList(
                            cat,
                            [ alpha,
                              MapOfFinSets(
                                      cat,
                                      M,
                                      List( [ 0 .. m - 1 ], j -> RemInt( QuoInt( i, n^j ), n ) ),
                                      N ),
                              beta ] );
                  
                  images := AsList( composition );
                  
                  return Sum( [ 0 .. a - 1 ], k -> images[1 + k] * b^k );
                  
              end ),
              T );
    
end );

##
AddCartesianEvaluationMorphismWithGivenSource( SkeletalFinSets,
  function ( cat, M, N, HM_NxM )
    local m, n, exp;
    
    m := Length( M );
    n := Length( N );
    
    exp := n ^ m;
    
    return MapOfFinSets( cat, HM_NxM, List( [ 0 .. ( n^m * m ) - 1 ], i -> RemInt( QuoInt( i, n^QuoInt( i, exp ) ), n ) ), N );
    
end );

##
AddCartesianCoevaluationMorphismWithGivenRange( SkeletalFinSets,
  function ( cat, M, N, HN_MxN )
    local m, n, mn;
    
    m := Length( M );
    n := Length( N );
    
    mn := m * n;
    
    #return MapOfFinSets( cat, M, List( [ 0 .. m - 1 ], i -> Sum( [ 0 .. n - 1 ], j -> ( i + m * j ) * (m*n)^j ) ), HN_MxN );
    
    return MapOfFinSets( cat, M, List( [ 0 .. m - 1 ], i -> i * GeometricSum( mn, n ) + m * mn * GeometricSumDiff1( mn, n ) ), HN_MxN );
    
end );

##
AddSubobjectClassifier( SkeletalFinSets,
  function ( cat )
      
      return FinSet( cat, 2 );
      
end );

##
AddClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier( SkeletalFinSets,
  function ( cat, monomorphism, Omega )
    local range, images;
    
    range := Range( monomorphism );
    
    images := List( [ 0 .. Length( range ) - 1 ],
                    function ( x )
                      
                      if x in AsList( monomorphism ) then
                          return 1;
                      fi;
                      
                      return 0;
                      
                  end );
      
      return MapOfFinSets( cat, range, images, Omega );
      
end );

##
AddMorphismsOfExternalHom( SkeletalFinSets,
  function ( cat, A, B )
    local hom_A_B, T;
    
    hom_A_B := ExponentialOnObjects( cat, A, B );
    
    T := TerminalObject( cat );
    
    return List( [ 0 .. Length( hom_A_B ) - 1 ],
                 i -> CartesianLambdaElimination( cat,
                         A,
                         B,
                         MapOfFinSets( cat, T, [ i ], hom_A_B ) ) );
    
end );

end );

##
InstallMethod( ViewObj,
        "for a CAP skeletal finite set",
        [ IsSkeletalFiniteSet ],
        
  function ( s )
    Print( "|", Length( s ), "|" );
end );

##
InstallMethod( ViewObj,
    "for a CAP map of skeletal finite sets",
        [ IsSkeletalFiniteSetMap ],
        
  function ( phi )
    Print( "|", Length( Source( phi ) ), "| → |", Length( Range( phi ) ), "|" );
end );

##
InstallMethod( ViewObj,
    "for a CAP map of skeletal finite sets",
        [ IsSkeletalFiniteSetMap and IsMonomorphism ],
        
  function ( phi )
    Print( "|", Length( Source( phi ) ), "| ↪ |", Length( Range( phi ) ), "|" );
end );

##
InstallMethod( ViewObj,
    "for a CAP map of skeletal finite sets",
        [ IsSkeletalFiniteSetMap and IsEpimorphism ],
        
  function ( phi )
    Print( "|", Length( Source( phi ) ), "| ↠ |", Length( Range( phi ) ), "|" );
end );

##
InstallMethod( ViewObj,
        "for a CAP map of skeletal finite sets",
        [ IsSkeletalFiniteSetMap and IsIsomorphism ],
        
  function ( phi )
    Print( "|", Length( Source( phi ) ), "| ⭇ |", Length( Range( phi ) ), "|" );
end );

##
InstallMethod( PrintString,
        "for a CAP skeletal finite set",
        [ IsSkeletalFiniteSet ],
        
  function ( s )
    local l, string;
    
    l := Length( s );
    
    if l = 0 then
        return "∅";
    elif l = 1 then
        return "{ 0 }";
    elif l = 2 then
        return "{ 0, 1 }";
    elif l = 3 then
        return "{ 0, 1, 2 }";
    fi;
    
    return Concatenation( "{ 0,..., ", String( l - 1 ), " }" );
    
end );

##
InstallMethod( Display,
        "for a CAP skeletal finite set",
        [ IsSkeletalFiniteSet ],
        
  function ( s )
    Print( PrintString( s ), "\n" );
end );

##
InstallMethod( Display,
    "for a CAP map of skeletal finite sets",
        [ IsSkeletalFiniteSetMap ],
        
  function ( phi )
    Print( PrintString( Source( phi ) ) );
    Print( " ⱶ", AsList( phi ), "→ " );
    Print( PrintString( Range( phi ) ), "\n" );
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
