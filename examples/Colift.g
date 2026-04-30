#! @Chunk Colift

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
m := FinSet( [ 1 .. 3 ] );
#! <An object in FinSets>
n := FinSet( [ 1 .. 4 ] );
#! <An object in FinSets>
alpha := MapOfFinSets( m, [ [ 1, 1 ], [ 2, 2 ], [ 3, 3 ] ], n );
#! <A morphism in FinSets>
beta := MapOfFinSets( m, [ [ 1, 2 ], [ 2, 2 ], [ 3, 1 ] ], m );
#! <A morphism in FinSets>
IsColiftable( alpha, beta );
#! true
chi := Colift( alpha, beta );
#! <A morphism in FinSets>
Display( chi );
#! [ [ 1 .. 4 ], [ [ 1, 2 ], [ 2, 2 ], [ 3, 1 ], [ 4, 1 ] ], [ 1 .. 3 ] ]
PreCompose( alpha, Colift( alpha, beta ) ) = beta;
#! true
IsColiftable( beta, alpha );
#! false
k := FinSet( [ 1 .. 3 ] );
#! <An object in FinSets>
h := MapOfFinSets( m, [ [ 1, 1 ], [ 2, 2 ], [ 3, 3 ] ], k );
#! <A morphism in FinSets>
IsColiftable( h, beta );
#! true
IsColiftable( beta, h );
#! false
#! @EndExample
