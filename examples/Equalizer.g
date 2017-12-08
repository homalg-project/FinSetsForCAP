#! @System Equalizer

LoadPackage( "FinSets" );

#! @Example
S := FinSet( [ 1 .. 5 ] );
#! <An object in FinSets>
T := FinSet( [ 1 .. 3 ] );
#! <An object in FinSets>
f1 := MapOfFinSets( S, [ [1,3],[2,3],[3,1],[4,2],[5,2] ], T );
#! <A morphism in FinSets>
f2 := MapOfFinSets( S, [ [1,3],[2,2],[3,3],[4,1],[5,2] ], T );
#! <A morphism in FinSets>
f3 := MapOfFinSets( S, [ [1,3],[2,1],[3,2],[4,1],[5,2] ], T );
#! <A morphism in FinSets>
D := [ f1, f2, f3 ];
#! [ <A morphism in FinSets>, <A morphism in FinSets>, <A morphism in FinSets> ]
Eq := Equalizer( D );
#! <An object in FinSets>
Display( Eq );
#! [ 1, 5 ]
Im := ImageObject( EmbeddingOfEqualizer( D ) );
#! <An object in FinSets>
Display( Im );
#! [ 1, 5 ]
#! @EndExample
