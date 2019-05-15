#! @Chunk SkeletalPreimage

LoadPackage( "FinSetsForCAP" );

#! @Example
m := FinSet( 7 );
#! <An object in SkeletalFinSets>
n := FinSet( 3 );
#! <An object in SkeletalFinSets>
phi := MapOfFinSets( n, [7, 5, 5] ,m );
#! <A morphism in SkeletalFinSets>
P := Preimage( phi, [2] );
#! [  ]
P := Preimage( phi, AsList( FinSet( 5 ) ) );
#! [ 2, 3 ]
#! @EndExample
