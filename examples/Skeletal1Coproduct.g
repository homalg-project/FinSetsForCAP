#! @Chunk Skeletal1Coproduct

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
m := FinSet1( 7 );
#! |7|
n := FinSet1( 3 );
#! |3|
p := FinSet1( 4 );
#! |4|
c := Coproduct( m, n, p );
#! |14|
Display( AsList( c ) );
#! [ 1 .. 14 ]
iota1 := InjectionOfCofactorOfCoproduct( [ m, n, p ], 1 );
#! |7| → |14|
IsWellDefined( iota1 );
#! true
Display( iota1 );
#! { 1,..., 7 } ⱶ[ 1, 2, 3, 4, 5, 6, 7 ]→ { 1,..., 14 }
iota2 := InjectionOfCofactorOfCoproduct( [ m, n, p ], 2 );
#! |3| → |14|
IsWellDefined( iota2 );
#! true
Display( iota2 );
#! { 1, 2, 3 } ⱶ[ 8, 9, 10 ]→ { 1,..., 14 }
iota3 := InjectionOfCofactorOfCoproduct( [ m, n, p ], 3 );
#! |4| → |14|
IsWellDefined( iota3 );
#! true
Display( iota3 );
#! { 1,..., 4 } ⱶ[ 11, 12, 13, 14 ]→ { 1,..., 14 }
psi := UniversalMorphismFromCoproduct(
               [ m, n, p ], [ iota1, iota2, iota3 ] );
#! |14| → |14|
id := IdentityMorphism( Coproduct( [ m, n, p ] ) );
#! |14| → |14|
psi = id;
#! true
#! @EndExample
