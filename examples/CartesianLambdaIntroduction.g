#! @Chunk CartesianLambdaIntroduction

LoadPackage( "FinSetsForCAP" );

#! @Example
S := FinSet( [ 1 .. 3 ] );
#! <An object in FinSets>
T := FinSet( [ 1 .. 2 ] );
#! <An object in FinSets>
f := MapOfFinSets( S, [ [1,2],[2,2],[3,1] ], T );
#! <A morphism in FinSets>
IsWellDefined( f );
#! true
lf := CartesianLambdaIntroduction( f );
#! <A morphism in FinSets>
T := TerminalObject( f );
#! <An object in FinSets>
Source( lf ) = T;
#! true
Length( Range( lf ) );
#! 8
lf( T[1] ) = f;
#! true
#! @EndExample
