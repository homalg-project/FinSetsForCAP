#! @Chunk SkeletalLift

LoadPackage( "FinSetsForCAP" );

#! @Example
m := FinSet( 3 );
#! <An object in SkeletalFinSets>
n := FinSet( 4 );
#! <An object in SkeletalFinSets>
f := MapOfFinSets( m, [ 2, 2, 1 ], m );
#! <A morphism in SkeletalFinSets>
g := MapOfFinSets( n, [ 3, 2, 1, 2 ], m );
#! <A morphism in SkeletalFinSets>
IsLiftable( f, g );
#! true
chi := Lift( f, g );
#! <A morphism in SkeletalFinSets>
Display( chi );
#! [ 3, [ 2, 2, 3 ], 4 ]
PreCompose( Lift( f, g ), g ) = f;
#! true
IsLiftable( g, f );
#! false
Lift( g, f );
#! fail
#! @EndExample
