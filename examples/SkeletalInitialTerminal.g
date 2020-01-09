#! @Chunk SkeletalInitialTerminal

LoadPackage( "FinSetsForCAP" );

#! @Example
m := FinSet( 8 );
#! <An object in SkeletalFinSets>
IsInitial( m );
#! false
IsTerminal( m );
#! false
i := InitialObject( m );
#! <An object in SkeletalFinSets>
IsInitial( i );
#! true
IsTerminal( i );
#! false
iota := UniversalMorphismFromInitialObject( m );
#! <A morphism in SkeletalFinSets>
AsList( i );
#! [  ]
t := TerminalObject( m );
#! <An object in SkeletalFinSets>
AsList( t );
#! [ 1 ]
IsInitial( t );
#! false
IsTerminal( t );
#! true
pi := UniversalMorphismIntoTerminalObject( m );
#! <A morphism in SkeletalFinSets>
IsIdenticalObj( Range( pi ), t );
#! true
pi_t := UniversalMorphismIntoTerminalObjectWithGivenTerminalObject( m, t );
#! <A morphism in SkeletalFinSets>
AsList( pi_t );
#! [ 1, 1, 1, 1, 1, 1, 1, 1 ]
pi = pi_t;
#! true
#! @EndExample
