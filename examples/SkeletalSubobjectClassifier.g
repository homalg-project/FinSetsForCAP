#! @Chunk SkeletalSubobjectClassifier

LoadPackage( "FinSetsForCAP" );

# Below we see that the internal logic
# of the category SkeletalFinSets is classical logic,
# i.e., the topos SkeletalFinSets is Boolean.

#! @Example
SubobjectClassifier( SkeletalFinSets );
#! |2|
Display( TruthMorphismOfFalse( SkeletalFinSets ) );
#! { 0 } ⱶ[ 0 ]→ { 0, 1 }
Display( TruthMorphismOfTrue( SkeletalFinSets ) );
#! { 0 } ⱶ[ 1 ]→ { 0, 1 }
Display( TruthMorphismOfNot( SkeletalFinSets ) );
#! { 0, 1 } ⱶ[ 1, 0 ]→ { 0, 1 }
CartesianSquareOfSubobjectClassifier( SkeletalFinSets );
#! |4|
Display( TruthMorphismOfAnd( SkeletalFinSets ) );
#! { 0,..., 3 } ⱶ[ 0, 0, 0, 1 ]→ { 0, 1 }
Display( TruthMorphismOfOr( SkeletalFinSets ) );
#! { 0,..., 3 } ⱶ[ 0, 1, 1, 1 ]→ { 0, 1 }
Display( TruthMorphismOfImplies( SkeletalFinSets ) );
#! { 0,..., 3 } ⱶ[ 1, 1, 0, 1 ]→ { 0, 1 }
S := FinSet( 5 );
#! |5|
A := FinSet( 2 );
#! |2|
m := MapOfFinSets( A, [ 0, 4 ], S );
#! |2| → |5|
Display( ClassifyingMorphismOfSubobject( m ) );
#! { 0,..., 4 } ⱶ[ 1, 0, 0, 0, 1 ]→ { 0, 1 }
#! @EndExample
