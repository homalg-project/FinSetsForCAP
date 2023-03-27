#! @Chunk SkeletalIsProjective

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
I := FinSet( 0 );
#! |0|
T := FinSet( 1 );
#! |1|
M := FinSet( 2 );
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
