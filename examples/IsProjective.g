#! @Chunk IsProjective

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
I := FinSet( [ ] );
#! <An object in FinSets>
T := FinSet( [ 1 ] );
#! <An object in FinSets>
M := FinSet( [ 2 ] );
#! <An object in FinSets>
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
