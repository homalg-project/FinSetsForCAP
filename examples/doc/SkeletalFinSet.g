#! @Chunk SkeletalFinSet

LoadPackage( "FinSetsForCAP" );

#! @Example
m := FinSet( 7 );
#! |7|
Display( m );
#! { 0,..., 6 }
IsWellDefined( m );
#! true
List( m, x -> x^2 );
#! [ 0, 1, 4, 9, 16, 25, 36 ]
L := ObjectDatum( m );
#! 7
mm := ObjectConstructor( SkeletalFinSets, 7 );
#! |7|
m = mm;
#! true

n := FinSet( -2 );
#! |-2|
IsWellDefined( n );
#! false
n := FinSet( 3 );
#! |3|
IsWellDefined( n );
#! true
p := FinSet( 4 );
#! |4|
IsWellDefined( p );
#! true
IsEqualForObjects( m, n );
#! false
#! @EndExample
