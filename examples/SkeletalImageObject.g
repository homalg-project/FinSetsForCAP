#! @Chunk SkeletalImageObject

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
ImageObject( phi );
#! |2|
Length( ImageObject( phi ) );
#! 2
s := FinSet( 2 );
#! |2|
I := ImageObject( phi, s );
#! |2|
Length( I );
#! 2
#! @EndExample
