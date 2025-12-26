LoadPackage( "FinSetsForCAP" );

a := FinSet1( 3 );
b := FinSet1( 4 );
maps := MorphismsOfExternalHom( a, b );

c := FinSet1( 5 );
id_c := IdentityMorphism( c );

maps_x1 := List( maps, map -> DirectProductFunctorial( [ map, id_c ] ) );

pr_a := ProjectionInFactorOfDirectProduct( [ a, c ], 1 );
pr_b := ProjectionInFactorOfDirectProduct( [ b, c ], 1 );

Assert( 0, List( maps_x1, map_x1 -> Colift( pr_a, PreCompose( map_x1, pr_b ) ) ) = maps );
