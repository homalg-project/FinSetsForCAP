#! @System SkeletalCoproduct

LoadPackage( "FinSetsForCAP" );

#! @Example
m := FinSet( 7 );
#! <An object in SkeletalFinSets>
n := FinSet( 3 );
#! <An object in SkeletalFinSets>
p := FinSet( 4 );
#! <An object in SkeletalFinSets>
c := Coproduct( m, n, p );
#! <An object in SkeletalFinSets>
AsList( c );
#! [ 1 .. 14 ]
iota1 := InjectionOfCofactorOfCoproduct( [ m, n, p ], 1 );
#! <A morphism in SkeletalFinSets>
IsWellDefined( iota1 );
#! true
Display( iota1 );
#! [ 7, [ 1, 2, 3, 4, 5, 6, 7 ], 14 ]
iota3 := InjectionOfCofactorOfCoproduct( [ m, n, p ], 3 );
#! <A morphism in SkeletalFinSets>
Display( iota3 );
#! [ 4, [ 11, 12, 13, 14 ], 14 ]
#! @EndExample
