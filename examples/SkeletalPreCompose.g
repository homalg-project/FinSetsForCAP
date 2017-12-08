#! @System SkeletalPreCompose

LoadPackage( "FinSets" );

#! @Example
m := FinSet( 3 );
#! <An object in SkeletalFinSets>
n := FinSet( 5 );
#! <An object in SkeletalFinSets>
p := FinSet( 7 );
#! <An object in SkeletalFinSets>
psi := MapOfFinSets( m, [ 2, 5, 3 ], n );
#! <A morphism in SkeletalFinSets>
phi := MapOfFinSets( n, [ 1, 4, 6, 6, 3 ], p );
#! <A morphism in SkeletalFinSets>
alpha := PreCompose( psi, phi );
#! <A morphism in SkeletalFinSets>
Display( alpha );
#! [ 3, [ 4, 3, 6 ], 7 ]
#! @EndExample
