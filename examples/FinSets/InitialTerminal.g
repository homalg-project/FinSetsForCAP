#! @System InitialTerminal

LoadPackage( "FinSets" );

#! @Example
M := FinSet( [ 1, 2, 3 ] );
#! <An object in FinSets>
I := InitialObject( M );
#! <An object in FinSets>
iota := UniversalMorphismFromInitialObject( M );
#! <A morphism in FinSets>
Display( I );
#! [  ]
T := TerminalObject( M );
#! <An object in FinSets>
Display( T );
#! [ "*" ]
pi := UniversalMorphismIntoTerminalObject( M );
#! <A morphism in FinSets>
IsIdenticalObj( Range( pi ), T );
#! true
t := FinSet( [ "Julia" ] );
#! <An object in FinSets>
pi_t := UniversalMorphismIntoTerminalObjectWithGivenTerminalObject( M, t );
#! <A morphism in FinSets>
List( M, pi_t );
#! [ "Julia", "Julia", "Julia" ]
#! @EndExample
