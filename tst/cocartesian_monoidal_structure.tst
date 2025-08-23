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
