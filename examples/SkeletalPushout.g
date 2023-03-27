#! @Chunk SkeletalPushout

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
M := FinSet( 5 );
#! |5|
N1 := FinSet( 3 );
#! |3|
iota1 := EmbeddingOfFinSets( N1, M );
#! |3| ↪ |5|
Display( iota1 );
#! { 0, 1, 2 } ⱶ[ 0 .. 2 ]→ { 0,..., 4 }
N2 := FinSet( 2 );
#! |2|
iota2 := EmbeddingOfFinSets( N2, M );
#! |2| ↪ |5|
Display( iota2 );
#! { 0, 1 } ⱶ[ 0 .. 1 ]→ { 0,..., 4 }
D := [ iota1, iota2 ];;
Fib := FiberProduct( D );
#! |2|
pi1 := ProjectionInFactorOfFiberProduct( D, 1 );
#! |2| → |3|
Display( pi1 );
#! { 0, 1 } ⱶ[ 0, 1 ]→ { 0, 1, 2 }
pi2 := ProjectionInFactorOfFiberProduct( D, 2 );
#! |2| → |2|
Display( pi2 );
#! { 0, 1 } ⱶ[ 0, 1 ]→ { 0, 1 }
#! @EndExample

#! The easy way

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
D := [ pi1, pi2 ];;
UU := Pushout( D );
#! |3|
kappa1 := InjectionOfCofactorOfPushout( D, 1 );
#! |3| → |3|
Display( kappa1 );
#! { 0, 1, 2 } ⱶ[ 0, 1, 2 ]→ { 0, 1, 2 }
kappa2 := InjectionOfCofactorOfPushout( D, 2 );
#! |2| → |3|
Display( kappa2 );
#! { 0, 1 } ⱶ[ 0, 1 ]→ { 0, 1, 2 }
PreCompose( pi1, kappa1 ) = PreCompose( pi2, kappa2 );
#! true
#! @EndExample

#! The long way

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
Co := Coproduct( N1, N2 );
#! |5|
Display( Co );
#! { 0,..., 4 }
iota_1 := InjectionOfCofactorOfCoproduct( [ N1, N2 ], 1 );
#! |3| → |5|
Display( iota_1 );
#! { 0, 1, 2 } ⱶ[ 0 .. 2 ]→ { 0,..., 4 }
iota_2 := InjectionOfCofactorOfCoproduct( [ N1, N2 ], 2 );
#! |2| → |5|
Display( iota_2 );
#! { 0, 1 } ⱶ[ 3 .. 4 ]→ { 0,..., 4 }
alpha := PreCompose( pi1, iota_1 );
#! |2| → |5|
Display( alpha );
#! { 0, 1 } ⱶ[ 0, 1 ]→ { 0,..., 4 }
beta := PreCompose( pi2, iota_2 );
#! |2| → |5|
Display( beta );
#! { 0, 1 } ⱶ[ 3, 4 ]→ { 0,..., 4 }
Cq := Coequalizer( [ alpha, beta ] );
#! |3|
psi := ProjectionOntoCoequalizer( [ alpha, beta ] );
#! |5| → |3|
Display( psi );
#! { 0,..., 4 } ⱶ[ 0, 1, 2, 0, 1 ]→ { 0, 1, 2 }
Display( PreCompose( iota_1, psi ) );
#! { 0, 1, 2 } ⱶ[ 0, 1, 2 ]→ { 0, 1, 2 }
Display( PreCompose( iota_2, psi ) );
#! { 0, 1 } ⱶ[ 0, 1 ]→ { 0, 1, 2 }
PreCompose( alpha, psi ) = PreCompose( beta, psi );
#! true
#! @EndExample
