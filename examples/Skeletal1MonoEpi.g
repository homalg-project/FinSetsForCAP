#! @Chunk Skeletal1MonoEpi

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
m := FinSet1( 3 );
#! |3|
n := FinSet1( 5 );
#! |5|
p := FinSet1( 7 );
#! |7|

psi := MapOfFinSets( m, [ 1, 3, 5 ], n );
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

psi := MapOfFinSets( p, [ 1, 3, 2, 3, 3, 2, 1 ], m );
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
