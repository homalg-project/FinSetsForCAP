#! @Chunk Skeletal1Equalizer

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
S := FinSet1( 5 );
#! |5|
T := FinSet1( 3 );
#! |3|
f1 := MapOfFinSets( S, [ 3, 3, 1, 2, 2 ], T );
#! |5| → |3|
f2 := MapOfFinSets( S, [ 3, 2, 3, 1, 2 ], T );
#! |5| → |3|
f3 := MapOfFinSets( S, [ 3, 1, 2, 1, 2 ], T );
#! |5| → |3|
D := [ f1, f2, f3 ];;
Eq := Equalizer( D );
#! |2|
iota := EmbeddingOfEqualizer( D );
#! |2| → |5|
Display( iota );
#! { 1, 2 } ⱶ[ 1, 5 ]→ { 1,..., 5 }
phi := MapOfFinSets( FinSet1( 2 ), [ 5, 1 ], S );;
IsWellDefined( phi );
#! true
psi := UniversalMorphismIntoEqualizer( D, phi );
#! |2| → |2|
IsWellDefined( psi );
#! true
Display( psi );
#! { 1, 2 } ⱶ[ 2, 1 ]→ { 1, 2 }
PreCompose( psi, iota ) = phi;
#! true


D := [ f2, f3 ];;
Eq := Equalizer( D );
#! |3|
psi := EmbeddingOfEqualizer( D );
#! |3| → |5|
Display( psi );
#! { 1, 2, 3 } ⱶ[ 1, 4, 5 ]→ { 1,..., 5 }
#! @EndExample
