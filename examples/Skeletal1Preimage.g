#! @Chunk Skeletal1Preimage

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
m := FinSet1( 7 );
#! |7|
n := FinSet1( 3 );
#! |3|
phi := MapOfFinSets( n, [ 7, 5, 5 ], m );
#! |3| → |7|
P := Preimage( phi, [ 3 ] );;
Display( P );
#! [  ]
P := Preimage( phi, AsList( FinSet1( 5 ) ) );;
Display( P );
#! [ 2, 3 ]
List( P, phi ) = [ 5, 5 ];
#! true
#! @EndExample
