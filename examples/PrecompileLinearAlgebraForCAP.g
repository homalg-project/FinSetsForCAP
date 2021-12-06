#! @Chapter Precompilation

#! @Section Precompiling the category of skeletal finite sets

#! @Example
LoadPackage( "FinSetsForCAP", false );
#! true
category_constructor := {} -> CategoryOfSkeletalFinSets( );;
given_arguments := [ ];;
compiled_category_name := "CategoryOfSkeletalFinSetsPrecompiled";;
package_name := "FinSetsForCAP";;

CapJitPrecompileCategoryAndCompareResult(
    category_constructor,
    given_arguments,
    package_name,
    compiled_category_name
    : operations :=
        Difference(
                ListPrimitivelyInstalledOperationsOfCategory( SkeletalFinSets ),
                [ "CartesianBraidingInverseWithGivenDirectProducts",
                  "ProjectionInFactorOfDirectProduct",
                  "UniversalMorphismIntoDirectProduct",
                  ] )
                );;

CategoryOfSkeletalFinSetsPrecompiled( );
#! SkeletalFinSets
cat := CategoryOfSkeletalFinSets( );
#! SkeletalFinSets
#! @EndExample

#! Now we whether that the compiled code is loaded automatically.
#! For this we use the name of the argument of `InitialObject`:
#! for non-compiled code it is "cat", while for compiled code it is "cat_1":

#! @Example
NamesLocalVariablesFunction(
        Last( cat!.added_functions.InitialObject )[1] )[1];
#! "cat_1"
#! @EndExample
