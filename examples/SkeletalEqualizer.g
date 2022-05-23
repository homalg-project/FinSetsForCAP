#! @Chunk SkeletalEqualizer

LoadPackage( "FinSetsForCAP" );

#! @Example
S := FinSet( 5 );
#! |5|
T := FinSet( 3 );
#! |3|
f1 := MapOfFinSets( S, [ 2, 2, 0, 1, 1 ], T );
#! |5| → |3|
f2 := MapOfFinSets( S, [ 2, 1, 2, 0, 1 ], T );
#! |5| → |3|
f3 := MapOfFinSets( S, [ 2, 0, 1, 0, 1 ], T );
#! |5| → |3|
D := [ f1, f2, f3 ];;
Eq := Equalizer( D );
#! |2|
iota := EmbeddingOfEqualizer( D );
#! |2| ↪ |5|
Display( iota );
#! { 0, 1 } ⱶ[ 0, 4 ]→ { 0,..., 4 }
phi := MapOfFinSets( FinSet( 2 ), [ 4, 0 ], S );;
IsWellDefined( phi );
#! true
psi := UniversalMorphismIntoEqualizer( D, phi );
#! |2| → |2|
IsWellDefined( psi );
#! true
Display( psi );
#! { 0, 1 } ⱶ[ 1, 0 ]→ { 0, 1 }
PreCompose( psi, iota ) = phi;
#! true


D := [ f2, f3 ];
#! [ |5| → |3|, |5| → |3| ]
Eq := Equalizer( D );
#! |3|
psi := EmbeddingOfEqualizer( D );
#! |3| ↪ |5|
Display( psi );
#! { 0, 1, 2 } ⱶ[ 0, 3, 4 ]→ { 0,..., 4 }
#! @EndExample
