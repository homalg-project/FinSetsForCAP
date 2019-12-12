#! @Chunk Sort

LoadPackage( "FinSetsForCAP" );

#! @Example
S := FinSet( [ 1, 2, 3 ] );
#! <An object in FinSets>
T := FinSet( [ "a", "b", "c" ] );
#! <An object in FinSets>
M := FinSet( [ T, S ] );
#! <An object in FinSets>
AsList( M ) = [ S, T ];
#! true
phi := [ [ 1, "b" ], [ 2, "a" ], [ 3, "b" ] ];;
phi := MapOfFinSets( S, phi, T );
#! <A morphism in FinSets>
iota := ImageEmbedding( phi );
#! <A monomorphism in FinSets>
pi := CoastrictionToImage( phi );
#! <An epimorphism in FinSets>
P := FinSet( [ phi, iota, pi ] );
#! <An object in FinSets>
AsList( P ) = [ phi, pi, iota ];
#! true
#! @EndExample
