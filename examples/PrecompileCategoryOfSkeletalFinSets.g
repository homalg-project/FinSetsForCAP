#! @Chapter Precompilation

#! @Section Precompiling the category of skeletal finite sets

#! @Example

LoadPackage( "FinSetsForCAP", false );
#! true
LoadPackage( "CompilerForCAP", false );
#! true

ReadPackage( "FinSetsForCAP", "gap/CompilerLogic.gi" );
#! true

category_constructor := {} -> CategoryOfSkeletalFinSets( );;
given_arguments := [ ];;
compiled_category_name := "CategoryOfSkeletalFinSetsPrecompiled";;
package_name := "FinSetsForCAP";;
primitive_operations :=
  ListPrimitivelyInstalledOperationsOfCategory( category_constructor() );;
list_of_operations :=
  SortedList( Concatenation( primitive_operations, [
          "CartesianLambdaIntroduction",
          "CartesianLambdaElimination",
          ] ) );;

CapJitPrecompileCategoryAndCompareResult(
        category_constructor,
        given_arguments,
        package_name,
        compiled_category_name
        : operations := list_of_operations,
        number_of_objectified_objects_in_data_structure_of_object := 1,
        number_of_objectified_morphisms_in_data_structure_of_object := 0,
        number_of_objectified_objects_in_data_structure_of_morphism := 2,
        number_of_objectified_morphisms_in_data_structure_of_morphism := 1
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
