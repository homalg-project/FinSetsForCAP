#! @System Pushout

LoadPackage( "FinSets" );

#! @Example
M := FinSet( 5 );
#! <An object in SkeletalFinSets>
N1 := FinSet( 3 );
#! <An object in SkeletalFinSets>
iota1 := EmbeddingOfFinSets( N1, M );
#! <A mono morphism in SkeletalFinSets>
Display( iota1 );
#! [ 3, [ 1, 2, 3 ], 5 ]
N2 := FinSet( 2 );
#! <An object in SkeletalFinSets>
iota2 := EmbeddingOfFinSets( N2, M );
#! <A mono morphism in SkeletalFinSets>
Display( iota2 );
#! [ 2, [ 1, 2 ], 5 ]
D := [ iota1, iota2 ];
#! [ <A mono morphism in SkeletalFinSets>, <A mono morphism in SkeletalFinSets> ]
Fib := FiberProduct( D );
#! <An object in SkeletalFinSets>
Display( Fib );
#! 2
pi1 := ProjectionInFactorOfFiberProduct( D, 1 );
#! <A monomorphism in SkeletalFinSets>
Display( pi1 );
#! [ 2, [ 1, 2 ], 3 ]
pi2 := ProjectionInFactorOfFiberProduct( D, 2 );
#! <A monomorphism in SkeletalFinSets>
Display( pi2 );
#! [ 2, [ 1, 2 ], 2 ]

## The easy way

D := [pi1, pi2];
#! [ <A mono morphism in SkeletalFinSets>, <A mono morphism in SkeletalFinSets> ]
UU := Pushout( D );
#! <An object in SkeletalFinSets>
Display( UU );
#! 5
kappa1 := InjectionOfCofactorOfPushout( D, 1 );
#! <A morphism in SkeletalFinSets>
Display( kappa1 );
#! [ 3, [ 1, 2, 3 ], 3 ]
kappa2 := InjectionOfCofactorOfPushout( D, 2 );
#! <A morphism in SkeletalFinSets>
Display( kappa2 );
#! [ 2, [ 1, 2 ], 3 ]
PreCompose( pi1, kappa1 ) = PreCompose( pi2, kappa2 );
#! true

## The long way

Co := Coproduct( N1, N2 );
#! <An object in SkeletalFinSets>
Display( Co );
#! 5
iota_1 := InjectionOfCofactorOfCoproduct( [ N1, N2 ], 1 );
#! <A morphism in SkeletalFinSets>
Display( iota_1 );
#! [ 3, [ 1, 2, 3 ], 5 ]
iota_2 := InjectionOfCofactorOfCoproduct( [ N1, N2 ], 2 );
#! <A morphism in SkeletalFinSets>
Display( iota_2 );
#! [ 2, [ 4, 5 ], 5 ]
alpha := PreCompose( pi1, iota_1 );
#! <A morphism in SkeletalFinSets>
Display( alpha );
#! [ 2, [ 1, 2 ], 5 ]
beta := PreCompose( pi2, iota_2 );
#! <A morphism in SkeletalFinSets>
Display( beta );
#! [ 2, [ 4, 5 ], 5 ]
Cq := Coequalizer( [ alpha, beta ] );
#! <An object in SkeletalFinSets>
Display( Cq );
#! 3
psi := ProjectionOntoCoequalizer( [ alpha, beta ] );
#! <A morphism in SkeletalFinSets>
Display( psi );
#!  5, [ 1, 2, 3, 1, 2 ], 3 ]
Display( PreCompose( iota_1, psi ) );
#! [ 3, [ 1, 2, 3 ], 3 ] ## kappa1
Display( PreCompose( iota_2, psi ) );
#! [ 2, [ 1, 2 ], 3 ] ## kappa2
PreCompose( alpha, psi ) = PreCompose( beta, psi );
#! true
#! @EndExample