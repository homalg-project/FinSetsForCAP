#! @Chunk SkeletalCartesianLambdaIntroduction

LoadPackage( "FinSetsForCAP" );

#! @Example
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
lf := CartesianLambdaIntroduction( f );
#! |1| ↪ |8|
Source( lf ) = T;
#! true
Display( Range( lf ) );
#! { 0,..., 7 }
Display( lf );
#! { 0 } ⱶ[ 6 ]→ { 0,..., 7 }
elf := CartesianLambdaElimination( S, R, lf );
#! |3| → |2|
elf = f;
#! true
#! @EndExample
