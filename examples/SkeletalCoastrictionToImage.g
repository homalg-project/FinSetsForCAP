#! @Chunk SkeletalCoastrictionToImage

LoadPackage( "FinSetsForCAP" );

#! @Example
m := FinSet( 7 );
#! |7|
n := FinSet( 3 );
#! |3|
phi := MapOfFinSets( n, [ 6, 4, 4 ], m );
#! |3| → |7|
IsWellDefined( phi );
#! true
f := CoastrictionToImage( phi );
#! |3| → |2|
Display( f );
#! { 0, 1, 2 } ⱶ[ 1, 0, 0 ]→ { 0, 1 }
IsWellDefined( f );
#! true
IsEpimorphism( f );
#! true
IsSplitEpimorphism( f );
#! true
m := FinSet( 77 );
#! |77|
n := FinSet( 4 );
#! |4|
phi := MapOfFinSets( n, [ 76, 1, 24, 1 ], m );
#! |4| → |77|
IsWellDefined( phi );
#! true
iota := ImageEmbedding( phi );
#! |3| ↪ |77|
pi := CoastrictionToImage( phi );
#! |4| → |3|
Display( pi );
#! { 0,..., 3 } ⱶ[ 2, 0, 1, 0 ]→ { 0, 1, 2 }
IsWellDefined( pi );
#! true
IsEpimorphism( pi );
#! true
IsSplitEpimorphism( pi );
#! true
PreCompose( pi, iota ) = phi;
#! true

#! @EndExample
