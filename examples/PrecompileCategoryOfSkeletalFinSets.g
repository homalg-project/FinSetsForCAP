#! @Chapter Precompilation

#! @Section Precompiling the category of skeletal finite sets

#! @Example

LoadPackage( "FinSetsForCAP", false );
#! true

category_constructor := {} -> CategoryOfSkeletalFinSets( );;
given_arguments := [ ];;
compiled_category_name := "CategoryOfSkeletalFinSetsPrecompiled";;
package_name := "FinSetsForCAP";;

uncompiled_SkeletalFinSets :=
    CategoryOfSkeletalFinSets( : no_precompiled_code := true );;

CapJitPrecompileCategoryAndCompareResult(
    category_constructor,
    given_arguments,
    package_name,
    compiled_category_name
    : operations := Difference(
        ListPrimitivelyInstalledOperationsOfCategory(
            uncompiled_SkeletalFinSets
        ),
        [
            "ProjectionInFactorOfDirectProduct", # uses CAP prepare functions
            "UniversalMorphismIntoDirectProduct", # uses CAP prepare functions
        ]
    )
);;

CategoryOfSkeletalFinSetsPrecompiled( );
#! SkeletalFinSets

cat := CategoryOfSkeletalFinSets( );
#! SkeletalFinSets

# Now we check whether the compiled code is loaded automatically.
# For this we use the name of the argument of `InitialObject`;
# for non-compiled code it is "cat", while for compiled code it is "cat_1":
argument_name := NamesLocalVariablesFunction(
    Last( cat!.added_functions.InitialObject )[1] )[1];;

(ValueOption( "no_precompiled_code" ) = true and argument_name = "cat") or
    (ValueOption( "no_precompiled_code" ) = fail and argument_name = "cat_1");
#! true

#! @EndExample
