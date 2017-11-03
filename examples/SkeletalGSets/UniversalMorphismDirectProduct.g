s3 := SymmetricGroup( 3 );
#! Sym( [ 1 .. 3 ] )
M := GSet( s3, [1, 2, 0, 0]);
#! <An object in Skeletal Category of -Sets>
N := GSet( s3, [1, 0, 1, 2]);
#! <An object in Skeletal Category of -Sets>
D:= [M, N];
#! [ <An object in Skeletal Category of -Sets>, <An object in Skeletal Category of -Sets> ]
tau1 := ProjectionInFactorOfDirectProduct( D, 1 );
#! <A morphism in Skeletal Category of -Sets>
tau2 := ProjectionInFactorOfDirectProduct( D, 2 );
#! <A morphism in Skeletal Category of -Sets>
tau := [tau1, tau2];
#! [ <A morphism in Skeletal Category of -Sets>, <A morphism in Skeletal Category of -Sets> ]
UniversalMorphismIntoDirectProduct( D, tau );
#! <A morphism in Skeletal Category of -Sets>
IsWellDefined( UniversalMorphismIntoDirectProduct( D, tau ) );
#! true
AsList( UniversalMorphismIntoDirectProduct( D, tau ));
#! [ [ [ 1, (), 1 ], [ 2, (), 1 ], [ 3, (), 1 ], [ 4, (), 1 ], [ 5, (), 1 ], [ 6, (), 1 ], [ 7, (), 1 ], [ 8, (), 1 ],
      [ 9, (), 1 ], [ 10, (), 1 ], [ 11, (), 1 ], [ 12, (), 1 ], [ 13, (), 1 ], [ 14, (), 1 ], [ 15, (), 1 ],
      [ 16, (), 1 ], [ 17, (), 1 ], [ 18, (), 1 ] ], [ [ 1, (), 2 ], [ 2, (), 2 ], [ 3, (), 2 ], [ 4, (), 2 ] ],
  [  ], [  ] ]
