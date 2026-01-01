#! @Chapter Precompilation

#! @Section Precompiling the skeletal category of finite sets with counting starting at 1

#! @Example

#! #@if ValueOption( "no_precompiled_code" ) <> true

LoadPackage( "FinSetsForCAP", false );
#! true
LoadPackage( "CompilerForCAP", ">= 2025.11-01", false );
#! true
ReadPackageOnce( "FinSetsForCAP", "gap/CompilerLogic.gi" );
#! true
ReadPackageOnce( "FinSetsForCAP",
        "gap/CompilerLogicWithCountingStartingAt1.gi" );
#! true

category_constructor := sFinSets ->
  SkeletalCategoryOfFiniteSetsWithCountingStartingAt1( sFinSets );;
given_arguments := [ SkeletalFinSets ];;
compiled_category_name :=
  "SkeletalCategoryOfFiniteSetsWithMorphismsGivenByLists\
AndCountingStartingAt1_precompiled";;
package_name := "FinSetsForCAP";;
primitive_operations :=
  ListPrimitivelyInstalledOperationsOfCategory(
          category_constructor( given_arguments[1]
                  : no_precompiled_code := true ) );;
list_of_operations :=
  SortedList( Concatenation( primitive_operations, [
          "CartesianBraidingWithGivenDirectProducts",
          "CartesianBraidingInverseWithGivenDirectProducts",
          "CartesianLambdaIntroduction",
          "CartesianRightEvaluationMorphismWithGivenSource",
          "CartesianRightCoevaluationMorphismWithGivenRange",
          "CoastrictionToImage",
          "CoimageProjection",
          #"IsHomSetInhabited",
          "TruthMorphismOfImplies",
          "SingletonMorphismWithGivenPowerObject",
          #"HasPushoutComplement",
          #"PushoutComplement",
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

SkeletalCategoryOfFiniteSetsWithMorphismsGivenByLists\
AndCountingStartingAt1_precompiled( SkeletalFinSets );
#! SkeletalFinSets1

cat :=
  SkeletalCategoryOfFiniteSetsWithCountingStartingAt1( SkeletalFinSets );
#! SkeletalFinSets1

cat!.precompiled_functions_added;
#! true

#! #@fi

#! @EndExample
