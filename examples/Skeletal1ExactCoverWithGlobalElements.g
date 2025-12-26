#! @Chunk Skeletal1ExactCoverWithGlobalElements

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
L := FinSet1( 0 );
#! |0|
M := FinSet1( 2 );
#! |2|
Display( ExactCoverWithGlobalElements( L ) );
#! [  ]
g := ExactCoverWithGlobalElements( M );;
Display( g );
#! [ { 1 } ⱶ[ 1 ]→ { 1, 2 }, { 1 } ⱶ[ 2 ]→ { 1, 2 } ]
IsOne( UniversalMorphismFromCoproduct( g ) );
#! true
#! @EndExample
