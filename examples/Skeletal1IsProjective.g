#! @Chunk Skeletal1IsProjective

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
I := FinSet1( 0 );
#! |0|
T := FinSet1( 1 );
#! |1|
M := FinSet1( 2 );
#! |2|
IsProjective( I );
#! true
IsProjective( T );
#! true
IsProjective( M );
#! true
IsOne( EpimorphismFromSomeProjectiveObject( I ) );
#! true
IsOne( EpimorphismFromSomeProjectiveObject( M ) );
#! true
#! @EndExample
