#! @Chunk SkeletalMapOfFinSets

LoadPackage( "FinSetsForCAP" );

#! @Example
s := FinSet( 3 );
#! <An object in SkeletalFinSets>
t := FinSet( 7 );
#! <An object in SkeletalFinSets>
phi := MapOfFinSets( s, [ 6, 4, 4 ], t );
#! <A morphism in SkeletalFinSets>
AsList( phi );
#! [ 6, 4, 4 ]
IsWellDefined( phi );
#! true
Display( phi );
#! [ 3, [ 6, 4, 4 ], 7 ]

s := ObjectConstructor( SkeletalFinSets, 3 );
#! <An object in SkeletalFinSets>
t := ObjectConstructor( SkeletalFinSets, 7 );
#! <An object in SkeletalFinSets>
phi := MorphismConstructor( s, [ 6, 4, 4 ], t );
#! <A morphism in SkeletalFinSets>
MorphismDatum( phi );
#! [ 6, 4, 4 ]
IsWellDefined( phi );
#! true
Display( phi );
#! [ 3, [ 6, 4, 4 ], 7 ]

#! @EndExample
