#! @Chunk CoimageObject

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
S := FinSet( [ 1, 2, 3 ] );
#! <An object in FinSets>
T := FinSet( [ "a", "b", "c" ] );
#! <An object in FinSets>
phi := [ [ 1, "b" ], [ 2, "a" ], [ 3, "b" ] ];;
phi := MapOfFinSets( S, phi, T );
#! <A morphism in FinSets>
I := CoimageObject( phi );
#! <An object in FinSets>
Length( I );
#! 2
IsMonomorphism( phi );
#! false
IsSplitMonomorphism( phi );
#! false
IsEpimorphism( phi );
#! false
IsSplitEpimorphism( phi );
#! false
iota := AstrictionToCoimage( phi );
#! <A morphism in FinSets>
pi := CoimageProjection( phi );
#! <An epimorphism in FinSets>
PreCompose( pi, iota ) = phi;
#! true
#! @EndExample
