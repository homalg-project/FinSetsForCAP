#! @Chunk TestRandomMethods

# Below we use the random methods defined in Skeletal
# Finite Sets and assert the results and edge cases 
# are well defined.

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
L := [ 10, 20, 50, 100, 500 ];;
obj0 := RandomObjectByInteger( SkeletalFinSets, 0 );;
IsWellDefined( obj0 );
#! true
obj1 := RandomObjectByList( SkeletalFinSets, L );;
IsWellDefined( obj1 );
#! true
Cardinality( obj1 ) in L;
#! true
obj2 := RandomObjectByInteger( SkeletalFinSets, 10 );;
IsWellDefined( obj2 );
#! true
mor0 := RandomMorphismWithFixedSourceAndRangeByInteger( 
                SkeletalFinSets, obj0, obj0, 10 );;
IsWellDefined( mor0 );
#! true
mor1 := RandomMorphismWithFixedSourceAndRangeByInteger( 
                SkeletalFinSets, obj1, obj1, 10 );;
IsWellDefined( mor1 );
#! true
mor2 := RandomMorphismByList( SkeletalFinSets, [ L, L ] );;
IsWellDefined( mor2 );
#! true
Cardinality( Source( mor2 ) ) in L  and
    Cardinality( Range( mor2 ) ) in L ;
#! true
mor03 := RandomMorphismByInteger( SkeletalFinSets, 0 );;
IsWellDefined( mor03 );
#! true
mor4 := RandomMorphismByInteger( SkeletalFinSets, 10 );;
IsWellDefined( mor4 );
#! true
mor5 := RandomMorphismWithFixedSourceByInteger( 
                SkeletalFinSets, obj1, 10 );;
IsWellDefined( mor5 );
#! true
mor06 := RandomMorphismWithFixedRangeByInteger( 
                 SkeletalFinSets, obj0, 10 );;
IsWellDefined( mor06 );
#! true
mor7 := RandomMorphismWithFixedRangeByInteger( 
                SkeletalFinSets, obj1, 10 );;
IsWellDefined( mor7 );
#! true
mor8 := RandomMorphismWithFixedSourceByList( 
                SkeletalFinSets, obj1, [ 10 ] );;
IsWellDefined( mor8 );
#! true
mor09 := RandomMorphismWithFixedRangeByList( 
                 SkeletalFinSets, obj0, [ 0 ] );;
IsWellDefined( mor09 );
#! true
mor10 := RandomMorphismWithFixedRangeByList( 
                 SkeletalFinSets, obj1, [ 10 ] );;
IsWellDefined( mor10 );
#! true
mor11 := RandomMorphismWithFixedSourceAndRangeByList( 
                 SkeletalFinSets, obj2, obj2, [ 10 ] );;
IsWellDefined( mor11 );
#! true
#! @EndExample
