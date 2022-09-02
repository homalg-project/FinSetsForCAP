# SPDX-License-Identifier: GPL-2.0-or-later
# FinSetsForCAP: The elementary topos of (skeletal) finite sets
#
# Implementations
#

# evaluate SafePosition( [ gvar_1, ..., gvar_n ], gvar )
CapJitAddLogicFunction( function ( tree )
  local pre_func;
    
    Info( InfoCapJit, 1, "####" );
    Info( InfoCapJit, 1, "Apply logic for evaluating SafePosition on global variables." );
    
    pre_func := function ( tree, additional_arguments )
        
        if CapJitIsCallToGlobalFunction( tree, "SafePosition" ) and tree.args.1.type = "EXPR_LIST" and ForAll( tree.args.1.list, x -> x.type = "EXPR_REF_GVAR" ) and tree.args.2.type = "EXPR_REF_GVAR" then
            
            return rec(
                type := "EXPR_INT",
                value := SafePosition( AsListMut( List( tree.args.1.list, x -> ValueGlobal( x.gvar ) ) ), ValueGlobal( tree.args.2.gvar ) ),
            );
            
        fi;
        
        return tree;
        
    end;
    
    return CapJitIterateOverTree( tree, pre_func, CapJitResultFuncCombineChildren, ReturnTrue, true );
    
end );

CapJitAddLogicTemplate(
    rec(
        variable_names := [ ],
        src_template := "1 - 1",
        dst_template := "0",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ ],
        src_template := "2 - 1",
        dst_template := "1",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number" ],
        src_template := "0 + number",
        dst_template := "number",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number" ],
        src_template := "0 * number",
        dst_template := "0",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number" ],
        src_template := "1 * number",
        dst_template := "number",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number" ],
        src_template := "number * 1",
        dst_template := "number",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number" ],
        src_template := "QUO_INT( number, 1 )",
        dst_template := "number",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "list" ],
        src_template := "list{[ ]}",
        dst_template := "[ ]",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "list" ],
        src_template := "list{[ 1 ]}",
        dst_template := "[ list[1] ]",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "entry", "pos" ],
        src_template := "[ entry ][pos]",
        dst_template := "entry",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ ],
        src_template := "Product( [ ] )",
        dst_template := "1",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "func" ],
        src_template := "Product( [ ], func )",
        dst_template := "1",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "entry" ],
        src_template := "Product( [ entry ] )",
        dst_template := "entry",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "entry1", "entry2" ],
        src_template := "Product( [ entry1, entry2 ] )",
        dst_template := "entry1 * entry2",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "entry", "func" ],
        src_template := "Product( [ entry ], func )",
        dst_template := "func( entry )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "func" ],
        src_template := "Sum( [ 1, 2 ], func )",
        dst_template := "func( 1 ) + func( 2 )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "length", "constant" ],
        src_template := "LazyArray( length, i -> constant )",
        dst_template := "LazyConstantArray( length, constant )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "length", "constant", "pos" ],
        src_template := "LazyConstantArray( length, constant )[pos]",
        dst_template := "constant",
    )
);
