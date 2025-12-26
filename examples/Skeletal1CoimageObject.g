#! @Chunk Skeletal1CoimageObject

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
m := FinSet1( 3 );
#! |3|
n := FinSet1( 3 );
#! |3|
phi := MapOfFinSets( m, [ 2, 1, 2 ], n );
#! |3| → |3|
I := CoimageObject( phi );
#! |2|
IsMonomorphism( phi );
#! false
IsSplitMonomorphism( phi );
#! false
IsEpimorphism( phi );
#! false
IsSplitEpimorphism( phi );
#! false
pi := CoimageProjection( phi );
#! |3| → |2|
iota := AstrictionToCoimage( phi );
#! |2| → |3|
PreCompose( pi, iota ) = phi;
#! true
Display( iota );
#! { 1, 2 } ⱶ[ 2, 1 ]→ { 1, 2, 3 }
Display( ImageEmbedding( phi ) );
#! { 1, 2 } ⱶ[ 1, 2 ]→ { 1, 2, 3 }
#! @EndExample
