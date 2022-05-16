#! @Chunk SkeletalPreCompose

LoadPackage( "FinSetsForCAP" );

#! @Example
m := FinSet( 3 );
#! <An object in SkeletalFinSets>
n := FinSet( 5 );
#! <An object in SkeletalFinSets>
p := FinSet( 7 );
#! <An object in SkeletalFinSets>
psi := MapOfFinSets( m, [ 1, 4, 2 ], n );
#! <A morphism in SkeletalFinSets>
phi := MapOfFinSets( n, [ 0, 3, 5, 5, 2 ], p );
#! <A morphism in SkeletalFinSets>
alpha := PreCompose( psi, phi );
#! <A morphism in SkeletalFinSets>
Display( alpha );
#! [ 3, [ 3, 2, 5 ], 7 ]
#! @EndExample
