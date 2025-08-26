#! @Chunk Limit

LoadPackage( "FinSetsForCAP" );

#! @Example
m := FinSet( [ 1 .. 3 ] );
#! <An object in FinSets>
f := MapOfFinSets( m, [ [ 1, 3 ], [ 2, 2 ], [ 3, 1 ] ], m );
#! <A morphism in FinSets>
l := Limit( [ m ], [ [ 1, f, 1 ] ] );
#! <An object in FinSets>
Display( l );
#! [ [ 2 ] ]
e := ProjectionInFactorOfLimit( [ m ], [ [ 1, f, 1 ] ], 1 );
#! <A morphism in FinSets>
Display( e );
#! [ [ [ 2 ] ], [ [ [ 2 ], 2 ] ], [ 1 .. 3 ] ]
#! @EndExample
