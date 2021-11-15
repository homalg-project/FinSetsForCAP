#! @Chunk SubobjectClassifier

LoadPackage( "FinSetsForCAP" );

# Below we see that the internal logic
# of the category FinSets is classical logic,
# i.e., the topos FinSets is Boolean.

#! @Example
Display( SubobjectClassifier( FinSets ) );
#! [ "true", "false" ]
Display( TruthMorphismOfTrue( FinSets ) );
#! [ [ "*" ], [ [ "*", "true" ] ], [ "true", "false" ] ]
Display( TruthMorphismOfFalse( FinSets ) );
#! [ [ "*" ], [ [ "*", "false" ] ], [ "true", "false" ] ]
Display( TruthMorphismOfNot( FinSets ) );
#! [ [ "true", "false" ],
#!   [ [ "false", "true" ], [ "true", "false" ] ],
#!   [ "true", "false" ] ]
Display( CartesianSquareOfSubobjectClassifier( FinSets ) );
#! [ [ "true", "true" ], [ "true", "false" ],
#!   [ "false", "true" ],  [ "false", "false" ] ]
Display( TruthMorphismOfAnd( FinSets ) );
#! [ [ [ "true", "true" ], [ "true", "false" ],
#!     [ "false", "true" ], [ "false", "false" ] ],
#!   [ [ [ "false", "false" ], "false" ], [ [ "false", "true" ], "false" ],
#!     [ [ "true", "false" ], "false" ], [ [ "true", "true" ], "true" ] ],
#!   [ "true", "false" ] ]
Display( TruthMorphismOfOr( FinSets ) );
#! [ [ [ "true", "true" ], [ "true", "false" ],
#!     [ "false", "true" ], [ "false", "false" ] ],
#!   [ [ [ "false", "false" ], "false" ], [ [ "false", "true" ], "true" ],
#!    [ [ "true", "false" ], "true" ], [ [ "true", "true" ], "true" ] ],
#!   [ "true", "false" ] ]
Display( TruthMorphismOfImplies( FinSets ) );
#! [ [ [ "true", "true" ], [ "true", "false" ],
#!     [ "false", "true" ], [ "false", "false" ] ],
#!   [ [ [ "false", "false" ], "true" ], [ [ "false", "true" ], "true" ],
#!     [ [ "true", "false" ], "false" ], [ [ "true", "true" ], "true" ] ],
#!   [ "true", "false" ] ]
S := FinSet( [ 1, 2, 3, 4, 5 ] );
#! <An object in FinSets>
A := FinSet( [ 1, 5 ] );
#! <An object in FinSets>
m := EmbeddingOfFinSets( A, S );
#! <A monomorphism in FinSets>
Display( ClassifyingMorphismOfSubobject( m ) );
#! [ [ 1, 2, 3, 4, 5 ], [ [ 1, "true" ], [ 2, "false" ], [ 3, "false" ],
#! [ 4, "false" ], [ 5, "true" ] ], [ "true", "false" ] ]
#! @EndExample
