#! @System SkeletalDirectProduct

LoadPackage( "FinSetsForCAP" );

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
#! [ 84, 
#!   [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 
#!       2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 
#!       4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 
#!       6, 6, 6, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 ], 7 
#!  ]
pi2 := ProjectionInFactorOfDirectProduct( [ m, n, p ], 2 );
#! <A morphism in SkeletalFinSets>
Display( pi2 );
#! [ 84, 
#!   [ 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 
#!       3, 3, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 1, 1, 1, 1, 2, 2, 2, 
#!       2, 3, 3, 3, 3, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 1, 1, 1, 1, 
#!       2, 2, 2, 2, 3, 3, 3, 3, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3 ], 3 
#!  ]
pi3 := ProjectionInFactorOfDirectProduct( [ m, n, p ], 3 );
#! <A morphism in SkeletalFinSets>
Display( pi3 );
#! [ 84, 
#!   [ 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 
#!       3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 
#!       4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 
#!       1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4 ], 4 
#!  ]
psi := UniversalMorphismIntoDirectProduct( [ m, n, p ], [ pi1, pi2, pi3 ] );
#! <A morphism in SkeletalFinSets>
psi = IdentityMorphism( d );
#! true
#! @EndExample
