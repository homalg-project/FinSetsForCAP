#! @Chunk Skeletal1Coequalizer

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
s := FinSet1( 5 );
#! |5|
t := FinSet1( 4 );
#! |4|
f := MapOfFinSets( s, [ 3, 4, 4, 2, 4 ], t );
#! |5| → |4|
g := MapOfFinSets( s, [ 3, 3, 4, 2, 4 ], t );
#! |5| → |4|
D := [ f, g ];;
C := Coequalizer( D );
#! |3|
pi := ProjectionOntoCoequalizer( D );
#! |4| → |3|
Display( pi );
#! { 1,..., 4 } ⱶ[ 1, 2, 3, 3 ]→ { 1, 2, 3 }
tau := MapOfFinSets( t, [ 2, 1, 2, 2 ], FinSet1( 2 ) );
#! |4| → |2|
phi := UniversalMorphismFromCoequalizer( D, tau );
#! |3| → |2|
Display( phi );
#! { 1, 2, 3 } ⱶ[ 2, 1, 2 ]→ { 1, 2 }
PreCompose( pi, phi ) = tau;
#! true

s := FinSet1( 5 );
#! |5|
t := FinSet1( 4 );
#! |4|
f := MapOfFinSets( s, [ 2, 3, 3, 2, 4 ], t );
#! |5| → |4|
g := MapOfFinSets( s, [ 2, 3, 2, 2, 4 ], t );
#! |5| → |4|
D := [ f, g ];;
C := Coequalizer( D );
#! |3|
pi := ProjectionOntoCoequalizer( D );
#! |4| → |3|
Display( pi );
#! { 1,..., 4 } ⱶ[ 1, 2, 2, 3 ]→ { 1, 2, 3 }
PreCompose( f, pi ) = PreCompose( g, pi );
#! true
tau := MapOfFinSets( t, [ 1, 2, 2, 1 ], FinSet1( 2 ) );
#! |4| → |2|
phi := UniversalMorphismFromCoequalizer( D, tau );
#! |3| → |2|
Display( phi );
#! { 1, 2, 3 } ⱶ[ 1, 2, 1 ]→ { 1, 2 }
PreCompose( pi, phi ) = tau;
#! true

s := FinSet1( 2 );;
t := FinSet1( 3 );;
f := MapOfFinSets( s, [ 1, 2 ], t );;
IsWellDefined( f );
#! true
g := MapOfFinSets( s, [ 2, 3 ], t );;
IsWellDefined( g );
#! true
C := Coequalizer( [ f, g ] );
#! |1|
#! @EndExample
