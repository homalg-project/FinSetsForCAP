#! @System IsEqualForElementsOfFinSets

LoadPackage( "FinSetsForCAP" );

#! @Example

IsEqualForElementsOfFinSets( 2, 2 );
#! true
IsEqualForElementsOfFinSets( 2, "2" );
#! false
IsEqualForElementsOfFinSets( [ 2 ], [ 2 ] );
#! true
IsEqualForElementsOfFinSets( [ 2 ], [ 2, 3 ] );
#! false
IsEqualForElementsOfFinSets( [ , 2 ], [ 2, 2 ] );
#! false
IsEqualForElementsOfFinSets( rec( a := "a", b := "b" ),
                             rec( b := "b", a := "a" )
                           );
#! true
IsEqualForElementsOfFinSets( rec( a := "a", b := "b" ),
                             rec( a := "a" )
                           );
#! false
IsEqualForElementsOfFinSets( rec( a := "a", b := "b" ),
                             rec( a := "a", b := "notb" )
                           );
#! false

M := FinSet( [ ] );;
N := FinSet( [ ] );;
m := FinSet( 0 );;
id_M := IdentityMorphism( M );;
id_N := IdentityMorphism( N );;
id_m := IdentityMorphism( m );;

IsEqualForElementsOfFinSets( M, N );
#! true
IsEqualForElementsOfFinSets( M, m );
#! false
IsEqualForElementsOfFinSets( id_M, id_N );
#! true
IsEqualForElementsOfFinSets( id_M, id_m );
#! false

IsEqualForElementsOfFinSets( FinSets, SkeletalFinSets );
#! false

#! @EndExample
