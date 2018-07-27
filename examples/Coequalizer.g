#! @System Coequalizer

LoadPackage( "FinSets" );

#! @Example
N := FinSet( [1,3] );
#! <An object in FinSets>
M := FinSet( [1,2,4] );
#! <An object in FinSets>
f := MapOfFinSets( N, [ [1,1], [3,2] ], M );
#! <A morphism in FinSets>
g := MapOfFinSets( N, [ [1,2], [3,4] ], M );
#! <A morphism in FinSets>
C := Coequalizer( f, g );
#! <An object in FinSets>
AsList( C );
#! [ [ 1, 2, 4 ] ]


A := FinSet( [ 1, 2, 3, 4 ] );
#! <An object in FinSets>
B := FinSet( [ 1, 2, 3, 4, 5, 6, 7, 8 ] );
#! <An object in FinSets>
f1 := MapOfFinSets( A, [ [ 1, 1 ], [ 2, 2 ], [ 3, 3 ], [ 4, 8 ] ], B );
#! <A morphism in FinSets>
f2 := MapOfFinSets( A, [ [ 1, 2 ], [ 2, 3 ], [ 3, 8 ], [ 4, 5 ] ], B );
#! <A morphism in FinSets>
f3 := MapOfFinSets( A, [ [ 1, 4 ], [ 2, 2 ], [ 3, 3 ], [ 4, 8 ] ], B );
#! <A morphism in FinSets>
C1 := Coequalizer( [ f1, f3 ] );
#! <An object in FinSets>
AsList( C1 );
#! [ [ 1, 4 ], [ 2 ], [ 3 ], [ 5 ], [ 6 ], [ 7 ], [ 8 ] ]
C2 := Coequalizer( [ f1, f2, f3 ] );
#! <An object in FinSets>
AsList( C2 );
#! [ [ 1, 2, 3, 8, 5, 4 ], [ 6 ], [ 7 ] ]


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


A := FinSet( [ 'A' ] );
#! <An object in FinSets>
B := FinSet( [ 'B' ] );
#! <An object in FinSets>
M := FinSetNC( [ A, B ] );
#! <An object in FinSets>
f := MapOfFinSetsNC( M, [ [ A, A ], [ B, A ] ], M );
#! <A morphism in FinSets>
g := IdentityMorphism( M );
#! <An identity morphism in FinSets>
C := Coequalizer( [ f, g ] );
#! <An object in FinSets>
Length( C );
#! 1
Length( AsList( C )[ 1 ] );
#! 2
Display( AsList( C )[ 1 ][ 1 ] );
#! A
Display( AsList( C )[ 1 ][ 2 ] );
#! B

#! @EndExample
