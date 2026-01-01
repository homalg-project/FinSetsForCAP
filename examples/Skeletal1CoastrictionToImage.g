#! @Chunk Skeletal1CoastrictionToImage

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
f := CoastrictionToImage( phi );
#! |3| → |2|
Display( f );
#! { 1, 2, 3 } ⱶ[ 2, 1, 1 ]→ { 1, 2 }
IsWellDefined( f );
#! true
IsEpimorphism( f );
#! true
IsSplitEpimorphism( f );
#! true
m := FinSet1( 77 );
#! |77|
n := FinSet1( 4 );
#! |4|
phi := MapOfFinSets( n, [ 77, 2, 25, 2 ], m );
#! |4| → |77|
IsWellDefined( phi );
#! true
iota := ImageEmbedding( phi );
#! |3| → |77|
pi := CoastrictionToImage( phi );
#! |4| → |3|
Display( pi );
#! { 1,..., 4 } ⱶ[ 3, 1, 2, 1 ]→ { 1, 2, 3 }
IsWellDefined( pi );
#! true
IsEpimorphism( pi );
#! true
IsSplitEpimorphism( pi );
#! true
PreCompose( pi, iota ) = phi;
#! true

#! @EndExample
