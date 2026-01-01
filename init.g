# SPDX-License-Identifier: GPL-2.0-or-later
# FinSetsForCAP: The (skeletal) elementary topos of finite sets
#
# Reading the declaration part of the package.
#

ReadPackage( "FinSetsForCAP", "gap/Tools.gd" );

ReadPackage( "FinSetsForCAP", "gap/FinSets.gd" );

ReadPackage( "FinSetsForCAP", "gap/SkeletalFinSets.gd" );

ReadPackage( "FinSetsForCAP", "gap/SkeletalFinSetsWithCountingStartingAt1.gd" );

#= comment for Julia
if IsPackageMarkedForLoading( "JuliaInterface", ">= 0.2" ) then
    # COVERAGE_IGNORE_NEXT_LINE
    ReadPackage( "FinSetsForCAP", "gap/Julia.gd" );
fi;
# =#
