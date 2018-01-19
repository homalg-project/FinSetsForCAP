#! @System Coequalizer

LoadPackage( "FinSets" );

#! @Example
S := FinSet( [ 1 .. 5 ] );
#! <An object in FinSets>
T := FinSet( [ 1 .. 4 ] );
#! <An object in FinSets>
f := MapOfFinSets( S, [ [1,2], [2,4], [3,4], [4,3], [5,4] ], T );
#! <A morphism in FinSets>
g := MapOfFinSets( S, [ [1,2], [2,3], [3,4], [4,3], [5,4] ], T );
#! <A morphism in FinSets>
C := Coequalizer( f, g );
#! <An object in FinSets>
Display( C );
#! [ [  1 ],
#!   [  2 ],
#!   [  3,  4 ] ]


S := FinSet( [ 1, 2, 3, 4, 5 ] );
#! <An object in FinSets>
T := FinSet( [ 1, 2, 3, 4 ] );
#! <An object in FinSets>
f := MapOfFinSets( S, [ [ 1, 3 ], [ 2, 4 ], [ 3, 4 ], [ 4, 2 ], [ 5, 4 ] ], T );
#! <A morphism in FinSets>
g := MapOfFinSets( S, [ [ 1, 3 ], [ 2, 3 ], [ 3, 4 ], [ 4, 2 ], [ 5, 4 ] ], T );
#! <A morphism in FinSets>
D := [ f, g ];
#! [ <A morphism in FinSets>, <A morphism in FinSets> ]
C := Coequalizer( D );
#! <An object in FinSets>
AsList( C );
#! [ [ 1 ], [ 2 ], [ 3, 4 ] ]
pi := ProjectionOntoCoequalizer( D );
#! <An epimorphism in FinSets>
AsList( pi );
#! [ [ 1, [ 1 ] ], [ 2, [ 2 ] ], [ 3, [ 3, 4 ] ], [ 4, [ 3, 4 ] ] ]
tau := MapOfFinSets( T, [ [ 1, 2 ], [ 2, 1 ], [ 3, 2 ], [ 4, 2 ] ], FinSet( [ 1, 2 ] ) );
#! <A morphism in FinSets>
phi := UniversalMorphismFromCoequalizer( D, tau );
#! <A morphism in FinSets>
AsList( phi );
#! [ [ [ 1 ], 2 ], [ [ 2 ], 1 ], [ [ 3, 4 ], 2 ] ]
PreCompose( pi, phi ) = tau;
#! true


S := FinSet( [ 1, 2, 3, 4, 5 ] );
#! <An object in FinSets>
T := FinSet( [ 1, 2, 3, 4 ] );
#! <An object in FinSets>
f := MapOfFinSets( S, [ [ 1, 2 ], [ 2, 3 ], [ 3, 3 ], [ 4, 2 ], [ 5, 4 ] ], T );
#! <A morphism in FinSets>
g := MapOfFinSets( S, [ [ 1, 2 ], [ 2, 3 ], [ 3, 2 ], [ 4, 2 ], [ 5, 4 ] ], T );
#! <A morphism in FinSets>
D := [ f, g ];
#! [ <A morphism in FinSets>, <A morphism in FinSets> ]
C := Coequalizer( D );
#! <An object in FinSets>
AsList( C );
#! [ [ 1 ], [ 2, 3 ], [ 4 ] ]
pi := ProjectionOntoCoequalizer( D );
#! <An epimorphism in FinSets>
AsList( pi );
#! [ [ 1, [ 1 ] ], [ 2, [ 2, 3 ] ], [ 3, [ 2, 3 ] ], [ 4, [ 4 ] ] ]
PreCompose( f, pi ) = PreCompose( g, pi );
#! true
tau := MapOfFinSets( T, [ [ 1, 1 ], [ 2, 2 ], [ 3, 2 ], [ 4, 1 ] ], FinSet( [ 1, 2 ] ) );
#! <A morphism in FinSets>
phi := UniversalMorphismFromCoequalizer( D, tau );
#! <A morphism in FinSets>
AsList( phi );
#! [ [ [ 1 ], 1 ], [ [ 2, 3 ], 2 ], [ [ 4 ], 1 ] ]
PreCompose( pi, phi ) = tau;
#! true
#! @EndExample
