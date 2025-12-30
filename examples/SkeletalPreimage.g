#! @Chunk SkeletalPreimage

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
m := FinSet( 7 );
#! |7|
n := FinSet( 3 );
#! |3|
phi := MapOfFinSets( n, [ 6, 4, 4 ], m );
#! |3| → |7|
P := Preimage( phi, [ 2 ] );;
Display( P );
#! [  ]
P := Preimage( phi, AsList( FinSet( 5 ) ) );;
Display( P );
#! [ 1, 2 ]
List( P, phi ) = [ 4, 4 ];
#! true
#! @EndExample
