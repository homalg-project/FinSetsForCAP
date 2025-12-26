#! @Chunk Skeletal1Lift

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
m := FinSet1( 3 );
#! |3|
n := FinSet1( 4 );
#! |4|
f := MapOfFinSets( m, [ 2, 2, 1 ], m );
#! |3| → |3|
g := MapOfFinSets( n, [ 3, 2, 1, 2 ], m );
#! |4| → |3|
IsLiftable( f, g );
#! true
chi := Lift( f, g );
#! |3| → |4|
Display( chi );
#! { 1, 2, 3 } ⱶ[ 2, 2, 3 ]→ { 1,..., 4 }
PreCompose( Lift( f, g ), g ) = f;
#! true
IsLiftable( g, f );
#! false
k := FinSet1( 100000 );
#! |100000|
h := ListWithIdenticalEntries( Cardinality( k ) - 3, 3 );;
h := Concatenation( h, [ 2, 1, 2 ] );;
h := MapOfFinSets( k, h, m );
#! |100000| → |3|
IsLiftable( f, h );
#! true
IsLiftable( h, f );
#! false
#! @EndExample
