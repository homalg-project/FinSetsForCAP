s3 := SymmetricGroup( 3 );
#! Sym( [ 1 .. 3 ] )
w1 := GSet( s3, [ 1, 2, 0, 0 ] );
#! <An object in Skeletal Category of -Sets>
w2 := GSet( s3, [ 0, 1, 0, 1 ] );
#! <An object in Skeletal Category of -Sets>
pi1 := MapOfGSets( w1, [ [ [ 1, (2,3), 2 ] ], [ [ 1, (), 4 ], [ 1, (1,2), 2 ] ], [], [] ], w2 );
#! <A morphism in Skeletal Category of -Sets>
pi2 := MapOfGSets( w1, [ [ [ 1, (), 2 ] ], [ [ 1, (), 4 ], [ 1, (1,2,3), 2 ] ], [], [] ], w2 );
#! <A morphism in Skeletal Category of -Sets>
pi1 = pi2;
#! true 
# BUT
AsList( pi1 ) = AsList( pi2 );
#! false
