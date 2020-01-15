#! @Chunk IsHomSetInhabited

LoadPackage( "FinSetsForCAP" );

#! @Example
L := FinSet( [ ] );
#! <An object in FinSets>
M := FinSet( [ 2 ] );
#! <An object in FinSets>
N := FinSet( [ 3 ] );
#! <An object in FinSets>
IsHomSetInhabited( L, L );
#! true
IsHomSetInhabited( M, L );
#! false
IsHomSetInhabited( L, M );
#! true
IsHomSetInhabited( M, N );
#! true
#! @EndExample
