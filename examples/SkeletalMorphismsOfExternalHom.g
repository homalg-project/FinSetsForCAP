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
Display( MorphismsOfExternalHom( L, L ) );
#! [ ∅ ⱶ[  ]→ ∅ ]
Display( MorphismsOfExternalHom( M, L ) );
#! [  ]
Display( MorphismsOfExternalHom( L, M ) );
#! [ ∅ ⱶ[  ]→ { 0, 1 } ]
Display( MorphismsOfExternalHom( M, N ) );
#! [ { 0, 1 } ⱶ[ 0, 0 ]→ { 0, 1, 2 }, { 0, 1 } ⱶ[ 1, 0 ]→ { 0, 1, 2 },\
#!  { 0, 1 } ⱶ[ 2, 0 ]→ { 0, 1, 2 }, { 0, 1 } ⱶ[ 0, 1 ]→ { 0, 1, 2 },\
#!  { 0, 1 } ⱶ[ 1, 1 ]→ { 0, 1, 2 }, { 0, 1 } ⱶ[ 2, 1 ]→ { 0, 1, 2 },\
#!  { 0, 1 } ⱶ[ 0, 2 ]→ { 0, 1, 2 }, { 0, 1 } ⱶ[ 1, 2 ]→ { 0, 1, 2 },\
#!  { 0, 1 } ⱶ[ 2, 2 ]→ { 0, 1, 2 } ]
#! @EndExample
