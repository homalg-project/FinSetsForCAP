#! @Chunk Skeletal1Pushout

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
M := FinSet1( 5 );
#! |5|
N1 := FinSet1( 3 );
#! |3|
iota1 := EmbeddingOfFinSets( N1, M );
#! |3| ↪ |5|
Display( iota1 );
#! { 1, 2, 3 } ⱶ[ 1 .. 3 ]→ { 1,..., 5 }
N2 := FinSet1( 2 );
#! |2|
iota2 := EmbeddingOfFinSets( N2, M );
#! |2| ↪ |5|
Display( iota2 );
#! { 1, 2 } ⱶ[ 1 .. 2 ]→ { 1,..., 5 }
D := [ iota1, iota2 ];;
Fib := FiberProduct( D );
#! |2|
pi1 := ProjectionInFactorOfFiberProduct( D, 1 );
#! |2| → |3|
Display( pi1 );
#! { 1, 2 } ⱶ[ 1, 2 ]→ { 1, 2, 3 }
pi2 := ProjectionInFactorOfFiberProduct( D, 2 );
#! |2| → |2|
Display( pi2 );
#! { 1, 2 } ⱶ[ 1, 2 ]→ { 1, 2 }
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
#! { 1, 2, 3 } ⱶ[ 1, 2, 3 ]→ { 1, 2, 3 }
kappa2 := InjectionOfCofactorOfPushout( D, 2 );
#! |2| → |3|
Display( kappa2 );
#! { 1, 2 } ⱶ[ 1, 2 ]→ { 1, 2, 3 }
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
#! { 1,..., 5 }
iota_1 := InjectionOfCofactorOfCoproduct( [ N1, N2 ], 1 );
#! |3| → |5|
Display( iota_1 );
#! { 1, 2, 3 } ⱶ[ 1, 2, 3 ]→ { 1,..., 5 }
iota_2 := InjectionOfCofactorOfCoproduct( [ N1, N2 ], 2 );
#! |2| → |5|
Display( iota_2 );
#! { 1, 2 } ⱶ[ 4, 5 ]→ { 1,..., 5 }
alpha := PreCompose( pi1, iota_1 );
#! |2| → |5|
Display( alpha );
#! { 1, 2 } ⱶ[ 1, 2 ]→ { 1,..., 5 }
beta := PreCompose( pi2, iota_2 );
#! |2| → |5|
Display( beta );
#! { 1, 2 } ⱶ[ 4, 5 ]→ { 1,..., 5 }
Cq := Coequalizer( [ alpha, beta ] );
#! |3|
psi := ProjectionOntoCoequalizer( [ alpha, beta ] );
#! |5| → |3|
Display( psi );
#! { 1,..., 5 } ⱶ[ 1, 2, 3, 1, 2 ]→ { 1, 2, 3 }
Display( PreCompose( iota_1, psi ) );
#! { 1, 2, 3 } ⱶ[ 1, 2, 3 ]→ { 1, 2, 3 }
Display( PreCompose( iota_2, psi ) );
#! { 1, 2 } ⱶ[ 1, 2 ]→ { 1, 2, 3 }
PreCompose( alpha, psi ) = PreCompose( beta, psi );
#! true
#! @EndExample
