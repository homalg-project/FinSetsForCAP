#! @Chunk SkeletalFinSet

LoadPackage( "FinSetsForCAP" );

#! @Example
m := FinSet( 7 );
#! <An object in SkeletalFinSets>
IsWellDefined( m );
#! true
n := FinSet( -2 );
#! <An object in SkeletalFinSets>
IsWellDefined( n );
#! false
n := FinSet( 3 );
#! <An object in SkeletalFinSets>
IsWellDefined( n );
#! true
p := FinSet( 4 );
#! <An object in SkeletalFinSets>
IsWellDefined( p );
#! true
#! @EndExample
