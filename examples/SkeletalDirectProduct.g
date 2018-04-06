#! @System SkeletalDirectProduct

LoadPackage( "FinSets" );

#! @Example
m := FinSet( 7 );
#! <An object in SkeletalFinSets>
n := FinSet( 3 );
#! <An object in SkeletalFinSets>
p := FinSet( 4 );
#! <An object in SkeletalFinSets>
d := DirectProduct( [ m, n, p ] );
#! <An object in SkeletalFinSets>
AsList( d );
#! [ 1 .. 84 ]
pi1 := ProjectionInFactorOfDirectProduct( [ m, n, p ], 1 );
#! <A morphism in SkeletalFinSets>
Display( pi1 );
#! [ 84, [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3,
#!      3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6,
#!      6, 6, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ], 7 ]
pi3 := ProjectionInFactorOfDirectProduct( [ m, n, p ], 3 );
#! <A morphism in SkeletalFinSets>
Display( pi3 );
#! [ 84, [ 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1,
#!      2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2,
#!      3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4 ], 4 ]
#! @EndExample
