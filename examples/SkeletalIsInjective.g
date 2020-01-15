#! @Chunk SkeletalIsInjective

LoadPackage( "FinSetsForCAP" );

#! @Example
I := FinSet( 0 );
#! <An object in SkeletalFinSets>
T := FinSet( 1 );
#! <An object in SkeletalFinSets>
M := FinSet( 2 );
#! <An object in SkeletalFinSets>
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
