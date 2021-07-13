#! @Chunk SkeletalLift

LoadPackage( "FinSetsForCAP" );

#! @Example
m := FinSet( 5 );
#! <An object in SkeletalFinSets>
n := FinSet( 4 );
#! <An object in SkeletalFinSets>
f := MapOfFinSets( m, [ 2, 2, 1, 1, 3 ], n );
#! <A morphism in SkeletalFinSets>
g := MapOfFinSets( m, [ 5, 5, 4, 4, 5 ], m );
#! <A morphism in SkeletalFinSets>
IsColiftable( f, g );
#! true
chi := Colift( f, g );
#! <A morphism in SkeletalFinSets>
Display( chi );
#! [ 4, [ 4, 5, 5, 1 ], 5 ]
PreCompose( f, Colift( f, g ) ) = g;
#! true
IsColiftable( g, f );
#! false
#! @EndExample
