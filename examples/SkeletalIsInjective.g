#! @Chunk SkeletalIsInjective

LoadPackage( "FinSetsForCAP" );

#! @Example
I := FinSet( 0 );
#! |0|
T := FinSet( 1 );
#! |1|
M := FinSet( 2 );
#! |2|
IsInjective( I );
#! false
IsInjective( T );
#! true
IsInjective( M );
#! true
IsIsomorphism( MonomorphismIntoSomeInjectiveObject( I ) );
#! false
IsMonomorphism( MonomorphismIntoSomeInjectiveObject( I ) );
#! true
IsOne( MonomorphismIntoSomeInjectiveObject( M ) );
#! true
#! @EndExample
