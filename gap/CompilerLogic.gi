# SPDX-License-Identifier: GPL-2.0-or-later
# FinSetsForCAP: The elementary topos of (skeletal) finite sets
#
# Implementations
#

##
CapJitAddLogicFunction( function ( tree )
  local pre_func;
    
    Info( InfoCapJit, 1, "####" );
    Info( InfoCapJit, 1, "Apply logic for global functions applied to literal integers" );
    
    pre_func := function ( tree, additional_arguments )
      local args, is_big_int, values;
        
        if CapJitIsCallToGlobalFunction( tree, ReturnTrue ) then
            
            args := tree.args;
            
            if ForAll( args, a -> a.type = "EXPR_INT" or (CapJitIsCallToGlobalFunction( a, "BigInt" ) and a.args.1.type = "EXPR_INT") ) then
                
                is_big_int := false;
                
                values := AsListMut( List( args, function ( a )
                    
                    if a.type = "EXPR_INT" then
                        
                        return a.value;
                        
                    elif CapJitIsCallToGlobalFunction( a, "BigInt" ) and a.args.1.type = "EXPR_INT" then
                        
                        is_big_int := true;
                        
                        return a.args.1.value;
                        
                    else
                        
                        # COVERAGE_IGNORE_NEXT_LINE
                        Error( "this should never happen" );
                        
                    fi;
                    
                end ) );
                
                if tree.funcref.gvar in [ "+", "-", "*", "QUO_INT", "REM_INT", "RemIntWithDomain", "QuoIntWithDomain" ] then
                    
                    tree := rec(
                        type := "EXPR_INT",
                        value := CallFuncList( ValueGlobal( tree.funcref.gvar ), values ),
                    );
                    
                    if is_big_int then
                        
                        tree := rec(
                            type := "EXPR_FUNCCALL",
                            funcref := rec(
                                type := "EXPR_REF_GVAR",
                                gvar := "BigInt",
                            ),
                            args := AsSyntaxTreeList( [ tree ] ),
                        );
                        
                    fi;
                    
                # elif tree.funcref.gvar in [ "=" ] then
                #
                # if CallFuncList( ValueGlobal( tree.funcref.gvar ), AsListMut( values ) ) then
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

## Teach CompilerForCAP about the input type of the function so it can correctly type the function,
## that can be done with the following code (adapted from the existing List type signature):
##
CapJitAddTypeSignature( "List", [ IsObjectInSkeletalCategoryOfFiniteSets, IsFunction ], function ( args, func_stack )
    
    args := ShallowCopy( args );
    
    args.2 := CAP_JIT_INTERNAL_INFERRED_DATA_TYPES_OF_FUNCTION_BY_ARGUMENTS_TYPES( args.2, [ rec( filter := IsBigInt ) ], func_stack );
    
    if args.2 = fail then
        
        #Error( "could not determine output type" );
        return fail;
        
    fi;
    
    return rec( args := args, output_type := CapJitDataTypeOfListOf( args.2.data_type.signature[2] ) );
    
end );

##
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "M", "func" ],
        variable_filters := [ IsObjectInSkeletalCategoryOfFiniteSets, IsObject ],
        src_template := "List( M, func )",
        dst_template := "List( [ 0 .. Length( M ) - 1 ], func )",
    )
);

## for TruthMorphismOfImplies
CapJitAddLogicTemplate(
    rec(
        variable_names := [ ],
        src_template := "BigInt( 0 ) = BigInt( 3 )",
        dst_template := "false",
    )
);

## for TruthMorphismOfImplies
CapJitAddLogicTemplate(
    rec(
        variable_names := [ ],
        src_template := "BigInt( 1 ) = BigInt( 3 )",
        dst_template := "false",
    )
);

## for TruthMorphismOfImplies
CapJitAddLogicTemplate(
    rec(
        variable_names := [ ],
        src_template := "BigInt( 2 ) = BigInt( 3 )",
        dst_template := "false",
    )
);

## for TruthMorphismOfImplies
CapJitAddLogicTemplate(
    rec(
        variable_names := [ ],
        src_template := "Filtered( [ BigInt( 0 ), BigInt( 1 ), BigInt( 2 ), BigInt( 3 ) ], x -> [ BigInt( 0 ), BigInt( 0 ), BigInt( 0 ), BigInt( 1 ) ][1 + x] = [ BigInt( 0 ), BigInt( 1 ), BigInt( 0 ), BigInt( 1 ) ][1 + x] )",
        dst_template := "[ BigInt( 0 ), BigInt( 2 ), BigInt( 3 ) ]",
    )
);

## for TruthMorphismOfImplies
CapJitAddLogicTemplate(
    rec(
        variable_names := [ ],
        src_template := "BigInt( 0 ) in [ BigInt( 0 ), BigInt( 2 ), BigInt( 3 ) ]",
        dst_template := "true",
    )
);

## for TruthMorphismOfImplies
CapJitAddLogicTemplate(
    rec(
        variable_names := [ ],
        src_template := "BigInt( 1 ) in [ BigInt( 0 ), BigInt( 2 ), BigInt( 3 ) ]",
        dst_template := "false",
    )
);

## for TruthMorphismOfImplies
CapJitAddLogicTemplate(
    rec(
        variable_names := [ ],
        src_template := "BigInt( 2 ) in [ BigInt( 0 ), BigInt( 2 ), BigInt( 3 ) ]",
        dst_template := "true",
    )
);

## for TruthMorphismOfImplies
CapJitAddLogicTemplate(
    rec(
        variable_names := [ ],
        src_template := "BigInt( 3 ) in [ BigInt( 0 ), BigInt( 2 ), BigInt( 3 ) ]",
        dst_template := "true",
    )
);

## for TruthMorphismOfImplies
CapJitAddLogicTemplate(
    rec(
        variable_names := [ ],
        src_template := "[ 0 .. BigInt( 0 ) ]",
        dst_template := "[ BigInt( 0 ) ]",
    )
);

## for TruthMorphismOfImplies
CapJitAddLogicTemplate(
    rec(
        variable_names := [ ],
        src_template := "[ 0 .. BigInt( 3 ) ]",
        dst_template := "[ BigInt( 0 ), BigInt( 1 ), BigInt( 2 ), BigInt( 3 ) ]",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number", "a" ],
        src_template := "RemIntWithDomain( number, a, a )",
        dst_template := "number",
    )
);

## for PushoutComplement
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number", "q", "d", "qd" ],
        src_template := "RemIntWithDomain( number, d, DivIntWithGivenQuotient( qd, q, d ) )",
        dst_template := "number",
    )
);

## for PushoutComplement
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "list" ],
        variable_filters := [ IsList ],
        src_template := "List( [ 0 .. Length( list ) - 1 ], x -> list[1 + x] )",
        dst_template := "list",
    )
);

## for PushoutComplement
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "x" ],
        variable_filters := [ IsInt ],
        src_template := "[ BigInt( 1 ), BigInt( 0 ), BigInt( 1 ), BigInt( 1 ) ][1 + x]",
        dst_template := "CAP_JIT_INTERNAL_EXPR_CASE( x = BigInt( 1 ), BigInt( 0 ), true, BigInt( 1 ) )",
    )
);

# this logic template is already covered by generalized loop fusion, but improves compilation time -> we keep it
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "last", "func" ],
        src_template := "List( [ 0 .. last ], x -> List( [ 0 .. last ], func )[1 + x] )",
        dst_template := "List( [ 0 .. last ], func )", # actually: List( List( [ 0 .. last ], func ), x -> x )
    )
);

# this logic template is already covered by generalized loop fusion, but improves compilation time -> we keep it
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
        variable_names := [ "number" ],
        variable_filters := [ IsBigInt ],
        src_template := "BigInt( 0 ) + number",
        dst_template := "number",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number" ],
        variable_filters := [ IsBigInt ],
        src_template := "number + BigInt( 0 )",
        dst_template := "number",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number" ],
        variable_filters := [ IsBigInt ],
        src_template := "number * BigInt( 1 )",
        dst_template := "number",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number" ],
        variable_filters := [ IsBigInt ],
        src_template := "BigInt( 1 ) * number",
        dst_template := "number",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number" ],
        variable_filters := [ IsBigInt ],
        src_template := "number * BigInt( 0 )",
        dst_template := "BigInt( 0 )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number" ],
        variable_filters := [ IsBigInt ],
        src_template := "BigInt( 0 ) * number",
        dst_template := "BigInt( 0 )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number", "domain" ],
        variable_filters := [ IsBigInt, IsBigInt ],
        src_template := "QuoIntWithDomain( number, BigInt( 1 ), domain )",
        dst_template := "number",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number", "quotient" ],
        variable_filters := [ IsBigInt, IsBigInt ],
        src_template := "DivIntWithGivenQuotient( number, BigInt( 1 ), quotient )",
        dst_template := "number",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "list" ],
        variable_filters := [ CapJitDataTypeOfListOf( IsBigInt ) ],
        src_template := "list{CapJitTypedExpression( [ ], { } -> CapJitDataTypeOfListOf( IsBigInt ) )}",
        dst_template := "CapJitTypedExpression( [ ], { } -> CapJitDataTypeOfListOf( IsBigInt ) )",
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
        variable_names := [ "entry1", "entry2" ],
        src_template := "[ entry1, entry2 ]{[ 2 ]}",
        dst_template := "[ entry2 ]",
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
        src_template := "Product( CapJitTypedExpression( [ ], { } -> CapJitDataTypeOfListOf( IsBigInt ) ) )",
        dst_template := "BigInt( 1 )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "func" ],
        src_template := "Product( CapJitTypedExpression( [ ], { } -> CapJitDataTypeOfListOf( IsBigInt ) ), func )",
        dst_template := "BigInt( 1 )",
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
        src_template := "Sum( [ 0, 1 ], func )",
        dst_template := "func( 0 ) + func( 1 )",
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
        variable_filters := [ IsBigInt, IsBigInt ],
        src_template := "[ 0 .. pos_end ][1 + index]",
        dst_template := "index",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number1", "number2" ],
        variable_filters := [ IsBigInt, IsBigInt ],
        src_template := "number1 in [ number2 ]",
        dst_template := "number1 = number2",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number" ],
        variable_filters := [ IsBigInt ],
        src_template := "number ^ BigInt( 0 )",
        dst_template := "BigInt( 1 )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number" ],
        variable_filters := [ IsBigInt ],
        src_template := "number ^ BigInt( 1 )",
        dst_template := "number",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number1", "number2" ],
        variable_filters := [ IsBigInt, IsBigInt ],
        src_template := "not number2 ^ number1 = 0",
        dst_template := "number1 = 0 or not number2 = 0",
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

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "length", "a", "b" ],
        src_template := "[ 0 .. length - 1 ][1 + a + b]",
        dst_template := "a + b",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "a", "q", "i" ],
        src_template := "Sum( List( [ 0 .. a - 1 ], k -> (k + i * a) * q^k ) )",
        dst_template := "q * GeometricSumDiff1( q, a ) + a * i * GeometricSum( q, a )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "length", "value", "func" ],
        src_template := "List( ListWithIdenticalEntries( length, value ), func )",
        dst_template := "ListWithIdenticalEntries( length, func( value ) )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "length", "value" ],
        src_template := "Length( ListWithIdenticalEntries( length, value ) )",
        dst_template := "length",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "length", "number" ],
        variable_filters := [ IsBigInt, IsBigInt ],
        src_template := "Product( ListWithIdenticalEntries( length, number ) )",
        dst_template := "number ^ length",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "j", "a", "b" ],
        variable_filters := [ IsBigInt, IsBigInt, IsBigInt ],
        src_template := "Sum( List( [ 0 .. a - 1 ], k -> List( [ 0 .. a ^ 2 - 1 ], function( x ) if x in List( [ 0 .. a - 1 ], i -> i + i * a ) then return BigInt( 1 ); else return BigInt( 0 ); fi; end )[1 + k + j * a] * b ^ k ) )",
        dst_template := "b ^ j",
    )
);
