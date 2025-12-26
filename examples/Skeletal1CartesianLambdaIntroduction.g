#! @Chunk Skeletal1CartesianLambdaIntroduction

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
S := FinSet1( 3 );
#! |3|
R := FinSet1( 2 );
#! |2|
f := MapOfFinSets( S, [ 2, 2, 1 ], R );
#! |3| → |2|
IsWellDefined( f );
#! true
T := TerminalObject( SkeletalFinSets1 );
#! |1|
IsTerminal( T );
#! true
IsOne( CartesianLambdaIntroduction( IdentityMorphism( T ) ) );
#! true
lf := CartesianLambdaIntroduction( f );
#! |1| → |8|
Source( lf ) = T;
#! true
Display( Range( lf ) );
#! { 1,..., 8 }
Display( lf );
#! { 1 } ⱶ[ 4 ]→ { 1,..., 8 }
elf := CartesianLambdaElimination( S, R, lf );
#! |3| → |2|
elf = f;
#! true
L := MorphismsOfExternalHom( S, R );;
Display( L );
#! [ { 1, 2, 3 } ⱶ[ 1, 1, 1 ]→ { 1, 2 },\
#!  { 1, 2, 3 } ⱶ[ 2, 1, 1 ]→ { 1, 2 },\
#!  { 1, 2, 3 } ⱶ[ 1, 2, 1 ]→ { 1, 2 },\
#!  { 1, 2, 3 } ⱶ[ 2, 2, 1 ]→ { 1, 2 },\
#!  { 1, 2, 3 } ⱶ[ 1, 1, 2 ]→ { 1, 2 },\
#!  { 1, 2, 3 } ⱶ[ 2, 1, 2 ]→ { 1, 2 },\
#!  { 1, 2, 3 } ⱶ[ 1, 2, 2 ]→ { 1, 2 },\
#!  { 1, 2, 3 } ⱶ[ 2, 2, 2 ]→ { 1, 2 } ]
Li := List( L, phi -> CartesianLambdaIntroduction( phi ) );;
Display( Li );
#! [ { 1 } ⱶ[ 1 ]→ { 1,..., 8 }, { 1 } ⱶ[ 2 ]→ { 1,..., 8 },\
#!  { 1 } ⱶ[ 3 ]→ { 1,..., 8 }, { 1 } ⱶ[ 4 ]→ { 1,..., 8 },\
#!  { 1 } ⱶ[ 5 ]→ { 1,..., 8 }, { 1 } ⱶ[ 6 ]→ { 1,..., 8 },\
#!  { 1 } ⱶ[ 7 ]→ { 1,..., 8 }, { 1 } ⱶ[ 8 ]→ { 1,..., 8 } ]
List( L, phi ->
      DirectProductToExponentialLeftAdjunctMorphism( T, S, phi ) ) = Li;
#! true
List( Li, psi -> CartesianLambdaElimination( S, R, psi ) ) = L;
#! true
List( Li, psi ->
      ExponentialToDirectProductLeftAdjunctMorphism( S, R, psi ) ) = L;
#! true
#! @EndExample
