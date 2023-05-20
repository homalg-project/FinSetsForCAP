# SPDX-License-Identifier: GPL-2.0-or-later
# FinSetsForCAP: The elementary topos of (skeletal) finite sets
#
# Reading the implementation part of the package.
#

ReadPackage( "FinSetsForCAP", "gap/Tools.gi" );

ReadPackage( "FinSetsForCAP", "gap/precompiled_categories/SkeletalCategoryOfFiniteSetsWithMorphismsGivenByListsPrecompiled.gi" );

ReadPackage( "FinSetsForCAP", "gap/FinSets.gi" );

ReadPackage( "FinSetsForCAP", "gap/SkeletalFinSets.gi" );

#= comment for Julia
if IsPackageMarkedForLoading( "JuliaInterface", ">= 0.2" ) then
    # COVERAGE_IGNORE_NEXT_LINE
    ReadPackage( "FinSetsForCAP", "gap/Julia.gi" );
fi;
# =#

ReadPackage( "FinSetsForCAP", "gap/init.gi" );
