#! @Chunk SkeletalFiberProduct

LoadPackage( "FinSetsForCAP" );

#! @Example
m := FinSet( 5 );
#! |5|
n1 := FinSet( 3 );
#! |3|
iota1 := EmbeddingOfFinSets( n1, m );
#! |3| ↪ |5|
Display( iota1 );
#! { 0, 1, 2 } ⱶ[ 0 .. 2 ]→ { 0,..., 4 }
n2 := FinSet( 4 );
#! |4|
iota2 := EmbeddingOfFinSets( n2, m );
#! |4| ↪ |5|
Display( iota2 );
#! { 0,..., 3 } ⱶ[ 0 .. 3 ]→ { 0,..., 4 }
D := [ iota1, iota2 ];
#! [ |3| ↪ |5|, |4| ↪ |5| ]
Fib := FiberProduct( D );
#! |3|
pi1 := ProjectionInFactorOfFiberProduct( D, 1 );
#! |3| ↪ |3|
Display( pi1 );
#! { 0, 1, 2 } ⱶ[ 0, 1, 2 ]→ { 0, 1, 2 }
int1 := ImageObject( pi1 );
#! |3|
pi2 := ProjectionInFactorOfFiberProduct( D, 2 );
#! |3| ↪ |4|
Display( pi2 );
#! { 0, 1, 2 } ⱶ[ 0, 1, 2 ]→ { 0,..., 3 }
int2 := ImageObject( pi2 );
#! |3|
omega1 := PreCompose( pi1, iota1 );
#! |3| ↪ |5|
omega2 := PreCompose( pi2, iota2 );
#! |3| ↪ |5|
omega1 = omega2;
#! true
Display( omega1 );
#! { 0, 1, 2 } ⱶ[ 0, 1, 2 ]→ { 0,..., 4 }
#! @EndExample
