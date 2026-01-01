#! @Chunk Skeletal1HeytingAlgebraOfSubobjects

# Below we see the Heyting algebra structure
# on the set of subobjects (= monos up to mutual dominance)

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
M := FinSet1( 7 );
#! |7|
N := FinSet1( 3 );
#! |3|
iotaN := MapOfFinSets( N, [ 2, 3, 5 ], M );
#! |3| → |7|
NC := PseudoComplementSubobject( iotaN );
#! |4|
tauN := EmbeddingOfPseudoComplementSubobject( iotaN );
#! |4| ↪ |7|
Display( tauN );
#! { 1,..., 4 } ⱶ[ 1, 4, 6, 7 ]→ { 1,..., 7 }
L := FinSet1( 4 );
#! |4|
iotaL := MapOfFinSets( L, [ 2, 4, 5, 7 ], M );
#! |4| → |7|
NIL := IntersectionSubobject( iotaN, iotaL );
#! |2|
iotaNiL := EmbeddingOfIntersectionSubobject( iotaN, iotaL );
#! |2| ↪ |7|
Display( iotaNiL );
#! { 1, 2 } ⱶ[ 2, 5 ]→ { 1,..., 7 }
NUL := UnionSubobject( iotaN, iotaL );
#! |5|
iotaNuL := EmbeddingOfUnionSubobject( iotaN, iotaL );
#! |5| → |7|
Display( iotaNuL );
#! { 1,..., 5 } ⱶ[ 2, 3, 4, 5, 7 ]→ { 1,..., 7 }
NPL := RelativePseudoComplementSubobject( iotaN, iotaL );
#! |6|
iotaNpL := EmbeddingOfRelativePseudoComplementSubobject( iotaN, iotaL );
#! |6| ↪ |7|
Display( iotaNpL );
#! { 1,..., 6 } ⱶ[ 1, 2, 4, 5, 6, 7 ]→ { 1,..., 7 }
#! @EndExample
