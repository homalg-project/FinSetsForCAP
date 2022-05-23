#! @Chunk SkeletalCoequalizer

LoadPackage( "FinSetsForCAP" );

#! @Example
s := FinSet( 5 );
#! |5|
t := FinSet( 4 );
#! |4|
f := MapOfFinSets( s, [ 2, 3, 3, 1, 3 ], t );
#! |5| → |4|
g := MapOfFinSets( s, [ 2, 2, 3, 1, 3 ], t );
#! |5| → |4|
D := [ f, g ];
#! [ |5| → |4|, |5| → |4| ]
C := Coequalizer( D );
#! |3|
pi := ProjectionOntoCoequalizer( D );
#! |4| ↠ |3|
Display( pi );
#! { 0,..., 3 } ⱶ[ 0, 1, 2, 2 ]→ { 0, 1, 2 }
tau := MapOfFinSets( t, [ 1, 0, 1, 1 ], FinSet( 2 ) );
#! |4| → |2|
phi := UniversalMorphismFromCoequalizer( D, tau );
#! |3| → |2|
Display( phi );
#! { 0, 1, 2 } ⱶ[ 1, 0, 1 ]→ { 0, 1 }
PreCompose( pi, phi ) = tau;
#! true

s := FinSet( 5 );
#! |5|
t := FinSet( 4 );
#! |4|
f := MapOfFinSets( s, [ 1, 2, 2, 1, 3 ], t );
#! |5| → |4|
g := MapOfFinSets( s, [ 1, 2, 1, 1, 3 ], t );
#! |5| → |4|
D := [ f, g ];
#! [ |5| → |4|, |5| → |4| ]
C := Coequalizer( D );
#! |3|
pi := ProjectionOntoCoequalizer( D );
#! |4| ↠ |3|
Display( pi );
#! { 0,..., 3 } ⱶ[ 0, 1, 1, 2 ]→ { 0, 1, 2 }
PreCompose( f, pi ) = PreCompose( g, pi );
#! true
tau := MapOfFinSets( t, [ 0, 1, 1, 0 ], FinSet( 2 ) );
#! |4| → |2|
phi := UniversalMorphismFromCoequalizer( D, tau );
#! |3| → |2|
Display( phi );
#! { 0, 1, 2 } ⱶ[ 0, 1, 0 ]→ { 0, 1 }
PreCompose( pi, phi ) = tau;
#! true

s := FinSet( 2 );;
t := FinSet( 3 );;
f := MapOfFinSets( s, [ 0, 1 ], t );;
IsWellDefined( f );
#! true
g := MapOfFinSets( s, [ 1, 2 ], t );;
IsWellDefined( g );
#! true
C := Coequalizer( [ f, g ] );
#! |1|
#! @EndExample
