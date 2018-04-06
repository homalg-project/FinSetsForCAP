#! @System SkeletalInitialTerminal

LoadPackage( "FinSets" );

#! @Example
m := FinSet( 8 );
#! <An object in SkeletalFinSets>
i := InitialObject( m );
#! <An object in SkeletalFinSets>
iota := UniversalMorphismFromInitialObject( m );
#! <A morphism in SkeletalFinSets>
AsList( i );
#! [  ]
t := TerminalObject( m );
#! <An object in SkeletalFinSets>
AsList( t );
#! [ 1 ]
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
