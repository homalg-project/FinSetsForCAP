##################################################################################
# Test the cocartesian monoidal structure
##################################################################################

gap> START_TEST( "cocartesian_monoidal_structure" );

#
gap> LoadPackage( "FinSets", false );
true

gap> SkeletalFinSets;
SkeletalFinSets
gap> TensorUnit( SkeletalFinSets ) = TerminalObject( SkeletalFinSets );
true

gap> sFinSets := SkeletalCategoryOfFiniteSets( : cocartesian_monoidal_structure := true );
SkeletalFinSets
gap> TensorUnit( sFinSets ) = InitialObject( sFinSets );
true

gap> oFinSets := SkeletalCategoryOfFiniteSets( : cartesian_monoidal_structure := false );
SkeletalFinSets
gap> HasIsSymmetricMonoidalCategoryStructureGivenByDirectProduct( oFinSets );
false
gap> HasIsSymmetricMonoidalCategoryStructureGivenByCoproduct( oFinSets );
false

gap> SkeletalFinSets1;
SkeletalFinSets1
gap> TensorUnit( SkeletalFinSets1 ) = TerminalObject( SkeletalFinSets1 );
true

gap> sFinSets1 := SkeletalCategoryOfFiniteSetsWithCountingStartingAt1( SkeletalCategoryOfFiniteSets( : cocartesian_monoidal_structure := true ) : cocartesian_monoidal_structure := true );
SkeletalFinSets1
gap> TensorUnit( sFinSets1 ) = InitialObject( sFinSets1 );
true

gap> oFinSets1 := SkeletalCategoryOfFiniteSetsWithCountingStartingAt1( SkeletalCategoryOfFiniteSets( : cartesian_monoidal_structure := false ) : cartesian_monoidal_structure := false );
SkeletalFinSets1
gap> HasIsSymmetricMonoidalCategoryStructureGivenByDirectProduct( oFinSets1 );
false
gap> HasIsSymmetricMonoidalCategoryStructureGivenByCoproduct( oFinSets1 );
false
