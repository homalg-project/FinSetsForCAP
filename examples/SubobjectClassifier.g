#! @Chunk SubobjectClassifier

LoadPackage( "FinSetsForCAP" );

#! @Example
S := FinSet( [ 1, 2, 3, 4, 5 ] );
#! <An object in FinSets>
A := FinSet( [ 1, 5 ] );
#! <An object in FinSets>
Display( SubobjectClassifier( FinSets ) );
#! [ "true", "false" ]
Display( TruthMorphismOfTrue( FinSets ) );
#! [ [ "*" ], [ [ "*", "true" ] ], [ "true", "false" ] ]
Display( TruthMorphismOfFalse( FinSets ) );
#! [ [ "*" ], [ [ "*", "false" ] ], [ "true", "false" ] ]
Display( CartesianSquareOfSubobjectClassifier( FinSets ) );
#! [ [ "true", "true" ], [ "true", "false" ],
#!   [ "false", "true" ],  [ "false", "false" ] ]
m := MapOfFinSets( A, List( AsList( A ), x -> [ x, x ] ), S );
#! <A morphism in FinSets>
Display( ClassifyingMorphismOfSubobject( m ) );
#! [ [ 1, 2, 3, 4, 5 ], [ [ 1, "true" ], [ 2, "false" ], [ 3, "false" ],
#! [ 4, "false" ], [ 5, "true" ] ], [ "true", "false" ] ]

#! @EndExample
