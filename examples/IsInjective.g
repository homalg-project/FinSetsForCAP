#! @Chunk IsInjective

LoadPackage( "FinSetsForCAP" );

#! @Example
I := FinSet( [ ] );
#! <An object in FinSets>
T := FinSet( [ 1 ] );
#! <An object in FinSets>
M := FinSet( [ 2 ] );
#! <An object in FinSets>
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
