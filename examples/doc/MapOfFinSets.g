#! @System MapOfFinSets

LoadPackage( "FinSets" );

#! @Example
S := FinSet( [ 1, 3, 2, 2, 1 ] );
#! <An object in FinSets>
T := FinSet( [ "a", "b" ] );
#! <An object in FinSets>
G := [ [ 1, "b" ], [ 3, "b" ], [ 2, "a" ], [ 2, "b" ] ];;
phi := MapOfFinSets( S, G, T );
#! <A morphism in FinSets>
phi( 1 );
#! "b"
phi( 2 );
#! "a"
phi( 3 );
#! "b"
List( S, phi );
#! [ "b", "a", "b" ]
#! @EndExample