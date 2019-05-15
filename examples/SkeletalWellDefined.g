#! @Chunk SkeletalWellDefined

LoadPackage( "FinSetsForCAP" );

#! @Example
s := FinSet( 7 );
#! <An object in SkeletalFinSets>
t := FinSet( 4 );
#! <An object in SkeletalFinSets>
psi := MapOfFinSets( s, [ 1, 3, 2, 3, 2, 4 ], t );
#! <A morphism in SkeletalFinSets>
IsWellDefined( psi );
#! false
psi := MapOfFinSets( s, [ 1, 3, 2, 3, 2, 4, -1 ], t );
#! <A morphism in SkeletalFinSets>
IsWellDefined( psi );
#! false
psi := MapOfFinSets( s, [ 2, 3, 2, 5, 3, 2, 4 ], t );
#! <A morphism in SkeletalFinSets>
IsWellDefined( psi );
#! false
psi:= MapOfFinSets( s, [ 1, 3, 2, 4, 3, 2, 4 ], t );
#! <A morphism in SkeletalFinSets>
IsWellDefined( psi );
#! true
#! @EndExample
