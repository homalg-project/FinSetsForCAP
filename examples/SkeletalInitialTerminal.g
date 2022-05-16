#! @Chunk SkeletalInitialTerminal

LoadPackage( "FinSetsForCAP" );

#! @Example
m := FinSet( 8 );
#! <An object in SkeletalFinSets>
IsInitial( m );
#! false
IsTerminal( m );
#! false
i := InitialObject( SkeletalFinSets );
#! <An object in SkeletalFinSets>
IsInitial( i );
#! true
IsTerminal( i );
#! false
iota := UniversalMorphismFromInitialObject( m );
#! <A morphism in SkeletalFinSets>
AsList( i );
#! [  ]
t := TerminalObject( SkeletalFinSets );
#! <An object in SkeletalFinSets>
AsList( t );
#! [ 0 ]
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
#! [ 0, 0, 0, 0, 0, 0, 0, 0 ]
pi = pi_t;
#! true
#! @EndExample
