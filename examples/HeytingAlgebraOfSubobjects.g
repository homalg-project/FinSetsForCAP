#! @Chunk HeytingAlgebraOfSubobjects

# Below we see the Heyting algebra structure
# on the set of subobjects (= monos up to mutual dominance)

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
M := FinSet( [ 1 .. 7 ] );
#! <An object in FinSets>
N := FinSet( [ 2, 3, 5 ] );
#! <An object in FinSets>
iotaN := EmbeddingOfFinSets( N, M );
#! <A monomorphism in FinSets>
NC := PseudoComplementSubobject( iotaN );
#! <An object in FinSets>
Display( NC );
#! [ [ 1, [  ] ], [ 4, [  ] ], [ 6, [  ] ], [ 7, [  ] ] ]
tauN := EmbeddingOfPseudoComplementSubobject( iotaN );
#! <A monomorphism in FinSets>
Nc := ImageObject( tauN );
#! <An object in FinSets>
Display( Nc );
#! [ 1, 4, 6, 7 ]
L := FinSet( [ 2, 4, 5, 7 ] );
#! <An object in FinSets>
iotaL := EmbeddingOfFinSets( L, M );
#! <A monomorphism in FinSets>
NIL := IntersectionSubobject( iotaN, iotaL );
#! <An object in FinSets>
Display( NIL );
#! [ [ 2, 2 ], [ 5, 5 ] ]
iotaNiL := EmbeddingOfIntersectionSubobject( iotaN, iotaL );
#! <A monomorphism in FinSets>
NiL := ImageObject( iotaNiL );
#! <An object in FinSets>
Display( NiL );
#! [ 2, 5 ]
NUL := UnionSubobject( iotaN, iotaL );
#! <An object in FinSets>
Display( NUL );
#! [ 2, 3, 5, 4, 7 ]
iotaNuL := EmbeddingOfUnionSubobject( iotaN, iotaL );
#! <A monomorphism in FinSets>
NuL := ImageObject( iotaNuL );
#! <An object in FinSets>
Display( NuL );
#! [ 2, 3, 5, 4, 7 ]
NPL := RelativePseudoComplementSubobject( iotaN, iotaL );
#! <An object in FinSets>
Display( NPL );
#! [ [ 1, [  ] ], [ 2, [  ] ], [ 4, [  ] ], [ 5, [  ] ], [ 6, [  ] ], 
#!   [ 7, [  ] ] ]
iotaNpL := EmbeddingOfRelativePseudoComplementSubobject( iotaN, iotaL );
#! <A monomorphism in FinSets>
NpL := ImageObject( iotaNpL );
#! <An object in FinSets>
Display( NpL );
#! [ 1, 2, 4, 5, 6, 7 ]
#! @EndExample
