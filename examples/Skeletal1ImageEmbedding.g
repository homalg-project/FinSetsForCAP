#! @Chunk Skeletal1ImageEmbedding

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
m := FinSet1( 7 );
#! |7|
n := FinSet1( 3 );
#! |3|
phi := MapOfFinSets( n, [ 7, 5, 5 ], m );
#! |3| → |7|
pi := ImageEmbedding( phi );
#! |2| → |7|
Display( pi );
#! { 1, 2 } ⱶ[ 5, 7 ]→ { 1,..., 7 }
#! @EndExample
