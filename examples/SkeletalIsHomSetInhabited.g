#! @Chunk SkeletalIsHomSetInhabited

LoadPackage( "FinSetsForCAP" );

#! @Example
L := FinSet( 0 );
#! <An object in SkeletalFinSets>
M := FinSet( 2 );
#! <An object in SkeletalFinSets>
N := FinSet( 3 );
#! <An object in SkeletalFinSets>
IsHomSetInhabited( L, L );
#! true
IsHomSetInhabited( M, L );
#! false
IsHomSetInhabited( L, M );
#! true
IsHomSetInhabited( M, N );
#! true
#! @EndExample
