#! @Chunk Skeletal1IsHomSetInhabited

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
L := FinSet1( 0 );
#! |0|
M := FinSet1( 2 );
#! |2|
N := FinSet1( 3 );
#! |3|
IsHomSetInhabited( L, L );
#! true
IsHomSetInhabited( M, L );
#! false
IsHomSetInhabited( L, M );
#! true
IsHomSetInhabited( M, N );
#! true
#! @EndExample
