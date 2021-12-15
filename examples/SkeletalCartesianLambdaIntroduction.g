#! @Chunk SkeletalCartesianLambdaIntroduction

LoadPackage( "FinSetsForCAP" );

#! @Example
S := FinSet( 3 );
#! <An object in SkeletalFinSets>
R := FinSet( 2 );
#! <An object in SkeletalFinSets>
f := MapOfFinSets( S, [ 2, 2, 1 ], R );
#! <A morphism in SkeletalFinSets>
IsWellDefined( f );
#! true
T := TerminalObject( SkeletalFinSets );
#! <An object in SkeletalFinSets>
IsTerminal( T );
#! true
lf := CartesianLambdaIntroduction( f );
#! <A split monomorphism in SkeletalFinSets>
Source( lf ) = T;
#! true
Display( Range( lf ) );
#! 8
Display( lf );
#! [ 1, [ 7 ], 8 ]
elf := CartesianLambdaElimination( S, R, lf );
#! <A morphism in SkeletalFinSets>
elf = f;
#! true
#! @EndExample
