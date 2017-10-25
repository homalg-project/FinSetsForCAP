#! @System WellDefined

LoadPackage( "FinSets" );

#! @Example
s := FinSet( 7 );
#! <An object in SkeletalFinSets>
t := FinSet( 4 );
#! <An object in SkeletalFinSets>
psi := MapOfFinSets( s, [1, 3, 2, 3, 2, 4] ,t );
#! <A morphisms in SkeletalFinSets>
IsWellDefined( psi );
#! false
psi := MapOfFinSets( s, [2, 3, 2, 5, 3, 2, 4] ,t );
#! <A morphisms in SkeletalFinSets>
IsWellDefined( psi );
#! false
			IsEpimorphism( psi );
			#! true		##Is that a problem? ##says it's an epi although not welldefined! ##
psi:= MapOfFinSets( s, [1, 3, 2, 4, 3, 2, 4] ,t );
#! <A morphisms in SkeletalFinSets>
IsWellDefined( psi );
#! true
#! @EndExample