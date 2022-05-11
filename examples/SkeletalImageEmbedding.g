#! @Chunk SkeletalImageEmbedding

LoadPackage( "FinSetsForCAP" );

#! @Example
m := FinSet( 7 );
#! <An object in SkeletalFinSets>
n := FinSet( 3 );
#! <An object in SkeletalFinSets>
phi := MapOfFinSets( n, [ 6, 4, 4 ], m );
#! <A morphism in SkeletalFinSets>
pi := ImageEmbedding( phi );
#! <A monomorphism in SkeletalFinSets>
Display( pi );
#! [ 2, [ 4, 6 ], 7 ]
#! @EndExample
