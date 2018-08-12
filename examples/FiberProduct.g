#! @System FiberProduct

LoadPackage( "FinSetsForCAP" );

#! @Example
M := FinSet( [ 1 .. 5 ] );
#! <An object in FinSets>
N1 := FinSet( [ 1 .. 3 ] );
#! <An object in FinSets>
iota1 := EmbeddingOfFinSets( N1, M );
#! <A monomorphism in FinSets>
N2 := FinSet( [ 2 .. 5 ] );
#! <An object in FinSets>
iota2 := EmbeddingOfFinSets( N2, M );
#! <A monomorphism in FinSets>
D := [ iota1, iota2 ];
#! [ <A monomorphism in FinSets>, <A monomorphism in FinSets> ]
int := FiberProduct( D );
#! <An object in FinSets>
Display( int );
#! [ [ 2, 2 ], [ 3, 3 ] ]
pi1 := ProjectionInFactorOfFiberProduct( D, 1 );
#! <A monomorphism in FinSets>
int1 := ImageObject( pi1 );
#! <An object in FinSets>
Display( int1 );
#! [ 2, 3 ]
pi2 := ProjectionInFactorOfFiberProduct( D, 2 );
#! <A monomorphism in FinSets>
int2 := ImageObject( pi2 );
#! <An object in FinSets>
Display( int2 );
#! [ 2, 3 ]
#! @EndExample
