#! @Chunk SkeletalHeytingAlgebraOfSubobjects

LoadPackage( "FinSetsForCAP" );

# Below we see the Heyting algebra structure
# on the set of subobjects (= monos up to mutual dominance)

#! @Example
M := FinSet( 7 );
#! <An object in SkeletalFinSets>
N := FinSet( 3 );
#! <An object in SkeletalFinSets>
iotaN := MapOfFinSets( N, [ 2, 3, 5 ], M );
#! <A morphism in SkeletalFinSets>
NC := PseudoComplementSubobject( iotaN );
#! <An object in SkeletalFinSets>
Display( NC );
#! 4
tauN := EmbeddingOfPseudoComplementSubobject( iotaN );
#! <A monomorphism in SkeletalFinSets>
Display( tauN );
#! [ 4, [ 1, 4, 6, 7 ], 7 ]
L := FinSet( 4 );
#! <An object in SkeletalFinSets>
iotaL := MapOfFinSets( L, [ 2, 4, 5, 7 ], M );
#! <A morphism in SkeletalFinSets>
NIL := IntersectionSubobject( iotaN, iotaL );
#! <An object in SkeletalFinSets>
Display( NIL );
#! 2
iotaNiL := EmbeddingOfIntersectionSubobject( iotaN, iotaL );
#! <A monomorphism in SkeletalFinSets>
Display( iotaNiL );
#! [ 2, [ 2, 5 ], 7 ]
NUL := UnionSubobject( iotaN, iotaL );
#! <An object in SkeletalFinSets>
Display( NUL );
#! 5
iotaNuL := EmbeddingOfUnionSubobject( iotaN, iotaL );
#! <A monomorphism in SkeletalFinSets>
Display( iotaNuL );
#! [ 5, [ 2, 3, 4, 5, 7 ], 7 ]
NPL := RelativePseudoComplementSubobject( iotaN, iotaL );
#! <An object in SkeletalFinSets>
Display( NPL );
#! 6
iotaNpL := EmbeddingOfRelativePseudoComplementSubobject( iotaN, iotaL );
#! <A monomorphism in SkeletalFinSets>
Display( iotaNpL );
#! [ 6, [ 1, 2, 4, 5, 6, 7 ], 7 ]
#! @EndExample
