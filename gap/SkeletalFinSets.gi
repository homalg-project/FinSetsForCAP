# SPDX-License-Identifier: GPL-2.0-or-later
# FinSetsForCAP: The elementary topos of (skeletal) finite sets
#
# Implementations
#

##
InstallMethod( CategoryOfSkeletalFinSetsWithMorphismsGivenByFunctions,
        "for no input",
        [ ],
        
  function ( )
    local cat;
    
    cat := CreateCapCategoryWithDataTypes( "SkeletalFinSets",
                   IsCategoryOfSkeletalFinSetsWithMorphismsGivenByFunctions,
                   IsObjectInCategoryOfSkeletalFinSetsWithMorphismsGivenByFunctions,
                   IsMorphismInCategoryOfSkeletalFinSetsWithMorphismsGivenByFunctions,
                   IsCapCategoryTwoCell,
                   IsBigInt,
                   SkeletalFinSets_func_type,
                   fail );
    
    cat!.category_as_first_argument := true;
    
    cat!.supports_empty_limits := true;
    
    # this is a workhorse category -> no logic and caching only via IsIdenticalObj
    CapCategorySwitchLogicOff( cat );
    
    SetIsSkeletalCategory( cat, true );
    
    SetIsElementaryTopos( cat, true );
    
    SetRangeCategoryOfHomomorphismStructure( cat, cat );
    SetIsEquippedWithHomomorphismStructure( cat, true );
    
    INSTALL_FUNCTIONS_FOR_SKELETAL_FIN_SETS( cat );
    
    #= comment for Julia
    AddTheoremFileToCategory( cat,
            Filename( DirectoriesPackageLibrary( "Toposes", "LogicForToposes" ), "PropositionsForToposes.tex" ) );
    # =#
    
    if ValueOption( "no_precompiled_code" ) <> true then
        
        ADD_FUNCTIONS_FOR_CategoryOfSkeletalFinSetsWithMorphismsGivenByFunctionsPrecompiled( cat );
        
    fi;
    
    Finalize( cat );
    
    return cat;
    
end );

##
InstallMethod( FinSetOp,
        [ IsCategoryOfSkeletalFinSets, IsBigInt ],
        
  function ( cat, n )
    
    return ObjectConstructor( cat, n );
    
end );

##
InstallMethod( AsList,
        "for a CAP skeletal finite set",
        [ IsObjectInCategoryOfSkeletalFinSets ],
        
  function ( s )
    
    return [ 0 .. Length( s ) - 1 ];
    
end );

##
InstallMethod( ListOp,
        "for a CAP skeletal finite set and a function",
        [ IsObjectInCategoryOfSkeletalFinSets, IsFunction ],
        
  function ( s, f )
    
    return List( AsList( s ), x -> f(x) );
    
end );

## Morphisms

##
InstallOtherMethodForCompilerForCAP( ListOfImages,
        "for a category of skeletal finite sets and a CAP map of skeletal finite sets",
        [ IsCategoryOfSkeletalFinSetsWithMorphismsGivenByFunctions, IsMorphismInCategoryOfSkeletalFinSetsWithMorphismsGivenByFunctions ],
        
  function ( cat, map )
    
    return List( [ 0 .. Length( Source( map ) ) - 1 ], AsFunc( map ) );
    
end );

##
InstallMethod( AsList,
        "for a CAP map of skeletal finite sets",
        [ IsMorphismInCategoryOfSkeletalFinSetsWithMorphismsGivenByFunctions ],
        
  function ( map )
    local L;
    
    L := ListOfImages( CapCategory( map ), map );
    
    if Length( L ) > 1 and First( L ) + 1 = L[2] and First( L ) < Last( L ) then
        ConvertToRangeRep( L );
    fi;
    
    return L;
    
end );

##
InstallMethod( MapOfFinSets,
        "for two CAP skeletal finite sets and a function",
        [ IsObjectInCategoryOfSkeletalFinSetsWithMorphismsGivenByFunctions, IsFunction, IsObjectInCategoryOfSkeletalFinSetsWithMorphismsGivenByFunctions ],
        
  function ( s, f, t )
    
    return MorphismConstructor( CapCategory( s ), s, f, t );
    
end );

##
InstallOtherMethod( MapOfFinSets,
        "for two CAP skeletal finite sets and a list",
        [ IsObjectInCategoryOfSkeletalFinSetsWithMorphismsGivenByFunctions, IsList, IsObjectInCategoryOfSkeletalFinSetsWithMorphismsGivenByFunctions ],
        
  function ( s, G, t )
    local f;
    
    f := CapJitTypedExpression(
                 i -> G[1 + i],
                 cat -> SkeletalFinSets_func_type );
    
    return MapOfFinSets( s, f, t );
    
end );

##
InstallMethod( EmbeddingOfFinSets,
        "for two CAP skeletal finite sets",
        [ IsObjectInCategoryOfSkeletalFinSets, IsObjectInCategoryOfSkeletalFinSets ],
        
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
        [ IsMorphismInCategoryOfSkeletalFinSets, IsList ],
        
  function ( phi, t )
    local S, f;
    
    S := AsList( Source( phi ) );
    
    f := AsFunc( phi );
    
    return Filtered( S, i -> f( i ) in t );
    
end );

##
InstallMethod( ImageObject,
     "for a CAP map of skeletal finite sets and a CAP skeletal finite set",
     [ IsMorphismInCategoryOfSkeletalFinSets, IsObjectInCategoryOfSkeletalFinSets ],
      function ( phi, s_ )

    return ImageObject( PreCompose( EmbeddingOfFinSets( s_, Source( phi ) ), phi ) );

end );

##
InstallMethod( CallFuncList,
        "for a CAP map of skeletal finite sets and a list",
    [ IsMorphismInCategoryOfSkeletalFinSets, IsList ],
        
  function ( phi, L )
    local x;
    
    x := L[1];
    
    return AsFunc( phi )( x );
    
end );

##
InstallGlobalFunction( SKELETAL_FIN_SETS_ExplicitCoequalizer,
  function ( s, D )
    local T, Cq, t, L, i;
    
    T := AsList( s );
    
    Cq := [ ];
    
    while not IsEmpty( T ) do
        t := T[1];
        t := Union( List( D, f_j -> List( Union( List( D, f_i -> Preimage( f_i, [ t ] ) ) ), f_j ) ) );
        if IsEmpty( t ) then
            t := [ T[1] ];
        fi;
        Add( Cq, t );
        T := Difference( T, t );
    od;
    
    T := AsList( s );
    
    if Concatenation( Cq ) <> T then
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
  function ( cat, n )
    local int;
    
    int := CreateCapCategoryObjectWithAttributes( cat, Length, n );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 4, IsWellDefined( int ) );
    
    return int;
    
end );

##
AddObjectDatum( SkeletalFinSets,
  function ( cat, n )
    
    return Length( n );
    
end );

##
AddMorphismConstructor( SkeletalFinSets,
  function ( cat, source, func, range )
    local map;
    
    map := CreateCapCategoryMorphismWithAttributes( cat,
                   source,
                   range,
                   AsFunc, func );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 4, IsWellDefined( map ) );
    
    return map;
    
end );

##
AddMorphismDatum( SkeletalFinSets,
  function ( cat, map )
    
    return AsFunc( map );
    
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
    local s, f, t;
    
    s := Length( Source( mor ) );
    
    f := AsFunc( mor );
    
    t := Length( Range( mor ) );
    
    ## For CompilerForCAP we need if-elif-else with the same structure
    if not ForAll( [ 0 .. s - 1 ],
               function( x )
                 local fx;
                 fx := f( x );
                 return IsBigInt( fx ) and fx >= 0 and fx < t;
             end ) then
             
        return false;
    else
        return true;
    fi;
    
end );

##
AddIsEqualForMorphisms( SkeletalFinSets,
  function ( cat, mor1, mor2 )
    local f1, f2;
    
    f1 := AsFunc( mor1 );
    f2 := AsFunc( mor2 );
    
    return ForAll( [ 0 .. Length( Source( mor1 ) ) - 1 ], x -> f1( x ) = f2( x ) );
    
end );

##
AddIsHomSetInhabited( SkeletalFinSets,
  function ( cat, A, B )
    
    return IsInitial( cat, A ) or not IsInitial( cat, B );
    
end );

##
AddIdentityMorphism( SkeletalFinSets,
  function ( cat, n )
    local f;
    
    f := CapJitTypedExpression(
                 IdFunc,
                 cat -> SkeletalFinSets_func_type );
    
    return MorphismConstructor( cat, n, f, n );
    
end );

##
AddPreCompose( SkeletalFinSets,
  function ( cat, map_pre, map_post )
    local s, t, pre, post, pre_post;
    
    s := Source( map_pre );
    t := Range( map_post );
    
    pre := AsFunc( map_pre );
    post := AsFunc( map_post );
    
    pre_post := CapJitTypedExpression(
                        i -> post( pre( i ) ),
                        cat -> SkeletalFinSets_func_type );
    
    return MorphismConstructor( cat, s, pre_post, t );
    
end );

##
AddImageObject( SkeletalFinSets,
  function ( cat, phi )
    
    return ObjectConstructor( cat, BigInt( Length( Set( ListOfImages( cat, phi ) ) ) ) );
    
end );

## the function SKELETAL_FIN_SETS_IsEpimorphism
## has linear runtime complexity
AddIsEpimorphism( SkeletalFinSets,
  function ( cat, phi )
    local imgs, t;
    
    imgs := ListOfImages( cat, phi );
    
    t := Length( Range( phi ) );
    
    ## we do not have a linear purely functional test (yet),
    ## the following linear runtime function works with side effects,
    ## so we hide it from the compiler
    
    return not (false in SKELETAL_FIN_SETS_IsEpimorphism( imgs, t ));
    
end );

##
AddIsSplitEpimorphism( SkeletalFinSets,
  { cat, phi } -> IsEpimorphism( cat, phi ) );

##
AddIsMonomorphism( SkeletalFinSets,
  function ( cat, phi )
    local imgs, t;
    
    imgs := ListOfImages( cat, phi );
    
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
    
    ff := ListOfImages( cat, f );
    gg := ListOfImages( cat, g );
    
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
    local S, T, gg, ff, chi;
    
    S := Source( f );
    T := Source( g );
    
    gg := ListOfImages( cat, g );
    ff := AsFunc( f );
    
    chi := CapJitTypedExpression(
                   x -> -1 + BigInt( SafePosition( gg, ff( x ) ) ),
                   cat -> SkeletalFinSets_func_type );
    
    return MorphismConstructor( cat, S, chi, T );
    
end );

## g \circ f^{-1} is again an ordinary function,
## i.e., fibers of f are mapped under g to the same element
AddIsColiftable( SkeletalFinSets,
  function ( cat, f, g )
    local ff, gg;
    
    ff := ListOfImages( cat, f );
    gg := ListOfImages( cat, g );
    
    return ForAll( Set( ff ), i -> Length( Set( gg{Positions( ff, i )} ) ) = 1 );
    
end );

##
AddColift( SkeletalFinSets,
  function ( cat, f, g )
    local S, T, ff, gg, c, chi;
    
    S := Range( f );
    T := Range( g );
    
    ff := ListOfImages( cat, f );
    gg := ListOfImages( cat, g );
    
    c :=
      function ( y )
        if not y in ff then
            return BigInt( 0 );
        fi;
        return gg[SafePosition( ff, y )];
    end;
    
    chi := CapJitTypedExpression(
                   c,
                   cat -> SkeletalFinSets_func_type );
    
    return MorphismConstructor( cat, S, chi, T );
    
end );

##
AddImageEmbeddingWithGivenImageObject( SkeletalFinSets,
  function ( cat, phi, image )
    local images, f;
    
    images := Set( ListOfImages( cat, phi ) );
    
    f := CapJitTypedExpression(
                 i -> images[1 + i],
                 cat -> SkeletalFinSets_func_type );
    
    return MorphismConstructor( cat, image, f, Range( phi ) );
    
end );

##
AddCoastrictionToImageWithGivenImageObject( SkeletalFinSets,
  function ( cat, phi, image_object )
    local G, images, s, f, l, pi;
    
    G := ListOfImages( cat, phi );
    
    images := Set( G );
    
    s := Source( phi );
    
    f := CapJitTypedExpression(
                 i -> -1 + BigInt( SafePosition( images, G[1 + i] ) ),
                 cat -> SkeletalFinSets_func_type );
    
    pi := MorphismConstructor( cat, s, f, image_object );
    
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
    
    return ObjectConstructor( cat, BigInt( 1 ) );
    
end );

##
AddUniversalMorphismIntoTerminalObjectWithGivenTerminalObject( SkeletalFinSets,
  function ( cat, m, t )
    local zero, f;
    
    zero := BigInt( 0 );
    
    f := CapJitTypedExpression(
                 i -> zero,
                 cat -> SkeletalFinSets_func_type );
    
    return MorphismConstructor( cat, m, f, t );
    
end );

##
AddDirectProduct( SkeletalFinSets,
  function ( cat, L )
    
    return ObjectConstructor( cat, Product( List( L, Length ) ) );
    
end );

##
AddProjectionInFactorOfDirectProductWithGivenDirectProduct( SkeletalFinSets,
  function ( cat, D, k, P )
    local T, l, a, f;
    
    T := D[k];
    
    l := Length( T );
    
    a := Product( List( D{[ 1 .. k - 1 ]}, Length ) );
    
    f := CapJitTypedExpression(
                 i -> RemInt( QuoInt( i, a ), l ),
                 cat -> SkeletalFinSets_func_type );
    
    return MorphismConstructor( cat, P, f, T );
    
end );

##
AddUniversalMorphismIntoDirectProductWithGivenDirectProduct( SkeletalFinSets,
  function ( cat, D, T, tau, P )
    local l, d, dd, taus, f;
    
    l := Length( D );
    
    d := List( D, Length );
    
    dd := List( [ 0 .. l - 1 ], j -> Product( d{[ 1 .. j ]} ) );
    
    taus := List( tau, AsFunc );
    
    f := CapJitTypedExpression(
                 # if l = 0, then Sum( [ 0 .. l - 1 ], j -> ... ) = 0 ∈ TerminalObject = P
                 i -> Sum( [ 0 .. l - 1 ], j -> dd[1 + j] * taus[1 + j]( i ) ),
                 cat -> SkeletalFinSets_func_type );
    
    return MorphismConstructor( cat, T, f, P );
    
end );

##
AddEqualizer( SkeletalFinSets,
  function ( cat, s, D )
    local funcs, Eq;
    
    funcs := List( D, AsFunc );
    
    Eq := Filtered( [ 0 .. Length( s ) - 1 ], i -> ForAll( [ 1 .. Length( D ) - 1 ], j -> funcs[j]( i ) = funcs[j + 1]( i ) ) );
    
    return ObjectConstructor( cat, Length( Eq ) );
    
end );

##
AddEmbeddingOfEqualizerWithGivenEqualizer( SkeletalFinSets,
  function ( cat, s, D, E )
    local funcs, Eq, f;
    
    funcs := List( D, AsFunc );
    
    Eq := Filtered( [ 0 .. Length( s ) - 1 ], x -> ForAll( [ 1 .. Length( D ) - 1 ], j -> funcs[j]( x ) = funcs[j + 1]( x ) ) );
    
    f := CapJitTypedExpression(
                 i -> Eq[1 + i],
                 cat -> SkeletalFinSets_func_type );
    
    return MorphismConstructor( cat, E, f, s );
    
end );

##
AddUniversalMorphismIntoEqualizerWithGivenEqualizer( SkeletalFinSets,
  function ( cat, s, D, test_object, tau, E )
    local funcs, Eq, t, f;
    
    funcs := List( D, AsFunc );
    
    Eq := Filtered( [ 0 .. Length( s ) - 1 ], x -> ForAll( [ 1 .. Length( D ) - 1 ], j -> funcs[j]( x ) = funcs[j + 1]( x ) ) );
    
    t := AsFunc( tau );
    
    f := CapJitTypedExpression(
                 x -> -1 + BigInt( SafePosition( Eq, t( x ) ) ),
                 cat -> SkeletalFinSets_func_type );
    
    return MorphismConstructor( cat, test_object, f, E );
    
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
    
    return ObjectConstructor( cat, BigInt( 0 ) );
    
end );

##
AddUniversalMorphismFromInitialObjectWithGivenInitialObject( SkeletalFinSets,
  function ( cat, m, I )
    local f;
    
    f := CapJitTypedExpression(
                 IdFunc,
                 cat -> SkeletalFinSets_func_type );
    
    return MorphismConstructor( cat, I, f, m );
    
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
    local f;
    
    f := CapJitTypedExpression(
                 IdFunc,
                 cat -> SkeletalFinSets_func_type );
    
    return MorphismConstructor( cat, M, f, injective_object );
    
end );

##
AddCoproduct( SkeletalFinSets,
  function ( cat, L )
    
    return ObjectConstructor( cat, Sum( List( L, Length ) ) );
    
end );

##
AddInjectionOfCofactorOfCoproductWithGivenCoproduct( SkeletalFinSets,
  function ( cat, L, i, coproduct )
    local O, sum, s, f;
    
    O := L{[ 1 .. i - 1 ]};
    
    sum := Sum( List( O, Length ) );
    
    s := L[i];
    
    f := CapJitTypedExpression(
                 i -> sum + i,
                 cat -> SkeletalFinSets_func_type );
    
    return MorphismConstructor( cat, s, f, coproduct );
    
end );

##
AddUniversalMorphismFromCoproductWithGivenCoproduct( SkeletalFinSets,
  function ( cat, L, test_object, tau, S )
    local sources, sums, funcs, interval, c, f;
    
    sources := List( tau, map -> Length( Source( map ) ) );
    
    ## FIXME: make a functional loop if possible
    sums := List( [ 0 .. Length( tau ) ], k -> Sum( sources{[ 1 .. k ]} ) );
    
    funcs := List( tau, AsFunc );
    
    interval := [ 1 .. Length( tau ) ];
    
    c :=
      function( i )
        local p;
        ## FIXME: PositionSorted
        p := SafePositionProperty( interval, k -> i < sums[k + 1] );
        return funcs[p]( i - sums[p] );
    end;
    
    f := CapJitTypedExpression(
                 c,
                 cat -> SkeletalFinSets_func_type );
    
    return MorphismConstructor( cat, S, f, test_object );
    
end );

##
AddCoequalizer( SkeletalFinSets,
  function ( cat, s, D )
  
    return ObjectConstructor( cat, BigInt( Length( SKELETAL_FIN_SETS_ExplicitCoequalizer( s, D ) ) ) );
    
end );

##
AddProjectionOntoCoequalizerWithGivenCoequalizer( SkeletalFinSets,
  function ( cat, s, D, C )
    local Cq, f;
    
    Cq := SKELETAL_FIN_SETS_ExplicitCoequalizer( s, D );
    
    f := CapJitTypedExpression(
                 i -> -1 + BigInt( SafeUniquePositionProperty( Cq, c -> i in c ) ),
                 cat -> SkeletalFinSets_func_type );
    
    return MorphismConstructor( cat, s, f, C );
    
end );

##
AddUniversalMorphismFromCoequalizerWithGivenCoequalizer( SkeletalFinSets,
  function ( cat, s, D, test_object, tau, C )
    local Cq, func, f;
    
    Cq := SKELETAL_FIN_SETS_ExplicitCoequalizer( s, D );

    func := AsFunc( tau );

    f := CapJitTypedExpression(
                 i -> func( Cq[1 + i][1] ),
                 cat -> SkeletalFinSets_func_type );
                 
    return MorphismConstructor( cat, C, f, Range( tau ) );
    
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
    local m, n, f;
    
    m := Length( M );
    
    n := Length( N );
    
    f := CapJitTypedExpression(
                 i -> RemInt( i, n ) * m + QuoInt( i, n ),
                 cat -> SkeletalFinSets_func_type );
    
    return MorphismConstructor( cat, MN, f, NM );
    
end );

##
AddExponentialOnObjects( SkeletalFinSets,
  function ( cat, M, N )
    local m, n;
    
    m := Length( M );
    n := Length( N );
    
    return ObjectConstructor( cat, n ^ m );
    
end );

## InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism
AddCartesianLambdaElimination( SkeletalFinSets,
  function ( cat, M, N, intro )
    local m, n, v, f;
    
    m := Length( M );
    n := Length( N );
    
    v := AsFunc( intro )( 0 );
    
    f := CapJitTypedExpression(
                 i -> RemInt( QuoInt( v, n^i ), n ),
                 cat -> SkeletalFinSets_func_type );
    
    return MorphismConstructor( cat, M, f, N );
    
end );

## InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure
AddCartesianLambdaIntroduction( SkeletalFinSets,
  function ( cat, map )
    local M, m, N, n, func, f;
    
    M := Source( map );
    m := Length( M );
    N := Range( map );
    n := Length( N );
    
    func := AsFunc( map );
    
    f := CapJitTypedExpression(
                 i -> Sum( List( [ 0 .. m - 1 ], k -> func( k ) * n^k ) ),
                 cat -> SkeletalFinSets_func_type );
    
    return MorphismConstructor( cat,
                   TerminalObject( cat ),
                   f,
                   ExponentialOnObjects( cat, M, N ) );
    
end );

##
AddExactCoverWithGlobalElements( SkeletalFinSets,
  function ( cat, A )
    local T;
    
    T := TerminalObject( cat );
    
    return List( [ 0 .. Length( A ) - 1 ], j ->
                 MorphismConstructor( cat,
                         T,
                         CapJitTypedExpression(
                                 i -> j,
                                 cat -> SkeletalFinSets_func_type ),
                         A ) );
    
end );

##
AddExponentialOnMorphismsWithGivenExponentials( SkeletalFinSets,
  function ( cat, S, alpha, beta, T )
    local M, N, D, MN, f;
    
    M := Range( alpha );
    N := Source( beta );
    
    D := TerminalObject( cat );
    
    MN := ExponentialOnObjects( cat, M, N );
    
    f := CapJitTypedExpression(
                 i -> AsFunc( CartesianLambdaIntroduction( cat,
                         PreComposeList(
                                 cat,
                                 [ alpha,
                                   CartesianLambdaElimination( cat,
                                           M,
                                           N,
                                           MorphismConstructor( cat,
                                                   D,
                                                   CapJitTypedExpression(
                                                           j -> i,
                                                           cat -> SkeletalFinSets_func_type ),
                                                   MN ) ),
                                   beta ] ) ) )( 0 ),
                 cat -> SkeletalFinSets_func_type );
    
    return MorphismConstructor( cat, S, f, T );
    
end, 1 + Sum( [ [ "TerminalObject", 1 ],
                [ "ExponentialOnObjects", 1 ],
                [ "PreComposeList", 2 ],
                [ "CartesianLambdaElimination", 2 ],
                [ "CartesianLambdaIntroduction", 2 ] ],
        e -> e[2] * CurrentOperationWeight( SkeletalFinSets!.derivations_weight_list, e[1] ) ) );

##
AddCartesianEvaluationMorphismWithGivenSource( SkeletalFinSets,
  function ( cat, M, N, HM_NxM )
    local m, n, exp, f;
    
    m := Length( M );
    n := Length( N );
    
    exp := n ^ m;
    
    f := CapJitTypedExpression(
                 i -> RemInt( QuoInt( i, n^QuoInt( i, exp ) ), n ),
                 cat -> SkeletalFinSets_func_type );
    
    return MorphismConstructor( cat, HM_NxM, f, N );
    
end );

##
AddCartesianCoevaluationMorphismWithGivenRange( SkeletalFinSets,
  function ( cat, M, N, HN_MxN )
    local m, n, mn, f;
    
    m := Length( M );
    n := Length( N );
    
    mn := m * n;
    
    #f := CapJitTypedExpression(
    #             i -> Sum( [ 0 .. n - 1 ], j -> ( i + m * j ) * (m*n)^j ),
    #             cat -> SkeletalFinSets_func_type );
    
    f := CapJitTypedExpression(
                 i -> i * GeometricSum( mn, n ) + m * mn * GeometricSumDiff1( mn, n ),
                 cat -> SkeletalFinSets_func_type );
    
    return MorphismConstructor( cat, M, f, HN_MxN );
    
end );

##
AddSubobjectClassifier( SkeletalFinSets,
  function ( cat )
      
      return ObjectConstructor( cat, BigInt( 2 ) );
      
end );

##
AddClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier( SkeletalFinSets,
  function ( cat, monomorphism, Omega )
    local range, images, c, chi;
    
    range := Range( monomorphism );
    
    images := ListOfImages( cat, monomorphism );
    
    c :=
      function ( x )
        if x in images then
            return BigInt( 1 );
        fi;
        
        return BigInt( 0 );
        
    end;
    
    chi := CapJitTypedExpression(
                   c,
                   cat -> SkeletalFinSets_func_type );
    
    return MorphismConstructor( cat, range, chi, Omega );
    
end );

##
AddMorphismsOfExternalHom( SkeletalFinSets,
  function ( cat, A, B )
    local hom_A_B, mors;
    
    hom_A_B := ExponentialOnObjects( cat, A, B );
    
    mors := ExactCoverWithGlobalElements( cat, hom_A_B );
    
    return List( mors,
                 mor -> CartesianLambdaElimination( cat,
                         A,
                         B,
                         mor ) );
    
end, 1 + Sum( [ [ "ExponentialOnObjects", 1 ],
                [ "ExactCoverWithGlobalElements", 1 ],
                [ "CartesianLambdaElimination", 2 ] ],
        e -> e[2] * CurrentOperationWeight( SkeletalFinSets!.derivations_weight_list, e[1] ) ) );

end );

##
InstallMethod( String,
        "for a CAP skeletal finite set",
        [ IsObjectInCategoryOfSkeletalFinSets ],
        
  function ( s )
    return Concatenation( "FinSet( SkeletalFinSets, ", String( Length( s ) ), " )" );
end );

##
InstallMethod( String,
        "for a CAP map of skeletal finite sets",
        [ IsMorphismInCategoryOfSkeletalFinSets ],
        
  function ( phi )
    return Concatenation( "MapOfFinSets( SkeletalFinSets, ", String( Source( phi ) ), ", ", String( AsList( phi ) ), ", ", String( Range( phi ) ), " )" );
end );

##
InstallMethod( ViewString,
        "for a CAP skeletal finite set",
        [ IsObjectInCategoryOfSkeletalFinSets ],
        
  function ( s )
    return Concatenation( "|", String( Length( s ) ), "|" );
end );

##
InstallMethod( ViewString,
        "for a CAP map of skeletal finite sets",
        [ IsMorphismInCategoryOfSkeletalFinSets ],
        
  function ( phi )
    local arrow;
    
    if HasIsIsomorphism( phi ) and IsIsomorphism( phi ) then
        
        arrow := "⭇";
        
    elif HasIsMonomorphism( phi ) and IsMonomorphism( phi ) then
        
        arrow := "↪";
        
    elif HasIsEpimorphism( phi ) and IsEpimorphism( phi ) then
        
        arrow := "↠";
        
    else
        
        arrow := "→";
        
    fi;
    
    return Concatenation( ViewString( Source( phi ) ), " ", arrow, " ", ViewString( Range( phi ) ) );
    
end );

# We want lists of skeletal finite sets and maps to be displayed in a "fancy" way.
# Since `Display` of list redirects to `Print`, we have to make `PrintString` "fancy",
# even if the documentation of `PrintString` suggests that it should not be "fancy".

##
InstallMethod( PrintString,
        "for a CAP skeletal finite set",
        [ IsObjectInCategoryOfSkeletalFinSets ],
        
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
InstallMethod( PrintString,
        "for a CAP map of skeletal finite sets",
        [ IsMorphismInCategoryOfSkeletalFinSets ],
        
  function ( phi )
    
    return Concatenation(
                   PrintString( Source( phi ) ),
                   " ⱶ", PrintString( AsList( phi ) ), "→ ",
                   PrintString( Range( phi ) ) );
    
end );

##
InstallMethod( DisplayString,
        "for a CAP skeletal finite set",
        [ IsObjectInCategoryOfSkeletalFinSets ],
        
  function ( s )
    
    return Concatenation( PrintString( s ), "\n" );
    
end );

##
InstallMethod( DisplayString,
        "for a CAP map of skeletal finite sets",
        [ IsMorphismInCategoryOfSkeletalFinSets ],
        
  function ( phi )
    
    return Concatenation( PrintString( phi ), "\n" );
    
end );
