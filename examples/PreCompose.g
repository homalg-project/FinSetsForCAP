#! @Chunk PreCompose

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
S := FinSet( [ 1, 2, 3 ] );
#! <An object in FinSets>
T := FinSet( [ "a", "b" ] );
#! <An object in FinSets>
phi := [ [ 1, "b" ], [ 2, "a" ], [ 3, "b" ] ];;
phi := MapOfFinSets( S, phi, T );
#! <A morphism in FinSets>
psi := [ [ "a", 3 ], [ "b", 1 ] ];;
psi := MapOfFinSets( T, psi, S );
#! <A morphism in FinSets>
alpha := PreCompose( phi, psi );
#! <A morphism in FinSets>
Display( List( S, alpha ) );
#! [ 1, 3, 1 ]
IsOne( alpha );
#! false
#! @EndExample
