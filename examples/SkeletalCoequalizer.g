#! @Chunk SkeletalCoequalizer

LoadPackage( "FinSetsForCAP" );

#! @Example
s := FinSet( 5 );
#! <An object in SkeletalFinSets>
t := FinSet( 4 );
#! <An object in SkeletalFinSets>
f := MapOfFinSets( s, [ 2, 3, 3, 1, 3 ], t );
#! <A morphism in SkeletalFinSets>
g := MapOfFinSets( s, [ 2, 2, 3, 1, 3 ], t );
#! <A morphism in SkeletalFinSets>
D := [ f, g ];
#! [ <A morphism in SkeletalFinSets>, <A morphism in SkeletalFinSets> ]
C := Coequalizer( D );
#! <An object in SkeletalFinSets>
Length( C );
#! 3
pi := ProjectionOntoCoequalizer( D );
#! <An epimorphism in SkeletalFinSets>
Display( pi );
#! [ 4, [ 0, 1, 2, 2 ], 3 ]
tau := MapOfFinSets( t, [ 1, 0, 1, 1 ], FinSet( 2 ) );
#! <A morphism in SkeletalFinSets>
phi := UniversalMorphismFromCoequalizer( D, tau );
#! <A morphism in SkeletalFinSets>
Display( phi );
#! [ 3, [ 1, 0, 1 ], 2 ]
PreCompose( pi, phi ) = tau;
#! true


s := FinSet( 5 );
#! <An object in SkeletalFinSets>
t := FinSet( 4 );
#! <An object in SkeletalFinSets>
f := MapOfFinSets( s, [ 1, 2, 2, 1, 3 ], t );
#! <A morphism in SkeletalFinSets>
g := MapOfFinSets( s, [ 1, 2, 1, 1, 3 ], t );
#! <A morphism in SkeletalFinSets>
D := [ f, g ];
#! [ <A morphism in SkeletalFinSets>, <A morphism in SkeletalFinSets> ]
C := Coequalizer( D );
#! <An object in SkeletalFinSets>
Length( C );
#! 3
pi := ProjectionOntoCoequalizer( D );
#! <An epimorphism in SkeletalFinSets>
Display( pi );
#! [ 4, [ 0, 1, 1, 2 ], 3 ]
PreCompose( f, pi ) = PreCompose( g, pi );
#! true
tau := MapOfFinSets( t, [ 0, 1, 1, 0 ], FinSet( 2 ) );
#! <A morphism in SkeletalFinSets>
phi := UniversalMorphismFromCoequalizer( D, tau );
#! <A morphism in SkeletalFinSets>
Display( phi );
#! [ 3, [ 0, 1, 0 ], 2 ]
PreCompose( pi, phi ) = tau;
#! true

s := FinSet( 2 );;
t := FinSet( 3 );;
f := MapOfFinSets( s, [ 0, 1 ], t );;
IsWellDefined( f );
#! true
g := MapOfFinSets( s, [ 1, 2 ], t );;
IsWellDefined( g );
#! true
C := Coequalizer( [ f, g ] );
#! <An object in SkeletalFinSets>
Length( C );
#! 1

#! @EndExample
