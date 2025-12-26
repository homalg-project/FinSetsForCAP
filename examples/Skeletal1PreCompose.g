#! @Chunk Skeletal1PreCompose

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
m := FinSet1( 3 );
#! |3|
n := FinSet1( 5 );
#! |5|
p := FinSet1( 7 );
#! |7|
psi := MapOfFinSets( m, [ 2, 5, 3 ], n );
#! |3| → |5|
phi := MapOfFinSets( n, [ 1, 4, 6, 6, 3 ], p );
#! |5| → |7|
alpha := PreCompose( psi, phi );
#! |3| → |7|
Display( alpha );
#! { 1, 2, 3 } ⱶ[ 4, 3, 6 ]→ { 1,..., 7 }
#! @EndExample
