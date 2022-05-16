#! @Chunk SkeletalCoproduct

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
#! [ 0 .. 13 ]
iota1 := InjectionOfCofactorOfCoproduct( [ m, n, p ], 1 );
#! <A morphism in SkeletalFinSets>
IsWellDefined( iota1 );
#! true
Display( iota1 );
#! [ 7, [ 0 .. 6 ], 14 ]
iota2 := InjectionOfCofactorOfCoproduct( [ m, n, p ], 2 );
#! <A morphism in SkeletalFinSets>
IsWellDefined( iota2 );
#! true
Display( iota2 );
#! [ 3, [ 7 .. 9 ], 14 ]
iota3 := InjectionOfCofactorOfCoproduct( [ m, n, p ], 3 );
#! <A morphism in SkeletalFinSets>
IsWellDefined( iota3 );
#! true
Display( iota3 );
#! [ 4, [ 10 .. 13 ], 14 ]
psi := UniversalMorphismFromCoproduct( [ m, n, p ],
                                       [ iota1, iota2, iota3 ]
                                     );
#! <A morphism in SkeletalFinSets>
psi = IdentityMorphism( Coproduct( [ m, n, p ] ) );
#! true
#! @EndExample
