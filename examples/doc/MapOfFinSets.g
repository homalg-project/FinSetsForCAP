#! @System MapOfFinSets

LoadPackage( "FinSetsForCAP" );

#! @Example
S := FinSet( [ 1, 3, 2, 2, 1 ] );
#! <An object in FinSets>
T := FinSet( [ "a", "b", "c" ] );
#! <An object in FinSets>
G := [ [ 1, "b" ], [ 3, "b" ], [ 2, "a" ] ];;
phi := MapOfFinSets( S, G, T );
#! <A morphism in FinSets>
IsWellDefined( phi );
#! true
phi( 1 );
#! "b"
phi( 2 );
#! "a"
phi( 3 );
#! "b"
List( S, phi );
#! [ "b", "a", "b" ]
psi := [ [ 1, "b" ], [ 2, "a" ], [ 3, "b" ] ];;
psi := MapOfFinSets( S, psi, T );
#! <A morphism in FinSets>
IsWellDefined( psi );
#! true
phi = psi;
#! true

psi := MapOfFinSetsNC( S, [ , [ 1, "b" ], [ 3, "b" ], [ 2, "a" ] ], T );
#! <A morphism in FinSets>
IsWellDefined( psi );
#! false
psi := MapOfFinSets( S, [ [ 1, "d" ], [ 3, "b" ] ], T );
#! <A morphism in FinSets>
IsWellDefined( psi );
#! false
psi := MapOfFinSets( S, [ 1, 2, 3 ], T );
#! <A morphism in FinSets>
IsWellDefined( psi );
#! false
psi := MapOfFinSets( S, [ [ 1, "b" ], [ 3, "b" ], [ 2, "a", "b" ] ], T );
#! <A morphism in FinSets>
IsWellDefined( psi );
#! false
psi := MapOfFinSets( S, [ [ 5, "b" ], [ 3, "b" ], [ 2, "a" ] ], T );
#! <A morphism in FinSets>
IsWellDefined( psi );
#! false
psi := MapOfFinSets( S, [ [ 1, "d" ], [ 3, "b" ], [ 2, "a" ] ], T );
#! <A morphism in FinSets>
IsWellDefined( psi );
#! false
psi := MapOfFinSets( S, [ [ 1, "b" ], [ 2, "b" ], [ 2, "a" ] ], T );
#! <A morphism in FinSets>
IsWellDefined( psi );
#! false

#! @EndExample
