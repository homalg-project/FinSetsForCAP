#! @Chunk SkeletalEqualizer

LoadPackage( "FinSetsForCAP" );

#! @Example
S := FinSet( 5 );
#! <An object in SkeletalFinSets>
T := FinSet( 3 );
#! <An object in SkeletalFinSets>
f1 := MapOfFinSets( S, [ 2, 2, 0, 1, 1 ], T );
#! <A morphism in SkeletalFinSets>
f2 := MapOfFinSets( S, [ 2, 1, 2, 0, 1 ], T );
#! <A morphism in SkeletalFinSets>
f3 := MapOfFinSets( S, [ 2, 0, 1, 0, 1 ], T );
#! <A morphism in SkeletalFinSets>
D := [ f1, f2, f3 ];;
Eq := Equalizer( D );
#! <An object in SkeletalFinSets>
Length( Eq );
#! 2
iota := EmbeddingOfEqualizer( D );
#! <A monomorphism in SkeletalFinSets>
Display( iota );
#! [ 2, [ 0, 4 ], 5 ]
phi := MapOfFinSets( FinSet( 2 ), [ 4, 0 ], S );;
IsWellDefined( phi );
#! true
psi := UniversalMorphismIntoEqualizer( D, phi );
#! <A morphism in SkeletalFinSets>
IsWellDefined( psi );
#! true
Display( psi );
#! [ 2, [ 1, 0 ], 2 ]
PreCompose( psi, iota ) = phi;
#! true


D := [ f2, f3 ];
#! [ <A morphism in SkeletalFinSets>, <A morphism in SkeletalFinSets> ]
Eq := Equalizer( D );
#! <An object in SkeletalFinSets>
Length( Eq );
#! 3
psi := EmbeddingOfEqualizer( D );
#! <A monomorphism in SkeletalFinSets>
Display( psi );
#! [ 3, [ 0, 3, 4 ], 5 ]
#! @EndExample
