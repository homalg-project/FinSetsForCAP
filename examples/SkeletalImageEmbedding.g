#! @Chunk SkeletalImageEmbedding

LoadPackage( "FinSetsForCAP" );

#! @Example
m := FinSet( 7 );
#! |7|
n := FinSet( 3 );
#! |3|
phi := MapOfFinSets( n, [ 6, 4, 4 ], m );
#! |3| → |7|
pi := ImageEmbedding( phi );
#! |2| ↪ |7|
Display( pi );
#! { 0, 1 } ⱶ[ 4, 6 ]→ { 0,..., 6 }
#! @EndExample
