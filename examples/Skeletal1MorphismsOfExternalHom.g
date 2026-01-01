#! @Chunk Skeletal1MorphismsOfExternalHom

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
L := FinSet1( 0 );
#! |0|
M := FinSet1( 2 );
#! |2|
N := FinSet1( 3 );
#! |3|
Display( MorphismsOfExternalHom( L, L ) );
#! [ ∅ ⱶ[  ]→ ∅ ]
Display( MorphismsOfExternalHom( M, L ) );
#! [  ]
Display( MorphismsOfExternalHom( L, M ) );
#! [ ∅ ⱶ[  ]→ { 1, 2 } ]
Display( MorphismsOfExternalHom( M, N ) );
#! [ { 1, 2 } ⱶ[ 1, 1 ]→ { 1, 2, 3 }, { 1, 2 } ⱶ[ 2, 1 ]→ { 1, 2, 3 },\
#!  { 1, 2 } ⱶ[ 3, 1 ]→ { 1, 2, 3 }, { 1, 2 } ⱶ[ 1, 2 ]→ { 1, 2, 3 },\
#!  { 1, 2 } ⱶ[ 2, 2 ]→ { 1, 2, 3 }, { 1, 2 } ⱶ[ 3, 2 ]→ { 1, 2, 3 },\
#!  { 1, 2 } ⱶ[ 1, 3 ]→ { 1, 2, 3 }, { 1, 2 } ⱶ[ 2, 3 ]→ { 1, 2, 3 },\
#!  { 1, 2 } ⱶ[ 3, 3 ]→ { 1, 2, 3 } ]
#! @EndExample
