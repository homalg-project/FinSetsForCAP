#! @Chapter Precompilation

#! @Section Precompiling ProjectionInFactorOfBinaryDirectProduct

#! @Example

#! #@if ValueOption( "no_precompiled_code" ) <> true

LoadPackage( "FinSetsForCAP", false );
#! true
LoadPackage( "CompilerForCAP", ">= 2023.12-09", false );
#! true
ReadPackageOnce( "FinSetsForCAP", "gap/CompilerLogic.gi" );
#! true

sFinSets := CategoryOfSkeletalFinSets( : no_precompiled_code := true );
#! SkeletalFinSets

LeftProjectionInFactorOfBinaryDirectProduct :=
  function( cat, a, b, axb )
    return ProjectionInFactorOfDirectProductWithGivenDirectProduct( cat,
                   [ a, b ],
                   1,
                   axb ); end;
#! function( cat, a, b, axb ) ... end

RightProjectionInFactorOfBinaryDirectProduct :=
  function( cat, a, b, axb )
    return ProjectionInFactorOfDirectProductWithGivenDirectProduct( cat,
                   [ a, b ],
                   2,
                   axb ); end;
#! function( cat, a, b, axb ) ... end

StartTimer( "ProjectionInFactorOfBinaryDirectProduct" );

compiled_LeftProjectionInFactorOfBinaryDirectProduct :=
  CapJitCompiledFunction( LeftProjectionInFactorOfBinaryDirectProduct,
          sFinSets,
          [ "category", "object", "object", "object" ],
          "morphism" );
#! function( cat_1, a_1, b_1, axb_1 ) ... end

compiled_RightProjectionInFactorOfBinaryDirectProduct :=
  CapJitCompiledFunction( RightProjectionInFactorOfBinaryDirectProduct,
          sFinSets,
          [ "category", "object", "object", "object" ],
          "morphism" );
#! function( cat_1, a_1, b_1, axb_1 ) ... end

StopTimer( "ProjectionInFactorOfBinaryDirectProduct" );
#DisplayTimer( "ProjectionInFactorOfBinaryDirectProduct" );

Display( compiled_LeftProjectionInFactorOfBinaryDirectProduct );
#! function ( cat_1, a_1, b_1, axb_1 )
#!     local hoisted_1_1, deduped_3_1;
#!     deduped_3_1 := Length( axb_1 );
#!     hoisted_1_1 := Length( a_1 );
#!     return CreateCapCategoryMorphismWithAttributes( cat_1, axb_1, a_1,
#!        AsList, List( [ 0 .. deduped_3_1 - 1 ], function ( i_2 )
#!               return RemIntWithDomain( i_2, hoisted_1_1, deduped_3_1 );
#!           end ) );
#! end

Display( compiled_RightProjectionInFactorOfBinaryDirectProduct );
#! function ( cat_1, a_1, b_1, axb_1 )
#!     local hoisted_1_1, deduped_3_1;
#!     deduped_3_1 := Length( axb_1 );
#!     hoisted_1_1 := Length( a_1 );
#!     return CreateCapCategoryMorphismWithAttributes( cat_1, axb_1, b_1,
#!        AsList, List( [ 0 .. deduped_3_1 - 1 ], function ( i_2 )
#!               return QuoIntWithDomain( i_2, hoisted_1_1, deduped_3_1 );
#!           end ) );
#! end

#! #@fi

#! @EndExample
