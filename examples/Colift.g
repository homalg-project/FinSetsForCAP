#! @Chunk Colift

LoadPackage( "FinSetsForCAP" );

#! @Example
m := FinSet( [ 1 .. 5 ] );
#! <An object in FinSets>
n := FinSet( [ 1 .. 4 ] );
#! <An object in FinSets>
f := MapOfFinSets(
             m,
             [ [ 1, 2 ], [ 2, 2 ], [ 3, 1 ], [ 4, 1 ], [ 5, 3 ] ],
             n );
#! <A morphism in FinSets>
g := MapOfFinSets(
             m,
             [ [ 1, 5 ], [ 2, 5 ], [ 3, 4 ], [ 4, 4 ], [ 5, 5 ] ],
             m );
#! <A morphism in FinSets>
IsColiftable( f, g );
#! true
chi := Colift( f, g );
#! <A morphism in FinSets>
Display( chi );
#! [ [ 1 .. 4 ], [ [ 1, 4 ], [ 2, 5 ], [ 3, 5 ], [ 4, 1 ] ], [ 1 .. 5 ] ]
PreCompose( f, Colift( f, g ) ) = g;
#! true
IsColiftable( g, f );
#! false
#! @EndExample
