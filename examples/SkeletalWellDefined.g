#! @Chunk SkeletalWellDefined

LoadPackage( "FinSetsForCAP" );

#! @Example
s := FinSet( 7 );
#! <An object in SkeletalFinSets>
t := FinSet( 4 );
#! <An object in SkeletalFinSets>
psi := MapOfFinSets( s, [ 0, 2, 1, 2, 1, 3 ], t );
#! <A morphism in SkeletalFinSets>
IsWellDefined( psi );
#! false
psi := MapOfFinSets( s, [ 0, 2, 1, 2, 1, 3, -2 ], t );
#! <A morphism in SkeletalFinSets>
IsWellDefined( psi );
#! false
psi := MapOfFinSets( s, [ 1, 2, 1, 4, 2, 1, 3 ], t );
#! <A morphism in SkeletalFinSets>
IsWellDefined( psi );
#! false
psi:= MapOfFinSets( s, [ 0, 2, 1, 3, 2, 1, 3 ], t );
#! <A morphism in SkeletalFinSets>
IsWellDefined( psi );
#! true
#! @EndExample
