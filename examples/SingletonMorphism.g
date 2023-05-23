#! @Chunk SingletonMorphism

#! @Example
LoadPackage( "FinSetsForCAP" );
#! true
a := FinSet( [ 1, 2, 3 ] );
#! <An object in FinSets>
sa := SingletonMorphism( a );
#! <A monomorphism in FinSets>
sa = LowerSegmentOfRelation( a, a, CartesianDiagonal( a, 2 ) );
#! true
sa = UpperSegmentOfRelation( a, a, CartesianDiagonal( a, 2 ) );
#! true
#! @EndExample
