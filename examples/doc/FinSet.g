#! @System FinSet

LoadPackage( "FinSetsForCAP" );

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

FinSet( [ 1, 2 ] ) = FinSet( [ 2, 1 ] );
#! true

M := FinSetNC( [ , 1, 2, 3 ] );
#! <An object in FinSets>
IsWellDefined( M );
#! false
M := FinSetNC( [ 1, 2, 3, 3 ] );
#! <An object in FinSets>
IsWellDefined( M );
#! false

#! @EndExample
