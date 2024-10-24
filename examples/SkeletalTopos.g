#! @Chunk SkeletalTopos

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true

T := TerminalObject( SkeletalFinSets );;
M := FinSet( 4 );;
N := FinSet( 3 );;
P := FinSet( 4 );;

G_f := [ 0, 1, 0, 2 ];;
f := MapOfFinSets( M, G_f, N );;
IsWellDefined( f );
#! true
G_g := [ 2, 2, 1, 0 ];;
g := MapOfFinSets( M, G_g, N );;
IsWellDefined( g );
#! true

DirectProduct( M, N );;
DirectProductOnMorphisms( f, g );;
CartesianAssociatorLeftToRight( M, N, P );;
CartesianAssociatorRightToLeft( M, N, P );;
TerminalObject( FinSets );;
CartesianLeftUnitor( M );;
CartesianLeftUnitorInverse( M );;
CartesianRightUnitor( M );;
CartesianRightUnitorInverse( M );;
CartesianBraiding( M, N );;
CartesianBraidingInverse( M, N );;
#! #@if ValueOption( "no_precompiled_code" ) <> true
SkeletalFinSets!.cached_precompiled_functions.
    CartesianBraidingWithGivenDirectProducts( SkeletalFinSets,
        DirectProduct( M, N ),
        M, N,
        DirectProduct( N, M )
);;
SkeletalFinSets!.cached_precompiled_functions.
    CartesianBraidingInverseWithGivenDirectProducts( SkeletalFinSets,
        DirectProduct( N, M ),
        M, N,
        DirectProduct( M, N )
);;
#! #@fi
ExponentialOnObjects( M, N );;
ExponentialOnMorphisms( f, g );;
#! #@if ValueOption( "no_precompiled_code" ) <> true
SkeletalFinSets!.cached_precompiled_functions.
    ExponentialOnMorphismsWithGivenExponentials( SkeletalFinSets,
        ExponentialOnObjects( Range( f ), Source( g ) ),
        f, g,
        ExponentialOnObjects( Source( f ), Range( g ) )
);;
#! #@fi
CartesianRightEvaluationMorphism( M, N );;
ExponentialToDirectProductRightAdjunctMorphism( M, N,
    UniversalMorphismFromInitialObject( ExponentialOnObjects( M, N ) )
);;
CartesianLeftEvaluationMorphism( M, N );;
CartesianLeftCoevaluationMorphism( N, M );;
CartesianLeftCoevaluationMorphism( T, T );;
DirectProductToExponentialLeftAdjunctMorphism( M, N,
    UniversalMorphismIntoTerminalObject( DirectProduct( M, N ) )
);;
ExponentialToDirectProductLeftAdjunctMorphism( M, N,
    UniversalMorphismFromInitialObject( ExponentialOnObjects( M, N ) )
);;

M := FinSet( 2 );;
N := FinSet( 2 );;
P := FinSet( 1 );;
Q := FinSet( 2 );;
CartesianPreComposeMorphism( M, N, P );;
CartesianPostComposeMorphism( M, N, P );;
DirectProductExponentialCompatibilityMorphism( [ M, N, P, Q ] );;

#! @EndExample
