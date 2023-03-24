#! @Chunk Several categories

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
S := FinSet( 3 );;
cat := CategoryOfSkeletalFinSets();;
T := FinSet( cat, 3 );;
IsIdenticalObj( CapCategory( T ), CapCategory( S ) );
#! false
alpha := MapOfFinSets( S, [ 2,3,1 ], S );;
beta := MapOfFinSets( T, [ 2,3,1 ], T );;
IsIdenticalObj( CapCategory( alpha ), CapCategory( beta ) );
#! false
#! @EndExample
