#! @System ImageEmbedding

LoadPackage( "FinSets" );

#! @Example
m := FinSet( 7 );
#!<An object in SkeletalFinSets>
n := FinSet( 3 );
#!<An object in SkeletalFinSets>
phi := MapOfFinSets( n, [7, 5, 5] ,m );
#!<A morphisms in SkeletalFinSets>
pi := ImageEmbedding( phi );
#!<A mono morphism in SkeletalFinSets>
Display( pi );
#! [ 2, [ 1, 2 ], 7 ]
#! @EndExample