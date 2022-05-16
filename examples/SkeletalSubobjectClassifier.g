#! @Chunk SkeletalSubobjectClassifier

LoadPackage( "FinSetsForCAP" );

# Below we see that the internal logic
# of the category SkeletalFinSets is classical logic,
# i.e., the topos SkeletalFinSets is Boolean.

#! @Example
Display( SubobjectClassifier( SkeletalFinSets ) );
#! 2
Display( TruthMorphismOfTrue( SkeletalFinSets ) );
#! [ 1, [ 1 ], 2 ]
Display( TruthMorphismOfFalse( SkeletalFinSets ) );
#! [ 1, [ 0 ], 2 ]
Display( TruthMorphismOfNot( SkeletalFinSets ) );
#! [ 2, [ 1, 0 ], 2 ]
Display( CartesianSquareOfSubobjectClassifier( SkeletalFinSets ) );
#! 4
Display( TruthMorphismOfAnd( SkeletalFinSets ) );
#! [ 4, [ 0, 0, 0, 1 ], 2 ]
Display( TruthMorphismOfOr( SkeletalFinSets ) );
#! [ 4, [ 0, 1, 1, 1 ], 2 ]
Display( TruthMorphismOfImplies( SkeletalFinSets ) );
#! [ 4, [ 1, 1, 0, 1 ], 2 ]
S := FinSet( 5 );
#! <An object in SkeletalFinSets>
A := FinSet( 2 );
#! <An object in SkeletalFinSets>
m := MapOfFinSets( A, [ 0, 4 ], S );
#! <A morphism in SkeletalFinSets>
Display( ClassifyingMorphismOfSubobject( m ) );
#! [ 5, [ 1, 0, 0, 0, 1 ], 2 ]
#! @EndExample
