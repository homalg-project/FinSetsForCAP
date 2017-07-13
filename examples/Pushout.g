#! @System Pushout

LoadPackage( "FinSets" );

#! @Example
M := FinSet( [ 1 .. 5 ] );
#! <An object in FinSets>
N1 := FinSet( [ 1, 2, 4 ] );
#! <An object in FinSets>
iota1 := EmbeddingOfFinSets( N1, M );
#! <A monomorphism in FinSets>
N2 := FinSet( [ 2, 3 ] );
#! <An object in FinSets>
iota2 := EmbeddingOfFinSets( N2, M );
#! <A monomorphism in FinSets>
D := [ iota1, iota2 ];
#! [ <A monomorphism in FinSets>, <A monomorphism in FinSets> ]
int := FiberProduct( D );
#! <An object in FinSets>
pi1 := ProjectionInFactorOfFiberProduct( D, 1 );
#! <A monomorphism in FinSets>
pi2 := ProjectionInFactorOfFiberProduct( D, 2 );
#! <A monomorphism in FinSets>
UU := Pushout( pi1, pi2 );
#! <An object in FinSets>
Display( UU );
#! [ [ [ 1, 1 ] ], [ [ 1, 2 ], [ 2, 2 ] ], [ [ 1, 4 ] ], [ [ 2, 3 ] ] ]
iota := UniversalMorphismFromPushout( [ pi1, pi2 ], [ iota1, iota2 ] );
#! <A morphism in FinSets>
U := ImageObject( iota );
#! <An object in FinSets>
Display( U );
#! [ 1, 2, 3, 4 ]
Union( N1, N2 ) = U;
#! true
#! @EndExample
