#! @Chunk SkeletalPreCompose

LoadPackage( "FinSetsForCAP" );

#! @Example
m := FinSet( 3 );
#! |3|
n := FinSet( 5 );
#! |5|
p := FinSet( 7 );
#! |7|
psi := MapOfFinSets( m, [ 1, 4, 2 ], n );
#! |3| → |5|
phi := MapOfFinSets( n, [ 0, 3, 5, 5, 2 ], p );
#! |5| → |7|
alpha := PreCompose( psi, phi );
#! |3| → |7|
Display( alpha : lazy );
#! { 0, 1, 2 } ⱶ[  ].?.→ { 0,..., 6 }
Display( alpha );
#! { 0, 1, 2 } ⱶ[ 3, 2, 5 ]→ { 0,..., 6 }
#! @EndExample
