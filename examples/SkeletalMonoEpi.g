#! @Chunk SkeletalMonoEpi

LoadPackage( "FinSetsForCAP" );

#! @Example
m := FinSet( 3 );
#! <An object in SkeletalFinSets>
n := FinSet( 5 );
#! <An object in SkeletalFinSets>
p := FinSet( 7 );
#! <An object in SkeletalFinSets>
psi := MapOfFinSets( m, [ 0, 2, 4 ], n );
#! <A morphism in SkeletalFinSets>
IsEpimorphism( psi );
#! false
IsSplitEpimorphism( psi );
#! false
IsMonomorphism( psi );
#! true
IsSplitMonomorphism( psi );
#! true
psi := MapOfFinSets( p, [ 0, 2, 1, 2, 2, 1, 0 ], m );
#! <A morphism in SkeletalFinSets>
IsEpimorphism( psi );
#! true
IsSplitEpimorphism( psi );
#! true
IsMonomorphism( psi );
#! false
IsSplitMonomorphism( psi );
#! false
#! @EndExample
