#! @System FinSet

LoadPackage( "FinSets" );

#! @Example
S := FinSet( [ 1, 3, 2, 2, 1 ] );
#! <An object in FinSets>
Display( S );
#! [ 1, 2, 3 ]
L := AsList( S );
#! [ 1, 2, 3 ]
Q := FinSet( L );
#! <An object in FinSets>
S = Q;
#! true
#! @EndExample