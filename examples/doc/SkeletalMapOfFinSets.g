#! @Chunk SkeletalMapOfFinSets

LoadPackage( "FinSetsForCAP" );

#! @Example
s := FinSet( 3 );
#! |3|
t := FinSet( 7 );
#! |7|
phi := MapOfFinSets( s, [ 6, 4, 4 ], t );
#! |3| → |7|
AsList( phi );
#! [ 6, 4, 4 ]
IsWellDefined( phi );
#! true
Display( phi );
#! { 0, 1, 2 } ⱶ[ 6, 4, 4 ]→ { 0,..., 6 }

s := ObjectConstructor( SkeletalFinSets, 3 );
#! |3|
t := ObjectConstructor( SkeletalFinSets, 7 );
#! |7|
phi := MorphismConstructor( s, [ 6, 4, 4 ], t );
#! |3| → |7|
MorphismDatum( phi );
#! [ 6, 4, 4 ]
IsWellDefined( phi );
#! true
Display( phi );
#! { 0, 1, 2 } ⱶ[ 6, 4, 4 ]→ { 0,..., 6 }

#! @EndExample
