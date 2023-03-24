#! @Chunk SkeletalHeytingAlgebraOfSubobjects

# Below we see the Heyting algebra structure
# on the set of subobjects (= monos up to mutual dominance)

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
M := FinSet( 7 );
#! |7|
N := FinSet( 3 );
#! |3|
iotaN := MapOfFinSets( N, [ 1, 2, 4 ], M );
#! |3| → |7|
NC := PseudoComplementSubobject( iotaN );
#! |4|
tauN := EmbeddingOfPseudoComplementSubobject( iotaN );
#! |4| ↪ |7|
Display( tauN );
#! { 0,..., 3 } ⱶ[ 0, 3, 5, 6 ]→ { 0,..., 6 }
L := FinSet( 4 );
#! |4|
iotaL := MapOfFinSets( L, [ 1, 3, 4, 6 ], M );
#! |4| → |7|
NIL := IntersectionSubobject( iotaN, iotaL );
#! |2|
iotaNiL := EmbeddingOfIntersectionSubobject( iotaN, iotaL );
#! |2| ↪ |7|
Display( iotaNiL );
#! { 0, 1 } ⱶ[ 1, 4 ]→ { 0,..., 6 }
NUL := UnionSubobject( iotaN, iotaL );
#! |5|
iotaNuL := EmbeddingOfUnionSubobject( iotaN, iotaL );
#! |5| → |7|
Display( iotaNuL );
#! { 0,..., 4 } ⱶ[ 1, 2, 3, 4, 6 ]→ { 0,..., 6 }
NPL := RelativePseudoComplementSubobject( iotaN, iotaL );
#! |6|
iotaNpL := EmbeddingOfRelativePseudoComplementSubobject( iotaN, iotaL );
#! |6| ↪ |7|
Display( iotaNpL );
#! { 0,..., 5 } ⱶ[ 0, 1, 3, 4, 5, 6 ]→ { 0,..., 6 }
#! @EndExample
