#! @Chunk SkeletalMorphismsOfExternalHom

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
L := FinSet( 0 );
#! |0|
M := FinSet( 2 );
#! |2|
N := FinSet( 3 );
#! |3|
MorphismsOfExternalHom( L, L );
#! [ |0| → |0| ]
MorphismsOfExternalHom( M, L );
#! [  ]
MorphismsOfExternalHom( L, M );
#! [ |0| → |2| ]
MorphismsOfExternalHom( M, N );
#! [ |2| → |3|, |2| → |3|, |2| → |3|, |2| → |3|, |2| → |3|,
#!   |2| → |3|, |2| → |3|, |2| → |3|, |2| → |3| ]
#! @EndExample
