#! @Chunk Skeletal1Topos

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true

T := TerminalObject( SkeletalFinSets1 );;
M := FinSet1( 4 );;
N := FinSet1( 3 );;
P := FinSet1( 4 );;

G_f := [ 1, 2, 1, 3 ];;
f := MapOfFinSets( M, G_f, N );;
IsWellDefined( f );
#! true
G_g := [ 3, 3, 2, 1 ];;
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
SkeletalFinSets1!.cached_precompiled_functions.
    CartesianBraidingWithGivenDirectProducts( SkeletalFinSets1,
        DirectProduct( M, N ),
        M, N,
        DirectProduct( N, M )
);;
SkeletalFinSets1!.cached_precompiled_functions.
    CartesianBraidingInverseWithGivenDirectProducts( SkeletalFinSets1,
        DirectProduct( N, M ),
        M, N,
        DirectProduct( M, N )
);;
#! #@fi
ExponentialOnObjects( M, N );;
ExponentialOnMorphisms( f, g );;
#! #@if ValueOption( "no_precompiled_code" ) <> true
SkeletalFinSets1!.cached_precompiled_functions.
    ExponentialOnMorphismsWithGivenExponentials( SkeletalFinSets1,
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

M := FinSet1( 2 );;
N := FinSet1( 2 );;
P := FinSet1( 1 );;
Q := FinSet1( 2 );;
CartesianPreComposeMorphism( M, N, P );;
CartesianPostComposeMorphism( M, N, P );;
DirectProductExponentialCompatibilityMorphism( [ M, N, P, Q ] );;

#! @EndExample
