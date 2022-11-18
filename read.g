# SPDX-License-Identifier: GPL-2.0-or-later
# FinSetsForCAP: The elementary topos of (skeletal) finite sets
#
# Reading the implementation part of the package.
#

ReadPackage( "FinSetsForCAP", "gap/Tools.gi" );

#= comment for Julia
ReadPackage( "FinSetsForCAP", "gap/precompiled_categories/CategoryOfSkeletalFinSetsPrecompiled.gi" );
# =#

ReadPackage( "FinSetsForCAP", "gap/FinSetsForCAP.gi" );

ReadPackage( "FinSetsForCAP", "gap/SkeletalFinSetsForCAP.gi" );

#= comment for Julia
if IsPackageMarkedForLoading( "JuliaInterface", ">= 0.2" ) then
    # COVERAGE_IGNORE_NEXT_LINE
    ReadPackage( "FinSetsForCAP", "gap/Julia.gi" );
fi;
# =#
