# SPDX-License-Identifier: GPL-2.0-or-later
# FinSetsForCAP: The elementary topos of (skeletal) finite sets
#
# Implementations
#

BindGlobal( "init_FinSetsForCAP", function ( )
    
    ##
    BindGlobal( "FinSets", CategoryOfFinSets( ) );
    
    ##
    BindGlobal( "SkeletalFinSetsWithMorphismsGivenByFunctions", CategoryOfSkeletalFinSetsWithMorphismsGivenByFunctions( ) );
    
    ##
    BindGlobal( "SkeletalFinSetsWithMorphismsGivenByLists", CategoryOfSkeletalFinSetsWithMorphismsGivenByLists( ) );
    
    ##
    BindGlobal( "SkeletalFinSets", SkeletalFinSetsWithMorphismsGivenByLists );
    
end );

#= comment for Julia
init_FinSetsForCAP( );
# =#
