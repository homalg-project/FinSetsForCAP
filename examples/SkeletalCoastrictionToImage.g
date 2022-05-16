#! @Chunk SkeletalCoastrictionToImage

LoadPackage( "FinSetsForCAP" );

#! @Example
m := FinSet( 7 );
#! <An object in SkeletalFinSets>
n := FinSet( 3 );
#! <An object in SkeletalFinSets>
phi := MapOfFinSets( n, [ 6, 4, 4 ], m );
#! <A morphism in SkeletalFinSets>
IsWellDefined( phi );
#! true
f := CoastrictionToImage( phi );
#! <A morphism in SkeletalFinSets>
Display( f );
#! [ 3, [ 1, 0, 0 ], 2 ]
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
phi := MapOfFinSets( n, [ 76, 1, 24, 1 ], m );
#! <A morphism in SkeletalFinSets>
IsWellDefined( phi );
#! true
iota := ImageEmbedding( phi );
#! <A monomorphism in SkeletalFinSets>
pi := CoastrictionToImage( phi );
#! <A morphism in SkeletalFinSets>
Display( pi );
#! [ 4, [ 2, 0, 1, 0 ], 3 ]
IsWellDefined( pi );
#! true
IsEpimorphism( pi );
#! true
IsSplitEpimorphism( pi );
#! true
PreCompose( pi, iota ) = phi;
#! true

#! @EndExample
