#! @Chunk Lift

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
m := FinSet( [ 1 .. 3 ] );
#! <An object in FinSets>
n := FinSet( [ 1 .. 4 ] );
#! <An object in FinSets>
f := MapOfFinSets( m, [ [ 1, 2 ], [ 2, 2 ], [ 3, 1 ] ], m );
#! <A morphism in FinSets>
g := MapOfFinSets( n, [ [ 1, 3 ], [ 2, 2 ], [ 3, 1 ], [ 4, 2 ] ], m );
#! <A morphism in FinSets>
IsLiftable( f, g );
#! true
chi := Lift( f, g );
#! <A morphism in FinSets>
Display( chi );
#! [ [ 1 .. 3 ], [ [ 1, 2 ], [ 2, 2 ], [ 3, 3 ] ], [ 1 .. 4 ] ]
PreCompose( Lift( f, g ), g ) = f;
#! true
IsLiftable( g, f );
#! false
k := FinSet( [ 1 .. 100 ] );
#! <An object in FinSets>
h := ListWithIdenticalEntries( Length( k ) - 3, 3 );;
h := Concatenation( h, [ 2, 1, 2 ] );;
h := MapOfFinSets( k, List( k, i -> [ i, h[i] ] ), m );
#! <A morphism in FinSets>
IsLiftable( f, h );
#! true
IsLiftable( h, f );
#! false
#! @EndExample
