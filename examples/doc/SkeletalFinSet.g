#! @Chunk SkeletalFinSet

LoadPackage( "FinSetsForCAP" );

#! @Example
m := FinSet( 7 );
#! <An object in SkeletalFinSets>
IsWellDefined( m );
#! true
List( m, x -> x^2 );
#! [ 0, 1, 4, 9, 16, 25, 36 ]
L := ObjectDatum( m );
#! 7
Display( m );
#! 7
mm := ObjectConstructor( SkeletalFinSets, 7 );
#! <An object in SkeletalFinSets>
m = mm;
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
IsEqualForObjects( m, n );
#! false
#! @EndExample
