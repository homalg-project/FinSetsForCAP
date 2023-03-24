#! @Chunk SkeletalExactCoverWithGlobalElements

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
L := FinSet( 0 );
#! |0|
M := FinSet( 2 );
#! |2|
Display( ExactCoverWithGlobalElements( L ) );
#! [  ]
g := ExactCoverWithGlobalElements( M );;
Display( g );
#! [ { 0 } ⱶ[ 0 ]→ { 0, 1 }, { 0 } ⱶ[ 1 ]→ { 0, 1 } ]
IsOne( UniversalMorphismFromCoproduct( g ) );
#! true
#! @EndExample
