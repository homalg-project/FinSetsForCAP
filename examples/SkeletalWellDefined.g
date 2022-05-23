#! @Chunk SkeletalWellDefined

LoadPackage( "FinSetsForCAP" );

#! @Example
s := FinSet( 7 );
#! |7|
t := FinSet( 4 );
#! |4|
psi := MapOfFinSets( s, [ 0, 2, 1, 2, 1, 3 ], t );
#! |7| → |4|
IsWellDefined( psi );
#! false
psi := MapOfFinSets( s, [ 0, 2, 1, 2, 1, 3, -2 ], t );
#! |7| → |4|
IsWellDefined( psi );
#! false
psi := MapOfFinSets( s, [ 1, 2, 1, 4, 2, 1, 3 ], t );
#! |7| → |4|
IsWellDefined( psi );
#! false
psi:= MapOfFinSets( s, [ 0, 2, 1, 3, 2, 1, 3 ], t );
#! |7| → |4|
IsWellDefined( psi );
#! true
#! @EndExample
