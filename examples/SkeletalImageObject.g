#! @Chunk SkeletalImageObject

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
m := FinSet( 7 );
#! |7|
n := FinSet( 3 );
#! |3|
phi := MapOfFinSets( n, [ 6, 4, 4 ], m );
#! |3| → |7|
IsWellDefined( phi );
#! true
ImageObject( phi );
#! |2|
Cardinality( ImageObject( phi ) );
#! 2
s := FinSet( 2 );
#! |2|
I := ImageObject( phi, s );
#! |2|
Cardinality( I );
#! 2
#! @EndExample
