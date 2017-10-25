#! @System MonoEpi

LoadPackage( "FinSets" );

#! @Example
psi := MapOfFinSets( p, [1, 3, 5, 6] ,m );
#!<A morphism in SkeletalFinSets>
IsEpimorphism( psi );
#!false
IsMonomorphism( psi );
#!true
psi := MapOfFinSets( m, [1, 3, 2, 3, 4, 2, 4] ,p );
#!<A morphism in SkeletalFinSets>
IsEpimorphism( psi );
#!true
#! @EndExample