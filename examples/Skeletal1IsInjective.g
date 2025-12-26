#! @Chunk Skeletal1IsInjective

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
I := FinSet1( 0 );
#! |0|
T := FinSet1( 1 );
#! |1|
M := FinSet1( 2 );
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
