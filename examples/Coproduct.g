#! @System Coproduct

LoadPackage( "FinSets" );

#! @Example
S := FinSet( [ 1, 2, 3 ] );
#! <An object in FinSets>
Length( S );
#! 3
T := FinSet( [ "a", "b" ] );
#! <An object in FinSets>
Length( T );
#! 2
C := Coproduct( T, S );
#! <An object in FinSets>
Length( C );
#! 5
Display( C );
#! [ [ 1, "a" ], [ 1, "b" ], [ 2, 1 ], [ 2, 2 ], [ 2, 3 ] ]
#! @EndExample
