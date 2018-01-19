#! @System FinSetNC

LoadPackage( "FinSets" );

#! @Example
S := FinSetNC( [ 1, 3, 2 ] );
#! <An object in FinSets>
Display( S );
#! [ 1, 3, 2 ]
L := AsList( S );
#! [ 1, 3, 2 ]
Q := FinSetNC( L );
#! <An object in FinSets>
S = Q;
#! true
#! @EndExample
