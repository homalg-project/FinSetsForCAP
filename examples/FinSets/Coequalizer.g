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
#! @EndExample
