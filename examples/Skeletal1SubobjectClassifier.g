#! @Chunk Skeletal1SubobjectClassifier

# Below we see that the internal logic
# of the category SkeletalFinSets1 is classical logic,
# i.e., the topos SkeletalFinSets1 is Boolean.

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
SubobjectClassifier( SkeletalFinSets1 );
#! |2|
Display( TruthMorphismOfFalse( SkeletalFinSets1 ) );
#! { 1 } ⱶ[ 1 ]→ { 1, 2 }
Display( TruthMorphismOfTrue( SkeletalFinSets1 ) );
#! { 1 } ⱶ[ 2 ]→ { 1, 2 }
Display( TruthMorphismOfNot( SkeletalFinSets1 ) );
#! { 1, 2 } ⱶ[ 2, 1 ]→ { 1, 2 }
CartesianSquareOfSubobjectClassifier( SkeletalFinSets1 );
#! |4|
Display( TruthMorphismOfAnd( SkeletalFinSets1 ) );
#! { 1,..., 4 } ⱶ[ 1, 1, 1, 2 ]→ { 1, 2 }
Display( TruthMorphismOfOr( SkeletalFinSets1 ) );
#! { 1,..., 4 } ⱶ[ 1, 2, 2, 2 ]→ { 1, 2 }
Display( TruthMorphismOfImplies( SkeletalFinSets1 ) );
#! { 1,..., 4 } ⱶ[ 2, 1, 2, 2 ]→ { 1, 2 }
S := FinSet1( 5 );
#! |5|
A := FinSet1( 2 );
#! |2|
m := MapOfFinSets( A, [ 1, 5 ], S );
#! |2| → |5|
Display( ClassifyingMorphismOfSubobject( m ) );
#! { 1,..., 5 } ⱶ[ 2, 1, 1, 1, 2 ]→ { 1, 2 }
#! @EndExample
