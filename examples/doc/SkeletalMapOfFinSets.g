#! @Chunk SkeletalMapOfFinSets

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
s := FinSet( 3 );
#! |3|
t := FinSet( 7 );
#! |7|
phi := MapOfFinSets( s, [ 6, 4, 4 ], t );
#! |3| → |7|
Display( AsList( phi ) );
#! [ 6, 4, 4 ]
IsWellDefined( phi );
#! true
Display( phi );
#! { 0, 1, 2 } ⱶ[ 6, 4, 4 ]→ { 0,..., 6 }
String( phi );
#! "MapOfFinSets( SkeletalFinSets, FinSet( SkeletalFinSets, 3 ), [ 6, 4, 4 ], Fin\
#! Set( SkeletalFinSets, 7 ) )"

s := ObjectConstructor( SkeletalFinSets, BigInt( 3 ) );
#! |3|
t := ObjectConstructor( SkeletalFinSets, BigInt( 7 ) );
#! |7|
phi := MorphismConstructor( s, [ BigInt( 6 ), BigInt( 4 ), BigInt( 4 ) ], t );
#! |3| → |7|
Display( MorphismDatum( phi ) );
#! [ 6, 4, 4 ]
IsWellDefined( phi );
#! true
Display( phi );
#! { 0, 1, 2 } ⱶ[ 6, 4, 4 ]→ { 0,..., 6 }

#! @EndExample
