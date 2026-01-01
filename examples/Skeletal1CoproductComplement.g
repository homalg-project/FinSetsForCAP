#! @Chunk Skeletal1CoproductComplement

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
m := FinSet1( 3 );
#! |3|
n := FinSet1( 5 );
#! |5|
iota:= MapOfFinSets( m, [ 2, 5, 3 ], n );
#! |3| → |5|
Display( iota );
#! { 1, 2, 3 } ⱶ[ 2, 5, 3 ]→ { 1,..., 5 }
kappa := InjectionOfCoproductComplement( iota );
#! |2| → |5|
IsWellDefined( kappa );
#! true
Display( kappa );
#! { 1, 2 } ⱶ[ 1, 4 ]→ { 1,..., 5 }
iso := UniversalMorphismFromCoproduct( [ iota, kappa ] );
#! |5| → |5|
IsWellDefined( iso );
#! true
Display( iso );
#! { 1,..., 5 } ⱶ[ 2, 5, 3, 1, 4 ]→ { 1,..., 5 }
IsIsomorphism( iso );
#! true
#! @EndExample
