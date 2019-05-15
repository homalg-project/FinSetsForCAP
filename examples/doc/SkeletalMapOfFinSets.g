#! @Chunk SkeletalMapOfFinSets

LoadPackage( "FinSetsForCAP" );

#! @Example
s := FinSet( 3 );
#! <An object in SkeletalFinSets>
t := FinSet( 7 );
#! <An object in SkeletalFinSets>
phi := MapOfFinSets( s, [7, 5, 5] ,t );
#! <A morphism in SkeletalFinSets>
IsWellDefined( phi );
#! true
Display( phi );
#! [ 3, [ 7, 5, 5 ], 7 ]
#! @EndExample
