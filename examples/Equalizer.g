#! @System Equalizer

LoadPackage( "FinSetsForCAP" );

#! @Example
S := FinSet( [ 1 .. 5 ] );
#! <An object in FinSets>
T := FinSet( [ 1 .. 3 ] );
#! <An object in FinSets>
f1 := MapOfFinSets( S, [ [1,3],[2,3],[3,1],[4,2],[5,2] ], T );
#! <A morphism in FinSets>
f2 := MapOfFinSets( S, [ [1,3],[2,2],[3,3],[4,1],[5,2] ], T );
#! <A morphism in FinSets>
f3 := MapOfFinSets( S, [ [1,3],[2,1],[3,2],[4,1],[5,2] ], T );
#! <A morphism in FinSets>
D := [ f1, f2, f3 ];
#! [ <A morphism in FinSets>, <A morphism in FinSets>, <A morphism in FinSets> ]
Eq := Equalizer( D );
#! <An object in FinSets>
Display( Eq );
#! [ 1, 5 ]
iota := EmbeddingOfEqualizer( D );;
IsWellDefined( iota );
#! true
Im := ImageObject( iota );
#! <An object in FinSets>
Display( Im );
#! [ 1, 5 ]
M := FinSet( [ "a" ] );;
phi := MapOfFinSets( M, [ [ "a", 5 ] ], S );;
IsWellDefined( phi );
#! true
psi := UniversalMorphismIntoEqualizer( D, phi );
#! <A morphism in FinSets>
IsWellDefined( psi );
#! true
Display( psi );
#! [ [ "a" ], [ [ "a", 5 ] ], [ 1, 5 ] ]
PreCompose( psi, iota ) = phi;
#! true
#! @EndExample
