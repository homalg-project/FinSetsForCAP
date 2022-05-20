# SPDX-License-Identifier: GPL-2.0-or-later
# FinSetsForCAP: The elementary topos of (skeletal) finite sets
#
# Reading the declaration part of the package.
#

ReadPackage( "FinSetsForCAP", "gap/FinSetsForCAP.gd" );

ReadPackage( "FinSetsForCAP", "gap/SkeletalFinSetsForCAP.gd" );

if IsPackageMarkedForLoading( "JuliaInterface", ">= 0.2" ) then
    # COVERAGE_IGNORE_NEXT_LINE
    ReadPackage( "FinSetsForCAP", "gap/Julia.gd" );
fi;
