#! @System Objects

LoadPackage( "FinSets" );

#! @Example
m := FinSet( 7 );
#!<An object in SkeletalFinSets>
IsWellDefined( m );
#!true
n := FinSet( -2 );
#!<An object in SkeletalFinSets>
IsWellDefined( n );
#!false
n := FinSet( 3 );
#!<An object in SkeletalFinSets>
IsWellDefined( n );
#!true
p := FinSet( 4 );
#!<An object in SkeletalFinSets>
IsWellDefined( p );
#!true
#! @EndExample



#! @System Morphisms

LoadPackage( "FinSets" );

#! @Example
s := FinSet( 3 );
#!<An object in SkeletalFinSets>
t := FinSet( 7 );
#!<An object in SkeletalFinSets>
phi := MapOfFinSets( s, [7, 5, 5] ,t );
#!<A morphisms in SkeletalFinSets>
IsWellDefined( phi );
#!true
Display( phi );
#![ 3, [ 7, 5, 5 ], 7 ]
#! @EndExample



#! @System WellDefined

LoadPackage( "FinSets" );

#! @Example
s := FinSet( 7 );
#! <An object in SkeletalFinSets>
t := FinSet( 4 );
#! <An object in SkeletalFinSets>
psi := MapOfFinSets( s, [1, 3, 2, 3, 2, 4] ,t );
#! <A morphisms in SkeletalFinSets>
IsWellDefined( psi );
#! false
psi := MapOfFinSets( s, [2, 3, 2, 5, 3, 2, 4] ,t );
#! <A morphisms in SkeletalFinSets>
IsWellDefined( psi );
#! false
			IsEpimorphism( psi );
			#! true		##Is that a problem? ##says it's an epi although not welldefined! ##
psi:= MapOfFinSets( s, [1, 3, 2, 4, 3, 2, 4] ,t );
#! <A morphisms in SkeletalFinSets>
IsWellDefined( psi );
#! true
#! @EndExample



#! @System EqualForMorphisms

LoadPackage( "FinSets" );

#! @Example
psi = phi;
#!false
#! @EndExample



#! @System PreCompose

LoadPackage( "FinSets" );

#! @Example
m := FinSet( 3 );
#!<An object in SkeletalFinSets>
n := FinSet( 5 );
#!<An object in SkeletalFinSets>
p := FinSet( 7 );
#!<An object in SkeletalFinSets>
psi := MapOfFinSets( m, [2, 5, 3], n );
#!<A morphism in SkeletalFinSets>
phi := MapOfFinSets( n, [1, 4, 6, 6, 3], p );
#!<A morphism in SkeletalFinSets>
PreCompose( psi, phi );
#!<A morphism in SkeletalFinSets>
alpha := PreCompose( psi, phi );
#!<A morphism in SkeletalFinSets>
Display( alpha );
#![ 3, [ 4, 3, 6 ], 7 ]
#! @EndExample



#! @System MonoEpi

LoadPackage( "FinSets" );

#! @Example
psi := MapOfFinSets( p, [1, 3, 5, 6] ,m );
#!<A morphism in SkeletalFinSets>
IsEpimorphism( psi );
#!false
IsMonomorphism( psi );
#!true
psi := MapOfFinSets( m, [1, 3, 2, 3, 4, 2, 4] ,p );
#!<A morphism in SkeletalFinSets>
IsEpimorphism( psi );
#!true
#! @EndExample



#! @System ImageObject

LoadPackage( "FinSets" );

#! @Example
m := FinSet( 7 );
#!<An object in SkeletalFinSets>
n := FinSet( 3 );
#!<An object in SkeletalFinSets>
phi := MapOfFinSets( n, [7, 5, 5] ,m );
#!<A morphisms in SkeletalFinSets>
IsWellDefined( phi );
#!true
ImageObject( phi );
#!<An object in SkeletalFinSets>
Length( ImageObject( phi ) );
#!2
s:=FinSet( 2 );
#!<An object in SkeletalFinSets>
I := ImageObject( phi, s );
#!<An object in SkeletalFinSets>
Length( I );
#!2
#! @EndExample



#! @System ImageEmbedding

LoadPackage( "FinSets" );

#! @Example
m := FinSet( 7 );
#!<An object in SkeletalFinSets>
n := FinSet( 3 );
#!<An object in SkeletalFinSets>
phi := MapOfFinSets( n, [7, 5, 5] ,m );
#!<A morphisms in SkeletalFinSets>
pi := ImageEmbedding( phi );
#!<A mono morphism in SkeletalFinSets>
Display( pi );
#! [ 2, [ 1, 2 ], 7 ]
#! @EndExample
 


#! @System Preimage

LoadPackage( "FinSets" );

#! @Example
m := FinSet( 7 );
#!<An object in SkeletalFinSets>
n := FinSet( 3 );
#!<An object in SkeletalFinSets>
phi := MapOfFinSets( n, [7, 5, 5] ,m );
#!<A morphism in SkeletalFinSets>
P := Preimage( phi, [2] );
#! [  ]
P := Preimage( phi, Set( FinSet( 5 ) ) );
#! [ 2, 3 ]
#! @EndExample



#! @System InitialTerminal

LoadPackage( "FinSets" );

#! @Example
m := FinSet( 8 );
#! <An object in SkeletalFinSets>
i := InitialObject( m );
#! <An object in SkeletalFinSets>
iota := UniversalMorphismFromInitialObject( m );
#! <A morphism in SkeletalFinSets>
Set( i );
#![  ]
t := TerminalObject( m );
#! <An object in SkeletalFinSets>
Set( t );
#! [ 1 ]
pi := UniversalMorphismIntoTerminalObject( m );
#! <A morphism in SkeletalFinSets>
IsIdenticalObj( Range( pi ), T );
#! true
pi_t := UniversalMorphismIntoTerminalObjectWithGivenTerminalObject( m, t );
#! <A morphism in Skeletal FinSets>
AsList( pi_t );
#! [ 1, 1, 1, 1, 1, 1, 1, 1 ]
pi = pi_t;
#!true
#! @EndExample



#! @System DirectProduct

LoadPackage( "FinSets" );

#! @Example
m := FinSet( 7 );
#!<An object in SkeletalFinSets>
n := FinSet( 3 );
#!<An object in SkeletalFinSets>
p := FinSet( 4 );
#!<An object in SkeletalFinSets>
d:= DirectProduct( [ m, n, p ] );
#!<An object in SkeletalFinSets>
Set(d);
#! [ 1 .. 84 ]
pi1 := ProjectionInFactorOfDirectProduct( [ m, n, p ], 1 );
#!<A morphism in SkeletalFinSets>
Display( pi1 );
#! [ 84, [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3,
      3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6,
      6, 6, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ], 7 ]
pi3 := ProjectionInFactorOfDirectProduct( [ m, n, p ], 3 );
#!<A morphism in SkeletalFinSets>
Display( pi3 )
#! [ 84, [ 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1,
      2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2,
      3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4 ], 4 ]
#! @EndExample



#! @System Coproduct

LoadPackage( "FinSets" );

#! @Example
m := FinSet( 7 );
#!<An object in SkeletalFinSets>
n := FinSet( 3 );
#!<An object in SkeletalFinSets>
p := FinSet( 4 );
#!<An object in SkeletalFinSets>
c := Coproduct( m, n, p );
#!<An object in SkeletalFinSets>
Set( c );
#![ 1 .. 14 ]
iota1 := InjectionOfCofactorOfCoproduct( [ m, n, p ], 1 );
#!<A morphism in SkeletalFinSets>
IsWellDefined( iota1 );
#!true
Display( iota1 );
#! [ 7, [ [ 1, 1 ], [ 1, 2 ], [ 1, 3 ], [ 1, 4 ], [ 1, 5 ], [ 1, 6 ], [ 1, 7 ] ], 14 ]
iota3 := InjectionOfCofactorOfCoproduct( [ m, n, p ], 3 );
#!<A morphism in SkeletalFinSets>
Display( iota3 );
#![ 4, [ [ 3, 1 ], [ 3, 2 ], [ 3, 3 ], [ 3, 4 ] ], 14 ]
#! @EndExample



#! @System Equalizer

LoadPackage( "FinSets" );

#! @Example
S := FinSet( 5 );
#! <An object in SkeletalFinSets>
T := FinSet( 3 );
#! <An object in SkeletalFinSets>
f1 := MapOfFinSets( S, [ 3, 3, 1, 2, 2], T );
#! <A morphism in SkeletalFinSets>
f2 := MapOfFinSets( S, [ 3, 2, 3, 1, 2], T );
#! <A morphism in FinSets>
f3 := MapOfFinSets( S, [ 3, 1, 2, 1, 2], T );
#! <A morphism in SkeletalFinSets>
D := [ f1, f2, f3 ];
#! [ <A morphism in SkeletalFinSets>, <A morphism in SkeletalFinSets>, <A morphism in SkeletalFinSets> ]
Eq := Equalizer( D );
#! <An object in SkeletalFinSets>
Length( Eq );
#! 2
psi := EmbeddingOfEqualizer( D );
#! <A morphism in SkeletalFinSets>
Display( psi );
#! [ 2, [ 1, 5 ], 5 ]
D := [ f2, f3 ];
#! [ <A morphism in SkeletalFinSets>, <A morphism in SkeletalFinSets> ]
Eq := Equalizer( D );
#! <An object in SkeletalFinSets>
Length( Eq );
#! 3
psi := EmbeddingOfEqualizer( D );
#! <A morphism in SkeletalFinSets>
Display( psi );
#! [ 3, [1, 4, 5], 5 ]
#! @EndExample



#! @System Coequalizer

LoadPackage( "FinSets" );

#! @Example
s := FinSet( 5 );
#! <An object in SkeletalFinSets>
t := FinSet( 4 );
#! <An object in SkeletalFinSets>
f := MapOfFinSets( s, [ 3, 4, 4, 2, 4 ], t );
#! <A morphism in SkeletalFinSets>
g := MapOfFinSets( s, [ 3, 3, 4, 2, 4 ], t );
#! <A morphism in SkeletalFinSets>
D := [f, g];
#! [ <A morphism in SkeletalFinSets>, <A morphism in SkeletalFinSets> ]
C := Coequalizer( D );
#! <An object in SkeletalFinSets>
Length( C );
#! 3
pi := ProjectionOntoCoequalizer(D);
#! <A morphism in SkeletalFinSets>
Display( pi );
#! [ 4, [ 1, 2, 3, 3 ], 3 ]
tau := MapOfFinSets( t, [2, 1, 2, 2], FinSet( 2 ) );
#! <A morphism in SkeletalFinSets>
phi := UniversalMorphismFromCoequalizer( D, tau );
#! <A morphism in SkeletalFinSets>
Display( phi );
#! [ 3, [ 2, 1, 2 ], 2 ]
PreCompose( pi, phi ) = tau;
#! true


s := FinSet( 5 );
#! <An object in SkeletalFinSets>
t := FinSet( 4 );
#! <An object in SkeletalFinSets>
f := MapOfFinSets( s, [ 2, 3, 3, 2, 4 ], t );
#! <A morphism in SkeletalFinSets>
g := MapOfFinSets( s, [ 2, 3, 2, 2, 4 ], t );
#! <A morphism in SkeletalFinSets>
D := [ f, g ];
#! [ <A morphism in SkeletalFinSets>, <A morphism in SkeletalFinSets> ]
C := Coequalizer( D );
#! <An object in SkeletalFinSets>
Length( C );
#! 3
pi := ProjectionOntoCoequalizer( D );
#! <A morphism in SkeletalFinSets>
Display( pi );
#! [ 4, [ 1, 2, 2, 3 ], 3 ]
PreCompose( f, pi ) = PreCompose( g, pi );
#! true
tau := MapOfFinSets( t, [1, 2, 2, 1 ], FinSet( 2 ) );
#! <A morphism in SkeletalFinSets>
phi := UniversalMorphismFromCoequalizer( D, tau );
#! <A morphism in SkeletalFinSets>
Display( phi );
#! [ 3, [ 1, 2, 1 ], 2 ]
PreCompose( pi, phi ) = tau;
#! true
#! @EndExample



#! @System FiberProduct

LoadPackage( "FinSets" );

#! @Example
m := FinSet( 5 );
#! <An object in SkeletalFinSets>
n1 := FinSet( 3 );
#! <An object in SkeletalFinSets>
iota1 := EmbeddingOfFinSets( n1, m );
#! <A monomorphism in SkeletalFinSets>
Display( iota1 );
#! [ 3, [ 1, 2, 3 ], 5 ]
n2 := FinSet( 4 );
#! <An object in SkeletalFinSets>
iota2 := EmbeddingOfFinSets( n2, m );
#! <A mono morphism in SkeletalFinSets>
Display( iota2 );
#! [ 4, [ 1, 2, 3, 4 ], 5 ]
D := [ iota1, iota2 ];
#! [ <A mono morphism in SkeletalFinSets>, <A mono morphism in SkeletalFinSets> ]
Fib := FiberProduct( D );
#! <An object in SkeletalFinSets>
Display( Fib );
#! 3
pi1 := ProjectionInFactorOfFiberProduct( D, 1 );
#! <A mono morphism in SkeletalFinSets>
Display(pi1);
#![ 3, [ 1, 2, 3 ], 3 ]
int1 := ImageObject( pi1 );
#! <An object in SkeletalFinSets>
Display( int1 );
#! 3
pi2 := ProjectionInFactorOfFiberProduct( D, 2 );
#! <A monomorphism in SkeletalFinSets>
Display(pi2);
#![ 3, [ 1, 2, 3 ], 4 ]
int2 := ImageObject( pi2 );
#! <An object in SkeletalFinSets>
Display( int2 );
#! 3
omega1 := PreCompose( pi1, iota1 );
#! <A mono morphism in SkeletalFinSets>
omega2 := PreCompose( pi2, iota2 );
#! <A mono morphism in SkeletalFinSets>
omega1 = omega2;
#! true
Display(omega1);
#! [ 3, [ 1, 2, 3 ], 5 ]
#! @EndExample



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