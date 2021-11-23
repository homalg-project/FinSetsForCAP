#! @Chunk SkeletalMapOfFinSets

LoadPackage( "FinSetsForCAP" );

#! @Example
s := FinSet( 3 );
#! <An object in SkeletalFinSets>
t := FinSet( 7 );
#! <An object in SkeletalFinSets>
phi := MapOfFinSets( s, [7, 5, 5], t );
#! <A morphism in SkeletalFinSets>
AsList( phi );
#! [ 7, 5, 5 ]
IsWellDefined( phi );
#! true
Display( phi );
#! [ 3, [ 7, 5, 5 ], 7 ]

s := ObjectConstructor( SkeletalFinSets, 3 );
#! <An object in SkeletalFinSets>
t := ObjectConstructor( SkeletalFinSets, 7 );
#! <An object in SkeletalFinSets>
phi := MorphismConstructor( s, [7, 5, 5], t );
#! <A morphism in SkeletalFinSets>
MorphismDatum( phi );
#! [ 7, 5, 5 ]
IsWellDefined( phi );
#! true
Display( phi );
#! [ 3, [ 7, 5, 5 ], 7 ]

#! @EndExample
