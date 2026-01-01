#! @Chunk Skeletal1WellDefined

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
s := FinSet1( 7 );
#! |7|
t := FinSet1( 4 );
#! |4|
psi := MapOfFinSets( s, [ 1, 3, 2, 3, 2, 4 ], t );
#! |7| → |4|
IsWellDefined( psi );
#! false
psi := MapOfFinSets( s, [ 1, 3, 2, 3, 2, 4, -1 ], t );
#! |7| → |4|
IsWellDefined( psi );
#! false
psi := MapOfFinSets( s, [ 2, 3, 2, 5, 3, 2, 4 ], t );
#! |7| → |4|
IsWellDefined( psi );
#! false
psi := MapOfFinSets( s, [ 1, 3, 2, 4, 3, 2, 4 ], t );
#! |7| → |4|
IsWellDefined( psi );
#! true
#! @EndExample
