#! @Chunk Skeletal1FiberProduct

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
m := FinSet1( 5 );
#! |5|
n1 := FinSet1( 3 );
#! |3|
iota1 := EmbeddingOfFinSets( n1, m );
#! |3| ↪ |5|
Display( iota1 );
#! { 1, 2, 3 } ⱶ[ 1 .. 3 ]→ { 1,..., 5 }
n2 := FinSet1( 4 );
#! |4|
iota2 := EmbeddingOfFinSets( n2, m );
#! |4| ↪ |5|
Display( iota2 );
#! { 1,..., 4 } ⱶ[ 1 .. 4 ]→ { 1,..., 5 }
D := [ iota1, iota2 ];;
Fib := FiberProduct( D );
#! |3|
pi1 := ProjectionInFactorOfFiberProduct( D, 1 );
#! |3| → |3|
Display( pi1 );
#! { 1, 2, 3 } ⱶ[ 1, 2, 3 ]→ { 1, 2, 3 }
int1 := ImageObject( pi1 );
#! |3|
pi2 := ProjectionInFactorOfFiberProduct( D, 2 );
#! |3| → |4|
Display( pi2 );
#! { 1, 2, 3 } ⱶ[ 1, 2, 3 ]→ { 1,..., 4 }
int2 := ImageObject( pi2 );
#! |3|
omega1 := PreCompose( pi1, iota1 );
#! |3| → |5|
omega2 := PreCompose( pi2, iota2 );
#! |3| → |5|
omega1 = omega2;
#! true
Display( omega1 );
#! { 1, 2, 3 } ⱶ[ 1, 2, 3 ]→ { 1,..., 5 }
#! @EndExample
