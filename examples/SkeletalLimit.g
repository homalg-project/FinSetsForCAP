#! @Chunk SkeletalLimit

LoadPackage( "FinSetsForCAP" );

#! @Example
m := FinSet( 3 );
#! <An object in SkeletalFinSets>
f := MapOfFinSets( m, [ 3, 2, 1 ], m );
#! <A morphism in SkeletalFinSets>
l := Limit( [ m ], [ [ 1, f, 1 ] ] );
#! <An object in SkeletalFinSets>
Display( l );
#! 1
e := ProjectionInFactorOfLimit( [ m ], [ [ 1, f, 1 ] ], 1 );
#! <A morphism in SkeletalFinSets>
Display( e );
#! [ 1, [ 2 ], 3 ]
#! @EndExample
