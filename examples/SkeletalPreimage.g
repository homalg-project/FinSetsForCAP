#! @Chunk SkeletalPreimage

LoadPackage( "FinSetsForCAP" );

#! @Example
m := FinSet( 7 );
#! <An object in SkeletalFinSets>
n := FinSet( 3 );
#! <An object in SkeletalFinSets>
phi := MapOfFinSets( n, [ 6, 4, 4 ], m );
#! <A morphism in SkeletalFinSets>
P := Preimage( phi, [ 2 ] );
#! [  ]
P := Preimage( phi, AsList( FinSet( 5 ) ) );
#! [ 1, 2 ]
#! @EndExample
