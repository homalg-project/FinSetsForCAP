# SPDX-License-Identifier: GPL-2.0-or-later
# FinSetsForCAP: The elementary topos of (skeletal) finite sets
#
# Implementations
#

CapJitAddLogicFunction( function ( tree )
  local pre_func;
    
    Info( InfoCapJit, 1, "####" );
    Info( InfoCapJit, 1, "Apply logic for global functions applied to literal integers" );
    
    pre_func := function ( tree, additional_arguments )
        local args;
        
        if CapJitIsCallToGlobalFunction( tree, ReturnTrue ) then
            
            args := tree.args;
            
            if ForAll( args, a -> a.type = "EXPR_INT" ) then
                
                if tree.funcref.gvar in [ "+", "-", "*", "QUO_INT", "REM_INT" ] then
                    
                    return rec(
                               type := "EXPR_INT",
                               value := CallFuncList( ValueGlobal( tree.funcref.gvar ), AsListMut( List( args, a -> a.value ) ) ),
                               );
                    
                # elif tree.funcref.gvar in [ "=" ] then
                #
                # if CallFuncList( ValueGlobal( tree.funcref.gvar ), AsListMut( List( args, a -> a.value ) ) ) then
                # return rec( type := "EXPR_TRUE" );
                # else
                # return rec( type := "EXPR_FALSE" );
                # fi;
                    
                fi;
                
            fi;
            
        fi;
        
        return tree;
        
    end;
    
    return CapJitIterateOverTree( tree, pre_func, CapJitResultFuncCombineChildren, ReturnTrue, true );
    
end );

## for PushoutComplement
CapJitAddLogicTemplate(
    rec(
        variable_names := [ ],
        src_template := "Filtered( [ 0, 1, 2, 3 ], x -> CAP_JIT_INTERNAL_EXPR_CASE( x = 3, 1, true, 0 ) = REM_INT( x, 2 ) )",
        dst_template := "[ 0, 2, 3 ]",
    )
);

## for PushoutComplement
CapJitAddLogicTemplate(
    rec(
        variable_names := [ ],
        src_template := "0 in [ 0, 2, 3 ]",
        dst_template := "true",
    )
);

## for PushoutComplement
CapJitAddLogicTemplate(
    rec(
        variable_names := [ ],
        src_template := "1 in [ 0, 2, 3 ]",
        dst_template := "false",
    )
);

## for PushoutComplement
CapJitAddLogicTemplate(
    rec(
        variable_names := [ ],
        src_template := "2 in [ 0, 2, 3 ]",
        dst_template := "true",
    )
);

## for PushoutComplement
CapJitAddLogicTemplate(
    rec(
        variable_names := [ ],
        src_template := "3 in [ 0, 2, 3 ]",
        dst_template := "true",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "last", "func" ],
        src_template := "List( [ 0 .. last ], x -> List( [ 0 .. last ], func )[1 + x] )",
        dst_template := "List( [ 0 .. last ], func )", # actually: List( List( [ 0 .. last ], func ), x -> x )
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "last", "list_independent_of_x", "func" ],
        src_template := "List( [ 0 .. last ], x -> list_independent_of_x[1 + List( [ 0 .. last ], func )[1 + x]] )",
        dst_template := "List( List( [ 0 .. last ], func ), y -> list_independent_of_x[1 + y] )",
        new_funcs := [ [ "y" ] ],
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "last", "func1", "func2" ],
        src_template := "Filtered( [ 0 .. last ], x -> List( [ 0 .. last ], func1 )[1 + x] = List( [ 0 .. last ], func2 )[1 + x] )",
        dst_template := "Filtered( [ 0 .. last ], x -> func1( x ) = func2( x ) )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number" ],
        variable_filters := [ IsInt ],
        src_template := "0 + number",
        dst_template := "number",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number" ],
        variable_filters := [ IsInt ],
        src_template := "number + 0",
        dst_template := "number",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number" ],
        variable_filters := [ IsInt ],
        src_template := "number * 1",
        dst_template := "number",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number" ],
        variable_filters := [ IsInt ],
        src_template := "1 * number",
        dst_template := "number",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number" ],
        variable_filters := [ IsInt ],
        src_template := "0 * number",
        dst_template := "0",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number" ],
        variable_filters := [ IsInt ],
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
        variable_names := [ "list", "constant" ],
        src_template := "List( list, i -> constant )",
        dst_template := "ListWithIdenticalEntries( Length( list ), constant )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "length", "constant", "pos" ],
        src_template := "ListWithIdenticalEntries( length, constant )[pos]",
        dst_template := "constant",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "pos_end", "index" ],
        variable_filters := [ IsInt, IsInt ],
        src_template := "[ 0 .. pos_end ][index]",
        dst_template := "index - 1",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number" ],
        variable_filters := [ IsInt ],
        src_template := "(1 + number) - 1",
        dst_template := "number",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number1", "number2" ],
        variable_filters := [ IsInt, IsInt ],
        src_template := "number1 in [ number2 ]",
        dst_template := "number1 = number2",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "entry", "func" ],
        src_template := "ForAll( [ entry ], func )",
        dst_template := "func( entry )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "entry", "list" ],
        src_template := "entry in SSortedList( list )",
        dst_template := "entry in list",
    )
);
