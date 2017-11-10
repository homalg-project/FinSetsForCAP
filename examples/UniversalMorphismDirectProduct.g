#! @System UniversalMorphismDirectProduct

LoadPackage( "FinSets" );

#! @Example
S3 := SymmetricGroup( 3 );
#! Sym( [ 1 .. 3 ] )

A := GSet( S3, [0, 1, 0, 0] );
#! <An object in Skeletal Category of G-Sets>
B := GSet( S3, [0, 1, 0, 0] );
#! <An object in Skeletal Category of G-Sets>
pi1 := ProjectionInFactorOfDirectProduct( [ A, B ], 1 );
#! <A morphism in Skeletal Category of G-Sets>
pi2 := ProjectionInFactorOfDirectProduct( [ A, B ], 2 );
#! <A morphism in Skeletal Category of G-Sets>
AsList(pi1);
#! [ [ [ 1, (), 2 ] ], [ [ 1, (), 2 ] ], [  ], [  ] ]
AsList(pi2);
#! [ [ [ 1, (1,3), 2 ] ], [ [ 1, (), 2 ] ], [  ], [  ] ]


M := GSet( S3, [1, 2, 0, 0]);
#! <An object in Skeletal Category of G-Sets>
N := GSet( S3, [1, 0, 1, 2]);
#! <An object in Skeletal Category of G-Sets>
D:= [M, N];
#! [ <An object in Skeletal Category of G-Sets>, 
#!   <An object in Skeletal Category of G-Sets> ]
tau1 := ProjectionInFactorOfDirectProduct( D, 1 );
#! <A morphism in Skeletal Category of G-Sets>
tau2 := ProjectionInFactorOfDirectProduct( D, 2 );
#! <A morphism in Skeletal Category of G-Sets>
tau := [tau1, tau2];
#! [ <A morphism in Skeletal Category of G-Sets>, <A morphism in Skeletal Category of G-Sets> ]
UniversalMorphismIntoDirectProduct( D, tau );
#! <A morphism in Skeletal Category of G-Sets>
IsWellDefined( UniversalMorphismIntoDirectProduct( D, tau ) );
#! true
AsList( UniversalMorphismIntoDirectProduct( D, tau ));
#! [ [ [ 1, (), 1 ], [ 2, (), 1 ], [ 3, (), 1 ], [ 4, (), 1 ], [ 5, (), 1 ], [ 6, (), 1 ], [ 7, (), 1 ], [ 8, (), 1 ],
#!      [ 9, (), 1 ], [ 10, (), 1 ], [ 11, (), 1 ], [ 12, (), 1 ], [ 13, (), 1 ], [ 14, (), 1 ], [ 15, (), 1 ],
#!      [ 16, (), 1 ], [ 17, (), 1 ], [ 18, (), 1 ] ], [ [ 1, (), 2 ], [ 2, (), 2 ], [ 3, (), 2 ], [ 4, (), 2 ] ],
#!  [  ], [  ] ]

L := GSet( S3, [ 2, 1, 0, 1 ] );
#! <An object in Skeletal Category of G-Sets>
D:= [M, N, L];
#! [ <An object in Skeletal Category of G-Sets>,
#!   <An object in Skeletal Category of G-Sets>, 
#!   <An object in Skeletal Category of G-Sets> ]


#! @EndExample
