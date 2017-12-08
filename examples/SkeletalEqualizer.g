#! @System SkeletalEqualizer

LoadPackage( "FinSets" );

#! @Example
S := FinSet( 5 );
#! <An object in SkeletalFinSets>
T := FinSet( 3 );
#! <An object in SkeletalFinSets>
f1 := MapOfFinSets( S, [ 3, 3, 1, 2, 2], T );
#! <A morphism in SkeletalFinSets>
f2 := MapOfFinSets( S, [ 3, 2, 3, 1, 2], T );
#! <A morphism in SkeletalFinSets>
f3 := MapOfFinSets( S, [ 3, 1, 2, 1, 2], T );
#! <A morphism in SkeletalFinSets>
D := [ f1, f2, f3 ];
#! [ <A morphism in SkeletalFinSets>, <A morphism in SkeletalFinSets>, <A morphism in SkeletalFinSets> ]
Eq := Equalizer( D );
#! <An object in SkeletalFinSets>
Length( Eq );
#! 2
psi := EmbeddingOfEqualizer( D );
#! <A morphism in SkeletalFinSets>
Display( psi );
#! [ 2, [ 1, 5 ], 5 ]
D := [ f2, f3 ];
#! [ <A morphism in SkeletalFinSets>, <A morphism in SkeletalFinSets> ]
Eq := Equalizer( D );
#! <An object in SkeletalFinSets>
Length( Eq );
#! 3
psi := EmbeddingOfEqualizer( D );
#! <A morphism in SkeletalFinSets>
Display( psi );
#! [ 3, [1, 4, 5], 5 ]
#! @EndExample
