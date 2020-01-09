#! @Chunk SkeletalCoastrictionToImage

LoadPackage( "FinSetsForCAP" );

#! @Example
m := FinSet( 7 );
#! <An object in SkeletalFinSets>
n := FinSet( 3 );
#! <An object in SkeletalFinSets>
phi := MapOfFinSets( n, [ 7, 5, 5 ], m );
#! <A morphism in SkeletalFinSets>
IsWellDefined( phi );
#! true
f := CoastrictionToImage( phi );
#! <An epimorphism in SkeletalFinSets>
Display( f );
#! [ 3, [ 2, 1, 1 ], 2 ]
IsWellDefined( f );
#! true
IsEpimorphism( f );
#! true
IsSplitEpimorphism( f );
#! true
m := FinSet( 77 );
#! <An object in SkeletalFinSets>
n := FinSet( 4 );
#! <An object in SkeletalFinSets>
phi := MapOfFinSets( n, [ 77, 2, 25, 2 ], m );
#! <A morphism in SkeletalFinSets>
IsWellDefined( phi );
#! true
iota := ImageEmbedding( phi );
#! <A monomorphism in SkeletalFinSets>
pi := CoastrictionToImage( phi );
#! <An epimorphism in SkeletalFinSets>
Display( pi );
#! [ 4, [ 3, 1, 2, 1 ], 3 ]
IsWellDefined( pi );
#! true
IsEpimorphism( pi );
#! true
IsSplitEpimorphism( pi );
#! true
PreCompose( pi, iota ) = phi;
#! true

#! @EndExample
