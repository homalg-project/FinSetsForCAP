#! @Chunk SkeletalColift

LoadPackage( "FinSetsForCAP" );

#! @Example
m := FinSet( 5 );
#! <An object in SkeletalFinSets>
n := FinSet( 4 );
#! <An object in SkeletalFinSets>
f := MapOfFinSets( m, [ 1, 1, 0, 0, 2 ], n );
#! <A morphism in SkeletalFinSets>
g := MapOfFinSets( m, [ 4, 4, 3, 3, 4 ], m );
#! <A morphism in SkeletalFinSets>
IsColiftable( f, g );
#! true
chi := Colift( f, g );
#! <A morphism in SkeletalFinSets>
Display( chi );
#! [ 4, [ 3, 4, 4, 0 ], 5 ]
PreCompose( f, Colift( f, g ) ) = g;
#! true
IsColiftable( g, f );
#! false
#! @EndExample
