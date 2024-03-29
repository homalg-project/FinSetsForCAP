#! @Chunk SkeletalInitialTerminal

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
m := FinSet( 8 );
#! |8|
IsInitial( m );
#! false
IsTerminal( m );
#! false
i := InitialObject( SkeletalFinSets );
#! |0|
Display( i );
#! ∅
IsInitial( i );
#! true
IsTerminal( i );
#! false
iota := UniversalMorphismFromInitialObject( m );
#! |0| → |8|
Display( AsList( i ) );
#! [  ]
t := TerminalObject( SkeletalFinSets );
#! |1|
Display( AsList( t ) );
#! [ 0 ]
IsInitial( t );
#! false
IsTerminal( t );
#! true
pi := UniversalMorphismIntoTerminalObject( m );
#! |8| → |1|
IsIdenticalObj( Range( pi ), t );
#! true
pi_t := UniversalMorphismIntoTerminalObjectWithGivenTerminalObject( m, t );
#! |8| → |1|
Display( AsList( pi_t ) );
#! [ 0, 0, 0, 0, 0, 0, 0, 0 ]
pi = pi_t;
#! true
#! @EndExample
