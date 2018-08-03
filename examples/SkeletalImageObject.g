#! @System SkeletalImageObject

LoadPackage( "FinSetsForCAP" );

#! @Example
m := FinSet( 7 );
#! <An object in SkeletalFinSets>
n := FinSet( 3 );
#! <An object in SkeletalFinSets>
phi := MapOfFinSets( n, [7, 5, 5], m );
#! <A morphism in SkeletalFinSets>
IsWellDefined( phi );
#! true
ImageObject( phi );
#! <An object in SkeletalFinSets>
Length( ImageObject( phi ) );
#! 2
s := FinSet( 2 );
#! <An object in SkeletalFinSets>
I := ImageObject( phi, s );
#! <An object in SkeletalFinSets>
Length( I );
#! 2
#! @EndExample
