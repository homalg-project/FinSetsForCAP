#! @System SkeletalMonoEpi

LoadPackage( "FinSets" );

#! @Example
m := FinSet( 3 );
#! <An object in SkeletalFinSets>
n := FinSet( 5 );
#! <An object in SkeletalFinSets>
p := FinSet( 7 );
#! <An object in SkeletalFinSets>
psi := MapOfFinSets( m, [ 1, 3, 5 ], n );
#! <A morphism in SkeletalFinSets>
IsEpimorphism( psi );
#! false
IsMonomorphism( psi );
#! true
psi := MapOfFinSets( p, [ 1, 3, 2, 3, 3, 2, 1 ], m );
#! <A morphism in SkeletalFinSets>
IsEpimorphism( psi );
#! true
#! @EndExample
