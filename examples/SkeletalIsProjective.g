#! @Chunk SkeletalIsProjective

LoadPackage( "FinSetsForCAP" );

#! @Example
I := FinSet( 0 );
#! <An object in SkeletalFinSets>
T := FinSet( 1 );
#! <An object in SkeletalFinSets>
M := FinSet( 2 );
#! <An object in SkeletalFinSets>
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
