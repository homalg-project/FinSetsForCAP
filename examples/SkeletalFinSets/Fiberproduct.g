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