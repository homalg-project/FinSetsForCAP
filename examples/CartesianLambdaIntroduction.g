#! @Chunk CartesianLambdaIntroduction

LoadPackage( "FinSetsForCAP" );

#! @Example
S := FinSet( [ 1 .. 3 ] );
#! <An object in FinSets>
R := FinSet( [ 1 .. 2 ] );
#! <An object in FinSets>
f := MapOfFinSets( S, [ [1,2],[2,2],[3,1] ], R );
#! <A morphism in FinSets>
IsWellDefined( f );
#! true
T := TerminalObject( f );
#! <An object in FinSets>
IsTerminal( T );
#! true
lf := CartesianLambdaIntroduction( f );
#! <A split monomorphism in FinSets>
Source( lf ) = T;
#! true
Length( Range( lf ) );
#! 8
lf( T[1] ) = f;
#! true
#! @EndExample
