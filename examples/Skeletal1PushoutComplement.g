#! @Chunk Skeletal1PushoutComplement

##  L <-l-- K
##  |       |
##  |       |
##  m       ?
##  |       |
##  v       v
##  G <-c-- D

#! Define two composable monos $K \stackrel{l}{\hookrightarrow} L \stackrel{m}{\hookrightarrow} G$ in `SkeletalFinSets1`:

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
K := FinSet1( 3 );
#! |3|
L := FinSet1( 6 );
#! |6|
l := MapOfFinSets( K, [ 3 .. 5 ], L );; IsMonomorphism( l );; l;
#! |3| ↪ |6|
Display( l );
#! { 1, 2, 3 } ⱶ[ 3 .. 5 ]→ { 1,..., 6 }
G := FinSet1( 8 );
#! |8|
Display( G );
#! { 1,..., 8 }
m := MapOfFinSets( L, [ 1, 2, 3, 4, 6, 7 ], G );
#! |6| → |8|
Display( m );
#! { 1,..., 6 } ⱶ[ 1, 2, 3, 4, 6, 7 ]→ { 1,..., 8 }
#! @EndExample

#! Now we compute the pushout complement $D \stackrel{c}{\hookrightarrow} G$
#! of $K \stackrel{l}{\hookrightarrow} L \stackrel{m}{\hookrightarrow} G$:

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
HasPushoutComplement( l, m );
#! true
c := PushoutComplement( l, m );
#! |5| → |8|
Display( c );
#! { 1,..., 5 } ⱶ[ 3, 4, 5, 6, 8 ]→ { 1,..., 8 }
#! @EndExample
