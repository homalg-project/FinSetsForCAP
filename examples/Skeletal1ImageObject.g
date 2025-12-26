#! @Chunk Skeletal1ImageObject

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
m := FinSet1( 7 );
#! |7|
n := FinSet1( 3 );
#! |3|
phi := MapOfFinSets( n, [ 7, 5, 5 ], m );
#! |3| → |7|
IsWellDefined( phi );
#! true
ImageObject( phi );
#! |2|
Cardinality( ImageObject( phi ) );
#! 2
s := FinSet1( 2 );
#! |2|
I := ImageObject( phi, s );
#! |2|
Cardinality( I );
#! 2
#! @EndExample
