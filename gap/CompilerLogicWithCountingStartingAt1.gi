# SPDX-License-Identifier: GPL-2.0-or-later
# MatroidsForCAP: Matroids and arrangements for CAP
#
# Implementations
#

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "n" ],
        variable_filters := [ IsBigInt ],
        src_template := "1 + ( -1 + n )",
        dst_template := "n",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "n" ],
        variable_filters := [ IsBigInt ],
        src_template := "-1 + ( 1 + n )",
        dst_template := "n",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "length" ],
        variable_filters := [ IsBigInt ],
        src_template := "List( [ 1 .. length ], i -> -1 + i )",
        dst_template := "[ 0 .. length - 1 ]",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "length" ],
        variable_filters := [ IsBigInt ],
        src_template := "List( [ 0 .. length - 1 ], i -> 1 + i )",
        dst_template := "[ 1 .. length ]",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "map" ],
        variable_filters := [ IsMorphismInSkeletalCategoryOfFiniteSetsWithCountingStartingAt1 ],
        src_template := "List( DuplicateFreeList( List( AsList( map ), i -> -1 + i ) ), j -> 1 + j )",
        dst_template := "DuplicateFreeList( AsList( map ) )",
    )
);

## for AstrictionToCoimage
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "list" ],
        variable_filters := [ IsList ],
        src_template := "Length( DuplicateFreeList( List( list, i -> -1 + i ) ) )",
        dst_template := "Length( DuplicateFreeList( list ) )",
    )
);

## for CartesianBraiding(Inverse)WithGivenDirectProducts
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "s", "b", "j" ],
        variable_filters := [ IsBigInt, IsBigInt, IsBigInt ],
        src_template := "List( [ 0 .. s - 1 ], i -> 1 + RemIntWithDomain( i, b, s ) )[j]",
        dst_template := "1 + List( [ 0 .. s - 1 ], i -> RemIntWithDomain( i, b, s ) )[j]",
    )
);

## for CartesianBraiding(Inverse)WithGivenDirectProducts
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "s", "b", "j" ],
        variable_filters := [ IsBigInt, IsBigInt, IsBigInt ],
        src_template := "List( [ 0 .. s - 1 ], i -> 1 + QuoIntWithDomain( i, b, s ) )[j]",
        dst_template := "1 + List( [ 0 .. s - 1 ], i -> QuoIntWithDomain( i, b, s ) )[j]",
    )
);

## for CartesianLambdaElimination
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "list", "j" ],
        variable_filters := [ IsList, IsBigInt ],
        src_template := "List( list, i -> -1 + i )[j]",
        dst_template := "-1 + list[j]",
    )
);


## for CartesianLambdaIntroduction
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "list1", "list2", "length" ],
        variable_filters := [ IsList, IsList, IsBigInt ],
        src_template := "List( [ 0 .. length - 1 ], i -> list2[list1[1 + i]] )",
        dst_template := "List( [ 1 .. length ], i -> list2[list1[i]] )",
    )
);

## for CartesianLambdaIntroduction
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "map" ],
        variable_filters := [ IsMorphismInSkeletalCategoryOfFiniteSetsWithCountingStartingAt1 ],
        src_template := "List( [ 1 .. Cardinality( Source( map ) ) ], i -> AsList( map )[i] )",
        dst_template := "AsList( map )",
    )
);

## for CartesianRightCoevaluationMorphismWithGivenRange
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "m", "n" ],
        variable_filters := [ IsBigInt, IsBigInt ],
        src_template := "-1 + ( 1 + m + n )",
        dst_template := "m + n",
    )
);

## for ClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "map" ],
        variable_filters := [ IsMorphismInSkeletalCategoryOfFiniteSetsWithCountingStartingAt1 ],
        src_template := "List( [ 0 .. Cardinality( Target( map ) ) - 1 ], i -> 1 + BoolToBigInt( i in List( AsList( map ), j -> -1 + j ) ) )",
        dst_template := "List( [ 1 .. Cardinality( Target( map ) ) ], i -> 1 + BoolToBigInt( i in AsList( map ) ) ) ",
    )
);

## for CoastrictionToImage
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "list" ],
        variable_filters := [ IsList ],
        src_template := "Length( SSortedList( List( list, i -> -1 + i ) ) )",
        dst_template := "Length( SSortedList( list ) )",
    )
);

## for CoastrictionToImage
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "list", "j" ],
        variable_filters := [ IsList, IsBigInt ],
        src_template := "SafePosition( List( list, i -> -1 + i ), -1 + j )",
        dst_template := "SafePosition( list, j )",
    )
);

## for ImageEmbedding
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "list" ],
        variable_filters := [ IsList ],
        src_template := "List( SSortedList( List( list, j -> -1 + j ) ), i -> 1 + i )",
        dst_template := "SSortedList( list )",
    )
);

## for CoimageProjection
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "map" ],
        variable_filters := [ IsMorphismInSkeletalCategoryOfFiniteSetsWithCountingStartingAt1 ],
        src_template := "List( [ 0 .. Cardinality( Source( map ) ) - 1 ], i -> BigInt( SafePosition( List( DuplicateFreeList( AsList( map ) ), j -> -1 + j ), List( AsList( map ), j -> -1 + j )[1 + i] ) ) )",
        dst_template := "List( [ 1 .. Cardinality( Source( map ) ) ], i -> BigInt( SafePosition( DuplicateFreeList( AsList( map ) ), AsList( map )[i] ) ) )",
    )
);

## for EmbeddingOfEqualizerWithGivenEqualizer
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "maps", "card" ],
        variable_filters := [ IsList, IsBigInt ],
        src_template := "Filtered( [ 0 .. card - 1 ], x -> ForAll( [ 1 .. Length( maps ) - 1 ], j -> List( maps, map -> List( AsList( map ), i -> -1 + i ) )[j][1 + x] = List( maps, map -> List( AsList( map ), i -> -1 + i ) )[j + 1][1 + x] ) )",
        dst_template := "List( Filtered( [ 1 .. card ], x -> ForAll( [ 1 .. Length( maps ) - 1 ], j -> List( maps, AsList )[j][x] = List( maps, AsList )[j + 1][x] ) ), x -> -1 + x )",
    )
);

## for IsEqualForMorphisms
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "list1", "list2" ],
        variable_filters := [ IsList, IsList ],
        src_template := "List( list1, i -> -1 + i ) = List( list2, i -> -1 + i )",
        dst_template := "list1 = list2",
    )
);

## for SingletonMorphismWithGivenPowerObject
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "length", "list", "j" ],
        variable_filters := [ IsBigInt, IsList, IsBigInt ],
        src_template := "List( [ 1 .. length ], x -> 1 + BoolToBigInt( x in list ) )[j]",
        dst_template := "1 + List( [ 1 .. length ], x -> BoolToBigInt( x in list ) )[j]",
    )
);

## for SingletonMorphismWithGivenPowerObject
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "card" ],
        variable_filters := [ IsBigInt ],
        src_template := "List( [ 1 .. card^2 ], x -> BoolToBigInt( x in List( [ 0 .. card - 1 ], i -> 1 + (i + i * card) ) ) )",
        dst_template := "List( [ 0 .. card^2 - 1 ], x -> BoolToBigInt( x in List( [ 0 .. card - 1 ], i -> i + i * card ) ) )",
    )
);

## for TruthMorphismOfImplies
CapJitAddLogicTemplate(
    rec(
        variable_names := [  ],
        variable_filters := [  ],
        src_template := "[ 1 .. BigInt( 1 ) ]",
        dst_template := "[ BigInt( 1 ) ]",
    )
);

## for TruthMorphismOfImplies
CapJitAddLogicTemplate(
    rec(
        variable_names := [ ],
        src_template := "BigInt( 1 ) = BigInt( 4 )",
        dst_template := "false",
    )
);

## for TruthMorphismOfImplies
CapJitAddLogicTemplate(
    rec(
        variable_names := [ ],
        src_template := "BigInt( 2 ) = BigInt( 4 )",
        dst_template := "false",
    )
);

## for TruthMorphismOfImplies
CapJitAddLogicTemplate(
    rec(
        variable_names := [ ],
        src_template := "BigInt( 3 ) = BigInt( 4 )",
        dst_template := "false",
    )
);

## for TruthMorphismOfImplies
CapJitAddLogicTemplate(
    rec(
        variable_names := [ ],
        src_template := "[ 1 .. BigInt( 4 ) ]",
        dst_template := "[ BigInt( 1 ), BigInt( 2 ), BigInt( 3 ), BigInt( 4 ) ]",
    )
);

## for TruthMorphismOfImplies
CapJitAddLogicTemplate(
    rec(
        variable_names := [ ],
        src_template := "Filtered( [ BigInt( 1 ), BigInt( 2 ), BigInt( 3 ), BigInt( 4 ) ], x -> [ BigInt( 1 ), BigInt( 1 ), BigInt( 1 ), BigInt( 2 ) ][x] = 1 + [ BigInt( 0 ), BigInt( 1 ), BigInt( 0 ), BigInt( 1 ) ][x] )",
        dst_template := "[ BigInt( 1 ), BigInt( 3 ), BigInt( 4 ) ]",
    )
);

## for TruthMorphismOfImplies
CapJitAddLogicTemplate(
    rec(
        variable_names := [ ],
        src_template := "BigInt( 1 ) in [ BigInt( 1 ), BigInt( 3 ), BigInt( 4 ) ]",
        dst_template := "true",
    )
);

## for TruthMorphismOfImplies
CapJitAddLogicTemplate(
    rec(
        variable_names := [ ],
        src_template := "BigInt( 2 ) in [ BigInt( 1 ), BigInt( 3 ), BigInt( 4 ) ]",
        dst_template := "false",
    )
);

## for TruthMorphismOfImplies
CapJitAddLogicTemplate(
    rec(
        variable_names := [ ],
        src_template := "BigInt( 3 ) in [ BigInt( 1 ), BigInt( 3 ), BigInt( 4 ) ]",
        dst_template := "true",
    )
);

## for TruthMorphismOfImplies
CapJitAddLogicTemplate(
    rec(
        variable_names := [ ],
        src_template := "BigInt( 4 ) in [ BigInt( 1 ), BigInt( 3 ), BigInt( 4 ) ]",
        dst_template := "true",
    )
);
