#! @Chunk Skeletal1SingletonMorphism

#! @Example
LoadPackage( "FinSetsForCAP" );
#! true
a := FinSet1( 3 );
#! |3|
sa := SingletonMorphism( a );;
Display( sa );
#! { 1, 2, 3 } ⱶ[ 2, 3, 5 ]→ { 1,..., 8 }
sa = LowerSegmentOfRelation( a, a, CartesianDiagonal( a, 2 ) );
#! true
sa = UpperSegmentOfRelation( a, a, CartesianDiagonal( a, 2 ) );
#! true
#! @EndExample
