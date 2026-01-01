#! @Chunk Skeletal1FinSet

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
m := FinSet1( 7 );
#! |7|
Display( m );
#! { 1,..., 7 }
IsWellDefined( m );
#! true
String( m );
#! "FinSet( SkeletalFinSets1, 7 )"
Display( List( m, x -> x^2 ) );
#! [ 1, 4, 9, 16, 25, 36, 49 ]
L := ObjectDatum( m );
#! 7
mm := ObjectConstructor( SkeletalFinSets1, BigInt( 7 ) );
#! |7|
m = mm;
#! true

n := FinSet1( -2 );
#! |-2|
IsWellDefined( n );
#! false
n := FinSet1( 3 );
#! |3|
IsWellDefined( n );
#! true
p := FinSet1( 4 );
#! |4|
IsWellDefined( p );
#! true
IsEqualForObjects( m, n );
#! false
#! @EndExample
