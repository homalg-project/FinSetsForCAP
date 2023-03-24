#! @Chunk FinSetNC

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
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

S := ObjectConstructor( FinSets, [ 1, 3, 2 ] );
#! <An object in FinSets>
Display( S );
#! [ 1, 3, 2 ]
L := ObjectDatum( S );
#! [ 1, 3, 2 ]
Q := ObjectConstructor( FinSets, L );
#! <An object in FinSets>
S = Q;
#! true

FinSetNC( [ 1, 2 ] ) = FinSetNC( [ 2, 1 ] );
#! false

#! @EndExample
