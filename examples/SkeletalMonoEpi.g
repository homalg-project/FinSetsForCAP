#! @Chunk SkeletalMonoEpi

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
m := FinSet( 3 );
#! |3|
n := FinSet( 5 );
#! |5|
p := FinSet( 7 );
#! |7|

psi := MapOfFinSets( m, [ 0, 2, 4 ], n );
#! |3| → |5|
IsEpimorphism( psi );
#! false
IsSplitEpimorphism( psi );
#! false
IsMonomorphism( psi );
#! true
IsSplitMonomorphism( psi );
#! true
psi;
#! |3| ↪ |5|

psi := MapOfFinSets( p, [ 0, 2, 1, 2, 2, 1, 0 ], m );
#! |7| → |3|
IsEpimorphism( psi );
#! true
IsSplitEpimorphism( psi );
#! true
IsMonomorphism( psi );
#! false
IsSplitMonomorphism( psi );
#! false
psi;
#! |7| ↠ |3|

id := IdentityMorphism( m );
#! |3| → |3|
IsIsomorphism( id );
#! true
id;
#! |3| ⭇ |3|

#! @EndExample
