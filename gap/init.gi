# SPDX-License-Identifier: GPL-2.0-or-later
# FinSetsForCAP: The (skeletal) elementary topos of finite sets
#
# Implementations
#

BindGlobal( "init_FinSetsForCAP", function ( )
    
    ##
    BindGlobal( "FinSets", CategoryOfFiniteSets( ) );
    
    ##
    BindGlobal( "SkeletalFinSets", SkeletalCategoryOfFiniteSets( ) );
    
end );

#= comment for Julia
init_FinSetsForCAP( );
# =#
