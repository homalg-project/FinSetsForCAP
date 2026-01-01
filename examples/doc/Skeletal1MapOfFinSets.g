#! @Chunk Skeletal1MapOfFinSets

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
s := FinSet1( 3 );
#! |3|
t := FinSet1( 7 );
#! |7|
phi := MapOfFinSets( s, [ 7, 5, 5 ], t );
#! |3| → |7|
Display( AsList( phi ) );
#! [ 7, 5, 5 ]
IsWellDefined( phi );
#! true
Display( phi );
#! { 1, 2, 3 } ⱶ[ 7, 5, 5 ]→ { 1,..., 7 }
String( phi );
#! "MapOfFinSets( SkeletalFinSets1, FinSet( SkeletalFinSets1, 3 ), [ 7, 5, 5 ], Fin\
#! Set( SkeletalFinSets1, 7 ) )"

s := ObjectConstructor( SkeletalFinSets1, BigInt( 3 ) );
#! |3|
t := ObjectConstructor( SkeletalFinSets1, BigInt( 7 ) );
#! |7|
phi := MorphismConstructor(
    s,
    [ BigInt( 7 ), BigInt( 5 ), BigInt( 5 ) ],
    t
);
#! |3| → |7|
Display( MorphismDatum( phi ) );
#! [ 7, 5, 5 ]
IsWellDefined( phi );
#! true
Display( phi );
#! { 1, 2, 3 } ⱶ[ 7, 5, 5 ]→ { 1,..., 7 }

#! @EndExample
