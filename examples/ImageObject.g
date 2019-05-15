#! @Chunk ImageObject

LoadPackage( "FinSetsForCAP" );

#! @Example
S := FinSet( [ 1, 2, 3 ] );
#! <An object in FinSets>
T := FinSet( [ "a", "b", "c" ] );
#! <An object in FinSets>
phi := [ [ 1, "b" ], [ 2, "a" ], [ 3, "b" ] ];;
phi := MapOfFinSets( S, phi, T );
#! <A morphism in FinSets>
I := ImageObject( phi );
#! <An object in FinSets>
Length( I );
#! 2
IsMonomorphism( phi );
#! false
IsEpimorphism( phi );
#! false
iota := ImageEmbedding( phi );
#! <A monomorphism in FinSets>
pi := CoastrictionToImage( phi );
#! <An epimorphism in FinSets>
PreCompose( pi, iota ) = phi;
#! true
#! @EndExample
