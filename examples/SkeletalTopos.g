#! @Chunk SkeletalTopos

LoadPackage( "FinSetsForCAP" );

#! @Example

M := FinSet( 4 );;
N := FinSet( 3 );;
P := FinSet( 4 );;

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
ExponentialOnObjects( M, N );;
ExponentialOnMorphisms( f, g );;
CartesianEvaluationMorphism( M, N );;

#! @EndExample
