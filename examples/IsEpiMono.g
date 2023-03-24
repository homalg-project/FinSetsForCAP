#! @Chunk IsEpiMono

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
S := FinSet( [ 1, 2, 3 ] );
#! <An object in FinSets>
T := S;
#! <An object in FinSets>
phi := [ [ 1, 2 ], [ 2, 3 ], [ 3, 1 ] ];;
phi := MapOfFinSets( S, phi, T );
#! <A morphism in FinSets>
I := ImageObject( phi );
#! <An object in FinSets>
Length( I );
#! 3
IsMonomorphism( phi );
#! true
IsSplitMonomorphism( phi );
#! true
IsEpimorphism( phi );
#! true
IsSplitEpimorphism( phi );
#! true
iota := ImageEmbedding( phi );
#! <A monomorphism in FinSets>
pi := CoastrictionToImage( phi );
#! <An epimorphism in FinSets>
PreCompose( pi, iota ) = phi;
#! true
#! @EndExample
