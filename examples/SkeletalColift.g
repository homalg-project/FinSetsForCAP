#! @Chunk SkeletalColift

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
m := FinSet( 5 );
#! |5|
n := FinSet( 4 );
#! |4|
f := MapOfFinSets( m, [ 1, 1, 0, 0, 2 ], n );
#! |5| → |4|
g := MapOfFinSets( m, [ 4, 4, 3, 3, 4 ], m );
#! |5| → |5|
IsColiftable( f, g );
#! true
chi := Colift( f, g );
#! |4| → |5|
Display( chi );
#! { 0,..., 3 } ⱶ[ 3, 4, 4, 0 ]→ { 0,..., 4 }
PreCompose( f, Colift( f, g ) ) = g;
#! true
IsColiftable( g, f );
#! false
#! @EndExample
