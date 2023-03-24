#! @Chunk MapOfFinSetsNC

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
S := FinSetNC( [ 1, 3, 2 ] );
#! <An object in FinSets>
T := FinSetNC( [ "a", "b", "c" ] );
#! <An object in FinSets>
G := [ [ 1, "b" ], [ 3, "b" ], [ 2, "a" ] ];;
phi := MapOfFinSetsNC( S, G, T );
#! <A morphism in FinSets>
IsWellDefined( phi );
#! true
phi( 1 );
#! "b"
phi( 2 );
#! "a"
phi( 3 );
#! "b"
Display( List( S, phi ) );
#! [ "b", "b", "a" ]
psi := [ [ 1, "b" ], [ 2, "a" ], [ 3, "b" ] ];;
psi := MapOfFinSetsNC( S, psi, T );
#! <A morphism in FinSets>
IsWellDefined( psi );
#! true
phi = psi;
#! true



#! @EndExample
