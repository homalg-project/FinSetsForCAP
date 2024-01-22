#! @Chunk Topos

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true

M := FinSet( [ 1 .. 5 ] );;
N := FinSet( [ 1, 2, 4 ] );;
P := FinSet( [ 1, 4, 8, 9 ] );;

G_f := [ [ 1, 1 ], [ 2, 2 ], [ 3, 1 ], [ 4, 2 ], [ 5, 4 ] ];;
f := MapOfFinSets( M, G_f, N );;
IsWellDefined( f );
#! true
G_g := [ [ 1, 4 ], [ 2, 4 ], [ 3, 2 ], [ 4, 2 ], [ 5, 1 ] ];;
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
exp := ExponentialOnObjects( M, N );;
ExponentialOnObjects( FinSet( [ 1 ] ), exp );;
ExponentialOnMorphisms( f, g );;
CartesianLeftEvaluationMorphism( M, N );;
CartesianLeftCoevaluationMorphism( M, N );;
DirectProductToExponentialLeftAdjunctionMap( M, N,
    UniversalMorphismIntoTerminalObject( DirectProduct( M, N ) )
);;
ExponentialToDirectProductLeftAdjunctionMap( M, N,
    UniversalMorphismFromInitialObject( ExponentialOnObjects( M, N ) )
);;

M := FinSet( [ 1, 2 ] );;
N := FinSet( [ "a", "b" ] );;
P := FinSet( [ "*" ] );;
Q := FinSet( [ "§", "&" ] );;
CartesianPreComposeMorphism( M, N, P );;
CartesianPostComposeMorphism( M, N, P );;
DirectProductExponentialCompatibilityMorphism( [ M, N, P, Q ] );;

#! @EndExample
