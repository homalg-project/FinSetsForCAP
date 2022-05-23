#! @Chunk SkeletalIsHomSetInhabited

LoadPackage( "FinSetsForCAP" );

#! @Example
L := FinSet( 0 );
#! |0|
M := FinSet( 2 );
#! |2|
N := FinSet( 3 );
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
