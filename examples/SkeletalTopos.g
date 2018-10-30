#! @System SkeletalTopos

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

TensorProductOnObjects( M, N );;
TensorProductOnMorphisms( f, g );;
AssociatorLeftToRight( M, N, P );;
AssociatorRightToLeft( M, N, P );;
TensorUnit( FinSets );;
LeftUnitor( M );;
LeftUnitorInverse( M );;
RightUnitor( M );;
RightUnitorInverse( M );;
Braiding( M, N );;
BraidingInverse( M, N );;
InternalHomOnObjects( M, N );;
InternalHomOnMorphisms( f, g );;
EvaluationMorphism( M, N );;

#! @EndExample
