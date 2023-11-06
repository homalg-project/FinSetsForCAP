#! @Chunk SkeletalCoimageObject

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
m := FinSet( 3 );
#! |3|
n := FinSet( 3 );
#! |3|
phi := MapOfFinSets( m, [ 1, 0, 1 ], n );
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
#! { 0, 1 } ⱶ[ 1, 0 ]→ { 0, 1, 2 }
Display( ImageEmbedding( phi ) );
#! { 0, 1 } ⱶ[ 0, 1 ]→ { 0, 1, 2 }
#! @EndExample
