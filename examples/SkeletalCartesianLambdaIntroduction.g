#! @Chunk SkeletalCartesianLambdaIntroduction

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
S := FinSet( 3 );
#! |3|
R := FinSet( 2 );
#! |2|
f := MapOfFinSets( S, [ 1, 1, 0 ], R );
#! |3| → |2|
IsWellDefined( f );
#! true
T := TerminalObject( SkeletalFinSets );
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
#! { 0,..., 7 }
Display( lf );
#! { 0 } ⱶ[ 3 ]→ { 0,..., 7 }
elf := CartesianLambdaElimination( S, R, lf );
#! |3| → |2|
elf = f;
#! true
L := MorphismsOfExternalHom( S, R );;
Display( L );
#! [ { 0, 1, 2 } ⱶ[ 0, 0, 0 ]→ { 0, 1 },\
#!  { 0, 1, 2 } ⱶ[ 1, 0, 0 ]→ { 0, 1 },\
#!  { 0, 1, 2 } ⱶ[ 0, 1, 0 ]→ { 0, 1 },\
#!  { 0, 1, 2 } ⱶ[ 1, 1, 0 ]→ { 0, 1 },\
#!  { 0, 1, 2 } ⱶ[ 0, 0, 1 ]→ { 0, 1 },\
#!  { 0, 1, 2 } ⱶ[ 1, 0, 1 ]→ { 0, 1 },\
#!  { 0, 1, 2 } ⱶ[ 0, 1, 1 ]→ { 0, 1 },\
#!  { 0, 1, 2 } ⱶ[ 1, 1, 1 ]→ { 0, 1 } ]
Li := List( L, phi -> CartesianLambdaIntroduction( phi ) );;
Display( Li );
#! [ { 0 } ⱶ[ 0 ]→ { 0,..., 7 }, { 0 } ⱶ[ 1 ]→ { 0,..., 7 },\
#!  { 0 } ⱶ[ 2 ]→ { 0,..., 7 }, { 0 } ⱶ[ 3 ]→ { 0,..., 7 },\
#!  { 0 } ⱶ[ 4 ]→ { 0,..., 7 }, { 0 } ⱶ[ 5 ]→ { 0,..., 7 },\
#!  { 0 } ⱶ[ 6 ]→ { 0,..., 7 }, { 0 } ⱶ[ 7 ]→ { 0,..., 7 } ]
List( L, phi ->
      DirectProductToExponentialLeftAdjunctMorphism( T, S, phi ) ) = Li;
#! true
List( Li, psi -> CartesianLambdaElimination( S, R, psi ) ) = L;
#! true
List( Li, psi ->
      ExponentialToDirectProductLeftAdjunctMorphism( S, R, psi ) ) = L;
#! true
#! @EndExample
