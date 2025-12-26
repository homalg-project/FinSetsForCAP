#! @Chunk Skeletal1Colift

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
I := InitialObject( SkeletalFinSets1 );
#! |0|
iota := UniversalMorphismIntoTerminalObject( I );
#! |0| → |1|
id := IdentityMorphism( I );
#! |0| → |0|
IsColiftable( iota, id );
#! false
m := FinSet1( 5 );
#! |5|
n := FinSet1( 4 );
#! |4|
f := MapOfFinSets( m, [ 2, 2, 1, 1, 3 ], n );
#! |5| → |4|
g := MapOfFinSets( m, [ 5, 5, 4, 4, 5 ], m );
#! |5| → |5|
IsColiftable( f, g );
#! true
chi := Colift( f, g );
#! |4| → |5|
Display( chi );
#! { 1,..., 4 } ⱶ[ 4, 5, 5, 1 ]→ { 1,..., 5 }
PreCompose( f, Colift( f, g ) ) = g;
#! true
IsColiftable( g, f );
#! false
#! @EndExample
