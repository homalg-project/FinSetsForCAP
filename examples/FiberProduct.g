#! @System FiberProduct

LoadPackage( "FinSets" );

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
#! [ [  2,  2 ],
#!   [  3,  3 ] ]
#! @EndExample
