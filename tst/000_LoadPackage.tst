#
# FinSetsForCAP: The elementary topos of (skeletal) finite sets
#
# This file tests if the package can be loaded without errors or warnings.
#
gap> package_loading_info_level := InfoLevel( InfoPackageLoading );;
gap> SetInfoLevel( InfoPackageLoading, PACKAGE_ERROR );;
gap> LoadPackage( "FinSetsForCAP", false );
true
gap> SetInfoLevel( InfoPackageLoading, PACKAGE_INFO );;
gap> LoadPackage( "FinSetsForCAP" );
true
gap> SetInfoLevel( InfoPackageLoading, package_loading_info_level );;
