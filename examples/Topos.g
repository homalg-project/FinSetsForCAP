#! @System Topos

LoadPackage( "FinSetsForCAP" );

#! @Example

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
CoevaluationMorphism( M, N );;
TensorProductToInternalHomAdjunctionMap( M, N,
    UniversalMorphismIntoTerminalObject( TensorProductOnObjects( M, N ) )
);;
InternalHomToTensorProductAdjunctionMap( M, N,
    UniversalMorphismFromInitialObject( InternalHomOnObjects( M, N ) )
);;

M := FinSet( [ 1, 2 ] );;
N := FinSet( [ "a", "b" ] );;
P := FinSet( [ "*" ] );;
Q := FinSet( [ "§", "&" ] );;
MonoidalPreComposeMorphism( M, N, P );;
MonoidalPostComposeMorphism( M, N, P );;
TensorProductInternalHomCompatibilityMorphism( M, N, P, Q );;

#! @EndExample
