# SPDX-License-Identifier: GPL-2.0-or-later
# FinSetsForCAP: The (skeletal) elementary topos of finite sets
#
# Implementations
#
BindGlobal( "ADD_FUNCTIONS_FOR_SkeletalCategoryOfFiniteSetsWithMorphismsGivenByLists_precompiled", function ( cat )
    
    ##
    AddAstrictionToCoimage( cat,
        
########
function ( cat_1, alpha_1 )
    local deduped_1_1;
    deduped_1_1 := DuplicateFreeList( AsList( alpha_1 ) );
    return CreateCapCategoryMorphismWithAttributes( cat_1, CreateCapCategoryObjectWithAttributes( cat_1, Cardinality, BigInt( Length( deduped_1_1 ) ) ), Range( alpha_1 ), AsList, deduped_1_1 );
end
########
        
    , 100 );
    
    ##
    AddCartesianBraidingInverseWithGivenDirectProducts( cat,
        
########
function ( cat_1, s_1, a_1, b_1, r_1 )
    local deduped_1_1, hoisted_3_1, deduped_4_1;
    deduped_4_1 := Cardinality( s_1 );
    hoisted_3_1 := Cardinality( a_1 );
    deduped_1_1 := Cardinality( b_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, r_1, AsList, List( [ 0 .. deduped_4_1 - 1 ], function ( i_2 )
              local deduped_1_2;
              deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( i_2 );
              return CAP_JIT_INCOMPLETE_LOGIC( QuoIntWithDomain( deduped_1_2, deduped_1_1, deduped_4_1 ) ) + CAP_JIT_INCOMPLETE_LOGIC( RemIntWithDomain( deduped_1_2, deduped_1_1, deduped_4_1 ) ) * hoisted_3_1;
          end ) );
end
########
        
    , 301 : IsPrecompiledDerivation := true );
    
    ##
    cat!.cached_precompiled_functions.CartesianBraidingInverseWithGivenDirectProducts :=
        
########
function ( cat_1, s_1, a_1, b_1, r_1 )
    local deduped_1_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, deduped_6_1, deduped_7_1;
    deduped_7_1 := Cardinality( s_1 );
    deduped_6_1 := [ 0 .. deduped_7_1 - 1 ];
    hoisted_5_1 := Cardinality( a_1 );
    deduped_1_1 := Cardinality( b_1 );
    hoisted_4_1 := List( deduped_6_1, function ( i_2 )
            return RemIntWithDomain( i_2, deduped_1_1, deduped_7_1 );
        end );
    hoisted_3_1 := List( deduped_6_1, function ( i_2 )
            return QuoIntWithDomain( i_2, deduped_1_1, deduped_7_1 );
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, r_1, AsList, List( deduped_6_1, function ( i_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + i_2;
              return hoisted_3_1[deduped_1_2] + hoisted_4_1[deduped_1_2] * hoisted_5_1;
          end ) );
end
########
        
    ;
    
    ##
    AddCartesianBraidingWithGivenDirectProducts( cat,
        
########
function ( cat_1, s_1, a_1, b_1, r_1 )
    local deduped_1_1, hoisted_3_1, deduped_4_1;
    deduped_4_1 := Cardinality( s_1 );
    hoisted_3_1 := Cardinality( b_1 );
    deduped_1_1 := Cardinality( a_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, r_1, AsList, List( [ 0 .. deduped_4_1 - 1 ], function ( i_2 )
              local deduped_1_2;
              deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( i_2 );
              return CAP_JIT_INCOMPLETE_LOGIC( QuoIntWithDomain( deduped_1_2, deduped_1_1, deduped_4_1 ) ) + CAP_JIT_INCOMPLETE_LOGIC( RemIntWithDomain( deduped_1_2, deduped_1_1, deduped_4_1 ) ) * hoisted_3_1;
          end ) );
end
########
        
    , 301 : IsPrecompiledDerivation := true );
    
    ##
    cat!.cached_precompiled_functions.CartesianBraidingWithGivenDirectProducts :=
        
########
function ( cat_1, s_1, a_1, b_1, r_1 )
    local deduped_1_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, deduped_6_1, deduped_7_1;
    deduped_7_1 := Cardinality( s_1 );
    deduped_6_1 := [ 0 .. deduped_7_1 - 1 ];
    hoisted_5_1 := Cardinality( b_1 );
    deduped_1_1 := Cardinality( a_1 );
    hoisted_4_1 := List( deduped_6_1, function ( i_2 )
            return RemIntWithDomain( i_2, deduped_1_1, deduped_7_1 );
        end );
    hoisted_3_1 := List( deduped_6_1, function ( i_2 )
            return QuoIntWithDomain( i_2, deduped_1_1, deduped_7_1 );
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, r_1, AsList, List( deduped_6_1, function ( i_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + i_2;
              return hoisted_3_1[deduped_1_2] + hoisted_4_1[deduped_1_2] * hoisted_5_1;
          end ) );
end
########
        
    ;
    
    ##
    AddCartesianLambdaElimination( cat,
        
########
function ( cat_1, a_1, b_1, alpha_1 )
    local hoisted_1_1, hoisted_3_1, deduped_4_1;
    deduped_4_1 := Cardinality( a_1 );
    hoisted_3_1 := Cardinality( b_1 );
    hoisted_1_1 := AsList( alpha_1 )[1];
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, b_1, AsList, List( [ 0 .. deduped_4_1 - 1 ], function ( i_2 )
              return DigitInPositionalNotation( hoisted_1_1, i_2, deduped_4_1, hoisted_3_1 );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddCartesianLambdaIntroduction( cat,
        
########
function ( cat_1, alpha_1 )
    local hoisted_1_1, deduped_3_1, deduped_4_1;
    deduped_4_1 := Cardinality( Source( alpha_1 ) );
    deduped_3_1 := Cardinality( Range( alpha_1 ) );
    hoisted_1_1 := AsList( alpha_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, CreateCapCategoryObjectWithAttributes( cat_1, Cardinality, BigInt( 1 ) ), CreateCapCategoryObjectWithAttributes( cat_1, Cardinality, deduped_3_1 ^ deduped_4_1 ), AsList, [ Sum( List( [ 0 .. deduped_4_1 - 1 ], function ( k_2 )
                    return hoisted_1_1[1 + k_2] * deduped_3_1 ^ k_2;
                end ) ) ] );
end
########
        
    , 503 : IsPrecompiledDerivation := true );
    
    ##
    AddCartesianLeftCoevaluationMorphismWithGivenRange( cat,
        
########
function ( cat_1, a_1, b_1, r_1 )
    local hoisted_1_1, hoisted_2_1, deduped_3_1, deduped_4_1, deduped_5_1;
    deduped_5_1 := Cardinality( a_1 );
    deduped_4_1 := Cardinality( b_1 );
    deduped_3_1 := deduped_4_1 * deduped_5_1;
    hoisted_2_1 := deduped_4_1 * deduped_3_1 * GeometricSumDiff1( deduped_3_1, deduped_5_1 );
    hoisted_1_1 := GeometricSum( deduped_3_1, deduped_5_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, b_1, r_1, AsList, List( [ 0 .. deduped_4_1 - 1 ], function ( i_2 )
              return i_2 * hoisted_1_1 + hoisted_2_1;
          end ) );
end
########
        
    , 100 );
    
    ##
    AddCartesianLeftEvaluationMorphismWithGivenSource( cat,
        
########
function ( cat_1, a_1, b_1, s_1 )
    local deduped_1_1, deduped_5_1, deduped_6_1, deduped_7_1;
    deduped_7_1 := Cardinality( a_1 );
    deduped_6_1 := Cardinality( b_1 );
    deduped_5_1 := Cardinality( s_1 );
    deduped_1_1 := deduped_6_1 ^ deduped_7_1;
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, b_1, AsList, List( [ 0 .. deduped_5_1 - 1 ], function ( f_i_2 )
              return DigitInPositionalNotation( RemIntWithDomain( f_i_2, deduped_1_1, deduped_5_1 ), QuoIntWithDomain( f_i_2, deduped_1_1, deduped_5_1 ), deduped_7_1, deduped_6_1 );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddCartesianLeftUnitorInverseWithGivenDirectProduct( cat,
        
########
function ( cat_1, a_1, r_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, a_1, AsList, [ 0 .. Cardinality( a_1 ) - 1 ] );
end
########
        
    , 100 );
    
    ##
    AddCartesianLeftUnitorWithGivenDirectProduct( cat,
        
########
function ( cat_1, a_1, s_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, a_1, AsList, [ 0 .. Cardinality( a_1 ) - 1 ] );
end
########
        
    , 100 );
    
    ##
    AddCartesianRightCoevaluationMorphismWithGivenRange( cat,
        
########
function ( cat_1, a_1, b_1, r_1 )
    local hoisted_2_1, hoisted_3_1, deduped_4_1, deduped_5_1, deduped_6_1;
    deduped_6_1 := Cardinality( a_1 );
    deduped_5_1 := Cardinality( b_1 );
    deduped_4_1 := deduped_6_1 * deduped_5_1;
    hoisted_3_1 := deduped_4_1 * GeometricSumDiff1( deduped_4_1, deduped_6_1 );
    hoisted_2_1 := GeometricSum( deduped_4_1, deduped_6_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, b_1, r_1, AsList, List( [ 0 .. deduped_5_1 - 1 ], function ( i_2 )
              return hoisted_3_1 + deduped_6_1 * i_2 * hoisted_2_1;
          end ) );
end
########
        
    , 301 : IsPrecompiledDerivation := true );
    
    ##
    AddCartesianRightEvaluationMorphismWithGivenSource( cat,
        
########
function ( cat_1, a_1, b_1, s_1 )
    local deduped_1_1, hoisted_3_1, deduped_4_1;
    deduped_4_1 := Cardinality( s_1 );
    hoisted_3_1 := Cardinality( b_1 );
    deduped_1_1 := Cardinality( a_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, b_1, AsList, List( [ 0 .. deduped_4_1 - 1 ], function ( i_2 )
              return DigitInPositionalNotation( QuoIntWithDomain( i_2, deduped_1_1, deduped_4_1 ), RemIntWithDomain( i_2, deduped_1_1, deduped_4_1 ), deduped_1_1, hoisted_3_1 );
          end ) );
end
########
        
    , 301 : IsPrecompiledDerivation := true );
    
    ##
    AddCartesianRightUnitorInverseWithGivenDirectProduct( cat,
        
########
function ( cat_1, a_1, r_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, a_1, AsList, [ 0 .. Cardinality( a_1 ) - 1 ] );
end
########
        
    , 100 );
    
    ##
    AddCartesianRightUnitorWithGivenDirectProduct( cat,
        
########
function ( cat_1, a_1, s_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, a_1, AsList, [ 0 .. Cardinality( a_1 ) - 1 ] );
end
########
        
    , 100 );
    
    ##
    AddClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier( cat,
        
########
function ( cat_1, alpha_1, Omega_1 )
    local hoisted_1_1, deduped_2_1;
    deduped_2_1 := Range( alpha_1 );
    hoisted_1_1 := AsList( alpha_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, deduped_2_1, Omega_1, AsList, List( [ 0 .. Cardinality( deduped_2_1 ) - 1 ], function ( x_2 )
              return BoolToBigInt( x_2 in hoisted_1_1 );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddCoastrictionToImage( cat,
        
########
function ( cat_1, alpha_1 )
    local deduped_3_1, deduped_4_1, deduped_5_1;
    deduped_5_1 := AsList( alpha_1 );
    deduped_4_1 := Source( alpha_1 );
    deduped_3_1 := SSortedList( deduped_5_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, deduped_4_1, CreateCapCategoryObjectWithAttributes( cat_1, Cardinality, BigInt( Length( deduped_3_1 ) ) ), AsList, List( [ 0 .. Cardinality( deduped_4_1 ) - 1 ], function ( x_2 )
              return -1 + BigInt( SafePosition( deduped_3_1, deduped_5_1[1 + x_2] ) );
          end ) );
end
########
        
    , 202 : IsPrecompiledDerivation := true );
    
    ##
    AddCoequalizer( cat,
        
########
function ( cat_1, Y_1, morphisms_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, Cardinality, BigInt( Length( SKELETAL_FIN_SETS_ExplicitCoequalizer( Cardinality( Y_1 ), List( morphisms_1, AsList ) ) ) ) );
end
########
        
    , 100 );
    
    ##
    AddCoimageProjection( cat,
        
########
function ( cat_1, alpha_1 )
    local deduped_3_1, deduped_4_1, deduped_5_1;
    deduped_5_1 := AsList( alpha_1 );
    deduped_4_1 := Source( alpha_1 );
    deduped_3_1 := DuplicateFreeList( deduped_5_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, deduped_4_1, CreateCapCategoryObjectWithAttributes( cat_1, Cardinality, BigInt( Length( deduped_3_1 ) ) ), AsList, List( [ 0 .. Cardinality( deduped_4_1 ) - 1 ], function ( x_2 )
              return -1 + BigInt( SafePosition( deduped_3_1, deduped_5_1[1 + x_2] ) );
          end ) );
end
########
        
    , 202 : IsPrecompiledDerivation := true );
    
    ##
    AddColift( cat,
        
########
function ( cat_1, alpha_1, beta_1 )
    local deduped_1_1, hoisted_2_1, hoisted_3_1, deduped_4_1;
    deduped_4_1 := Range( alpha_1 );
    hoisted_3_1 := AsList( beta_1 );
    hoisted_2_1 := BigInt( 0 );
    deduped_1_1 := AsList( alpha_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, deduped_4_1, Range( beta_1 ), AsList, List( [ 0 .. Cardinality( deduped_4_1 ) - 1 ], function ( y_2 )
              if not y_2 in deduped_1_1 then
                  return hoisted_2_1;
              else
                  return hoisted_3_1[SafePosition( deduped_1_1, y_2 )];
              fi;
              return;
          end ) );
end
########
        
    , 100 );
    
    ##
    AddCoproduct( cat,
        
########
function ( cat_1, objects_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, Cardinality, Sum( List( objects_1, Cardinality ) ) );
end
########
        
    , 100 );
    
    ##
    AddDirectProduct( cat,
        
########
function ( cat_1, objects_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, Cardinality, Product( List( objects_1, Cardinality ) ) );
end
########
        
    , 100 );
    
    ##
    AddDirectProductToExponentialRightAdjunctMorphismWithGivenExponential( cat,
        
########
function ( cat_1, a_1, b_1, f_1, i_1 )
    local hoisted_2_1, hoisted_3_1, hoisted_4_1, deduped_5_1;
    deduped_5_1 := Cardinality( a_1 );
    hoisted_4_1 := [ 0 .. deduped_5_1 - 1 ];
    hoisted_3_1 := Cardinality( Range( f_1 ) );
    hoisted_2_1 := AsList( f_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, b_1, i_1, AsList, List( [ 0 .. Cardinality( b_1 ) - 1 ], function ( i_2 )
              local hoisted_1_2;
              hoisted_1_2 := i_2 * deduped_5_1;
              return Sum( List( hoisted_4_1, function ( k_3 )
                        return hoisted_2_1[1 + k_3 + hoisted_1_2] * hoisted_3_1 ^ k_3;
                    end ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddEmbeddingOfEqualizerWithGivenEqualizer( cat,
        
########
function ( cat_1, Y_1, morphisms_1, P_1 )
    local deduped_1_1, hoisted_2_1;
    hoisted_2_1 := [ 1 .. Length( morphisms_1 ) - 1 ];
    deduped_1_1 := List( morphisms_1, AsList );
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, Y_1, AsList, Filtered( [ 0 .. Cardinality( Y_1 ) - 1 ], function ( x_2 )
              local deduped_1_2;
              deduped_1_2 := 1 + x_2;
              return ForAll( hoisted_2_1, function ( j_3 )
                      return deduped_1_1[j_3][deduped_1_2] = deduped_1_1[j_3 + 1][deduped_1_2];
                  end );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddEpimorphismFromSomeProjectiveObject( cat,
        
########
function ( cat_1, A_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, A_1, A_1, AsList, [ 0 .. Cardinality( A_1 ) - 1 ] );
end
########
        
    , 100 );
    
    ##
    AddEqualizer( cat,
        
########
function ( cat_1, Y_1, morphisms_1 )
    local deduped_1_1, hoisted_2_1;
    hoisted_2_1 := [ 1 .. Length( morphisms_1 ) - 1 ];
    deduped_1_1 := List( morphisms_1, AsList );
    return CreateCapCategoryObjectWithAttributes( cat_1, Cardinality, BigInt( Length( Filtered( [ 0 .. Cardinality( Y_1 ) - 1 ], function ( x_2 )
                  local deduped_1_2;
                  deduped_1_2 := 1 + x_2;
                  return ForAll( hoisted_2_1, function ( j_3 )
                          return deduped_1_1[j_3][deduped_1_2] = deduped_1_1[j_3 + 1][deduped_1_2];
                      end );
              end ) ) ) );
end
########
        
    , 100 );
    
    ##
    AddExactCoverWithGlobalElements( cat,
        
########
function ( cat_1, arg2_1 )
    local hoisted_1_1;
    hoisted_1_1 := CreateCapCategoryObjectWithAttributes( cat_1, Cardinality, BigInt( 1 ) );
    return List( [ 0 .. Cardinality( arg2_1 ) - 1 ], function ( i_2 )
            return CreateCapCategoryMorphismWithAttributes( cat_1, hoisted_1_1, arg2_1, AsList, [ i_2 ] );
        end );
end
########
        
    , 100 );
    
    ##
    AddExponentialOnMorphismsWithGivenExponentials( cat,
        
########
function ( cat_1, s_1, alpha_1, beta_1, r_1 )
    local hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, deduped_8_1, deduped_9_1;
    deduped_9_1 := Cardinality( Range( alpha_1 ) );
    deduped_8_1 := Cardinality( Source( beta_1 ) );
    hoisted_7_1 := [ 0 .. Cardinality( Source( alpha_1 ) ) - 1 ];
    hoisted_6_1 := Cardinality( Range( beta_1 ) );
    hoisted_5_1 := AsList( beta_1 );
    hoisted_4_1 := AsList( alpha_1 );
    hoisted_3_1 := [ 0 .. deduped_9_1 - 1 ];
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, r_1, AsList, List( [ 0 .. deduped_8_1 ^ deduped_9_1 - 1 ], function ( i_2 )
              local hoisted_1_2;
              hoisted_1_2 := List( hoisted_3_1, function ( i_3 )
                      return DigitInPositionalNotation( i_2, i_3, deduped_9_1, deduped_8_1 );
                  end );
              return Sum( List( hoisted_7_1, function ( k_3 )
                        return CAP_JIT_INCOMPLETE_LOGIC( hoisted_5_1[1 + hoisted_1_2[1 + hoisted_4_1[1 + CAP_JIT_INCOMPLETE_LOGIC( k_3 )]]] ) * hoisted_6_1 ^ k_3;
                    end ) );
          end ) );
end
########
        
    , 1403 );
    
    ##
    cat!.cached_precompiled_functions.ExponentialOnMorphismsWithGivenExponentials :=
        
########
function ( cat_1, s_1, alpha_1, beta_1, r_1 )
    local hoisted_3_1, hoisted_4_1, hoisted_5_1, deduped_6_1, hoisted_7_1, deduped_8_1, deduped_9_1;
    deduped_9_1 := Cardinality( Range( alpha_1 ) );
    deduped_8_1 := Cardinality( Source( beta_1 ) );
    hoisted_7_1 := Cardinality( Range( beta_1 ) );
    deduped_6_1 := [ 0 .. Cardinality( Source( alpha_1 ) ) - 1 ];
    hoisted_5_1 := AsList( beta_1 );
    hoisted_4_1 := AsList( alpha_1 );
    hoisted_3_1 := [ 0 .. deduped_9_1 - 1 ];
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, r_1, AsList, List( [ 0 .. deduped_8_1 ^ deduped_9_1 - 1 ], function ( i_2 )
              local hoisted_1_2, hoisted_2_2;
              hoisted_1_2 := List( hoisted_3_1, function ( i_3 )
                      return DigitInPositionalNotation( i_2, i_3, deduped_9_1, deduped_8_1 );
                  end );
              hoisted_2_2 := List( deduped_6_1, function ( i_3 )
                      return hoisted_5_1[1 + hoisted_1_2[1 + hoisted_4_1[1 + i_3]]];
                  end );
              return Sum( List( deduped_6_1, function ( k_3 )
                        return hoisted_2_2[1 + k_3] * hoisted_7_1 ^ k_3;
                    end ) );
          end ) );
end
########
        
    ;
    
    ##
    AddExponentialOnObjects( cat,
        
########
function ( cat_1, a_1, b_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, Cardinality, Cardinality( b_1 ) ^ Cardinality( a_1 ) );
end
########
        
    , 100 );
    
    ##
    AddExponentialToDirectProductRightAdjunctMorphismWithGivenDirectProduct( cat,
        
########
function ( cat_1, a_1, c_1, g_1, s_1 )
    local deduped_1_1, hoisted_3_1, hoisted_4_1, deduped_5_1;
    deduped_5_1 := Cardinality( s_1 );
    hoisted_4_1 := Cardinality( c_1 );
    hoisted_3_1 := AsList( g_1 );
    deduped_1_1 := Cardinality( a_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, c_1, AsList, List( [ 0 .. deduped_5_1 - 1 ], function ( i_2 )
              return DigitInPositionalNotation( hoisted_3_1[1 + QuoIntWithDomain( i_2, deduped_1_1, deduped_5_1 )], RemIntWithDomain( i_2, deduped_1_1, deduped_5_1 ), deduped_1_1, hoisted_4_1 );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddIdentityMorphism( cat,
        
########
function ( cat_1, a_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, a_1, AsList, [ 0 .. Cardinality( a_1 ) - 1 ] );
end
########
        
    , 100 );
    
    ##
    AddImageEmbedding( cat,
        
########
function ( cat_1, alpha_1 )
    local deduped_1_1;
    deduped_1_1 := SSortedList( AsList( alpha_1 ) );
    return CreateCapCategoryMorphismWithAttributes( cat_1, CreateCapCategoryObjectWithAttributes( cat_1, Cardinality, BigInt( Length( deduped_1_1 ) ) ), Range( alpha_1 ), AsList, deduped_1_1 );
end
########
        
    , 100 );
    
    ##
    AddInitialObject( cat,
        
########
function ( cat_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, Cardinality, BigInt( 0 ) );
end
########
        
    , 100 );
    
    ##
    AddInjectionOfCofactorOfCoproductWithGivenCoproduct( cat,
        
########
function ( cat_1, objects_1, k_1, P_1 )
    local deduped_1_1, deduped_2_1;
    deduped_2_1 := List( objects_1, Cardinality );
    deduped_1_1 := Sum( deduped_2_1{[ 1 .. k_1 - 1 ]} );
    return CreateCapCategoryMorphismWithAttributes( cat_1, objects_1[k_1], P_1, AsList, [ deduped_1_1 .. deduped_1_1 + deduped_2_1[k_1] - 1 ] );
end
########
        
    , 100 );
    
    ##
    AddIsColiftable( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_2_1, deduped_3_1;
    if Cardinality( Range( arg3_1 ) ) = 0 and not Cardinality( Range( arg2_1 ) ) = 0 then
        return false;
    else
        deduped_3_1 := AsList( arg2_1 );
        hoisted_2_1 := AsList( arg3_1 );
        return ForAll( SSortedList( deduped_3_1 ), function ( i_2 )
                return Length( SSortedList( hoisted_2_1{Positions( deduped_3_1, i_2 )} ) ) = 1;
            end );
    fi;
    return;
end
########
        
    , 100 );
    
    ##
    AddIsEpimorphism( cat,
        
########
function ( cat_1, arg2_1 )
    return not false in SKELETAL_FIN_SETS_IsEpimorphism( AsList( arg2_1 ), Cardinality( Range( arg2_1 ) ) );
end
########
        
    , 100 );
    
    ##
    AddIsEqualForMorphisms( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    return AsList( arg2_1 ) = AsList( arg3_1 );
end
########
        
    , 100 );
    
    ##
    AddIsEqualForObjects( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    return Cardinality( arg2_1 ) = Cardinality( arg3_1 );
end
########
        
    , 100 );
    
    ##
    AddIsHomSetInhabited( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    return Cardinality( arg2_1 ) = 0 or not Cardinality( arg3_1 ) = 0;
end
########
        
    , 202 : IsPrecompiledDerivation := true );
    
    ##
    AddIsInitial( cat,
        
########
function ( cat_1, arg2_1 )
    return Cardinality( arg2_1 ) = 0;
end
########
        
    , 100 );
    
    ##
    AddIsInjective( cat,
        
########
function ( cat_1, arg2_1 )
    return not Cardinality( arg2_1 ) = 0;
end
########
        
    , 100 );
    
    ##
    AddIsLiftable( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local deduped_2_1, deduped_3_1;
    deduped_3_1 := AsList( arg3_1 );
    deduped_2_1 := AsList( arg2_1 );
    return ForAll( CAP_JIT_EXPR_CASE_WRAPPER( function (  )
                if 100 * Length( deduped_2_1 ) < Length( deduped_3_1 ) then
                    return SSortedList( deduped_2_1 );
                else
                    return deduped_2_1;
                fi;
                return;
            end )(  ), function ( y_2 )
            return y_2 in deduped_3_1;
        end );
end
########
        
    , 100 );
    
    ##
    AddIsMonomorphism( cat,
        
########
function ( cat_1, arg2_1 )
    return SKELETAL_FIN_SETS_IsMonomorphism( AsList( arg2_1 ), Cardinality( Range( arg2_1 ) ) );
end
########
        
    , 100 );
    
    ##
    AddIsProjective( cat,
        
########
function ( cat_1, arg2_1 )
    return true;
end
########
        
    , 100 );
    
    ##
    AddIsSplitEpimorphism( cat,
        
########
function ( cat_1, arg2_1 )
    return not false in SKELETAL_FIN_SETS_IsEpimorphism( AsList( arg2_1 ), Cardinality( Range( arg2_1 ) ) );
end
########
        
    , 100 );
    
    ##
    AddIsSplitMonomorphism( cat,
        
########
function ( cat_1, arg2_1 )
    local deduped_1_1;
    deduped_1_1 := Cardinality( Range( arg2_1 ) );
    return deduped_1_1 = 0 or not Cardinality( Source( arg2_1 ) ) = 0 and SKELETAL_FIN_SETS_IsMonomorphism( AsList( arg2_1 ), deduped_1_1 );
end
########
        
    , 100 );
    
    ##
    AddIsTerminal( cat,
        
########
function ( cat_1, arg2_1 )
    return Cardinality( arg2_1 ) = 1;
end
########
        
    , 100 );
    
    ##
    AddIsWellDefinedForMorphisms( cat,
        
########
function ( cat_1, alpha_1 )
    local hoisted_1_1, deduped_2_1;
    deduped_2_1 := AsList( alpha_1 );
    hoisted_1_1 := Cardinality( Range( alpha_1 ) );
    if not ForAll( deduped_2_1, function ( a_2 )
                 return IsBigInt( a_2 ) and a_2 >= 0;
             end ) then
        return false;
    elif Cardinality( Source( alpha_1 ) ) <> Length( deduped_2_1 ) then
        return false;
    elif not ForAll( deduped_2_1, function ( a_2 )
                 return a_2 < hoisted_1_1;
             end ) then
        return false;
    else
        return true;
    fi;
    return;
end
########
        
    , 100 );
    
    ##
    AddIsWellDefinedForObjects( cat,
        
########
function ( cat_1, arg2_1 )
    local deduped_1_1;
    deduped_1_1 := Cardinality( arg2_1 );
    return IsBigInt( deduped_1_1 ) and deduped_1_1 >= 0;
end
########
        
    , 100 );
    
    ##
    AddLift( cat,
        
########
function ( cat_1, alpha_1, beta_1 )
    local hoisted_1_1, hoisted_2_1, deduped_3_1;
    deduped_3_1 := Source( alpha_1 );
    hoisted_2_1 := AsList( beta_1 );
    hoisted_1_1 := AsList( alpha_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, deduped_3_1, Source( beta_1 ), AsList, List( [ 0 .. Cardinality( deduped_3_1 ) - 1 ], function ( x_2 )
              return -1 + BigInt( SafePosition( hoisted_2_1, hoisted_1_1[1 + x_2] ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddMonomorphismIntoSomeInjectiveObjectWithGivenSomeInjectiveObject( cat,
        
########
function ( cat_1, A_1, I_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, A_1, I_1, AsList, [ 0 .. Cardinality( A_1 ) - 1 ] );
end
########
        
    , 100 );
    
    ##
    AddMorphismConstructor( cat,
        
########
function ( cat_1, arg2_1, arg3_1, arg4_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg4_1, AsList, arg3_1 );
end
########
        
    , 100 );
    
    ##
    AddMorphismDatum( cat,
        
########
function ( cat_1, arg2_1 )
    return AsList( arg2_1 );
end
########
        
    , 100 );
    
    ##
    AddMorphismsOfExternalHom( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_3_1, deduped_4_1, deduped_5_1;
    deduped_5_1 := Cardinality( arg2_1 );
    deduped_4_1 := Cardinality( arg3_1 );
    hoisted_3_1 := [ 0 .. deduped_5_1 - 1 ];
    return List( [ 0 .. deduped_4_1 ^ deduped_5_1 - 1 ], function ( i_2 )
            return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg3_1, AsList, List( hoisted_3_1, function ( i_3 )
                      return DigitInPositionalNotation( i_2, i_3, deduped_5_1, deduped_4_1 );
                  end ) );
        end );
end
########
        
    , 401 );
    
    ##
    AddObjectConstructor( cat,
        
########
function ( cat_1, arg2_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, Cardinality, arg2_1 );
end
########
        
    , 100 );
    
    ##
    AddObjectDatum( cat,
        
########
function ( cat_1, arg2_1 )
    return Cardinality( arg2_1 );
end
########
        
    , 100 );
    
    ##
    AddPreCompose( cat,
        
########
function ( cat_1, alpha_1, beta_1 )
    local hoisted_1_1, hoisted_2_1, deduped_3_1;
    deduped_3_1 := Source( alpha_1 );
    hoisted_2_1 := AsList( beta_1 );
    hoisted_1_1 := AsList( alpha_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, deduped_3_1, Range( beta_1 ), AsList, List( [ 0 .. Cardinality( deduped_3_1 ) - 1 ], function ( i_2 )
              return hoisted_2_1[1 + hoisted_1_1[1 + i_2]];
          end ) );
end
########
        
    , 100 );
    
    ##
    AddProjectionInFactorOfDirectProductWithGivenDirectProduct( cat,
        
########
function ( cat_1, objects_1, k_1, P_1 )
    local hoisted_4_1, deduped_5_1, deduped_6_1, deduped_7_1, deduped_8_1;
    deduped_8_1 := List( objects_1, Cardinality );
    deduped_7_1 := Cardinality( P_1 );
    deduped_6_1 := deduped_8_1[k_1];
    deduped_5_1 := Product( deduped_8_1{[ 1 .. k_1 - 1 ]} );
    hoisted_4_1 := DivIntWithGivenQuotient( deduped_7_1, deduped_5_1, deduped_6_1 * Product( deduped_8_1{[ k_1 + 1 .. Length( objects_1 ) ]} ) );
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, objects_1[k_1], AsList, List( [ 0 .. deduped_7_1 - 1 ], function ( i_2 )
              return RemIntWithDomain( QuoIntWithDomain( i_2, deduped_5_1, deduped_7_1 ), deduped_6_1, hoisted_4_1 );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddProjectionOntoCoequalizerWithGivenCoequalizer( cat,
        
########
function ( cat_1, Y_1, morphisms_1, P_1 )
    local hoisted_1_1, deduped_2_1;
    deduped_2_1 := Cardinality( Y_1 );
    hoisted_1_1 := SKELETAL_FIN_SETS_ExplicitCoequalizer( deduped_2_1, List( morphisms_1, AsList ) );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Y_1, P_1, AsList, List( [ 0 .. deduped_2_1 - 1 ], function ( x_2 )
              return -1 + BigInt( SafeUniquePositionProperty( hoisted_1_1, function ( c_3 )
                          return x_2 in c_3;
                      end ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddSingletonMorphismWithGivenPowerObject( cat,
        
########
function ( cat_1, a_1, Pa_1 )
    local hoisted_1_1;
    hoisted_1_1 := BigInt( 2 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, Pa_1, AsList, List( [ 0 .. Cardinality( a_1 ) - 1 ], function ( i_2 )
              return hoisted_1_1 ^ i_2;
          end ) );
end
########
        
    , 605 : IsPrecompiledDerivation := true );
    
    ##
    AddSomeInjectiveObject( cat,
        
########
function ( cat_1, arg2_1 )
    if Cardinality( arg2_1 ) = 0 then
        return CreateCapCategoryObjectWithAttributes( cat_1, Cardinality, BigInt( 1 ) );
    else
        return arg2_1;
    fi;
    return;
end
########
        
    , 100 );
    
    ##
    AddSubobjectClassifier( cat,
        
########
function ( cat_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, Cardinality, BigInt( 2 ) );
end
########
        
    , 100 );
    
    ##
    AddTerminalObject( cat,
        
########
function ( cat_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, Cardinality, BigInt( 1 ) );
end
########
        
    , 100 );
    
    ##
    AddTruthMorphismOfImplies( cat,
        
########
function ( cat_1 )
    local deduped_1_1;
    deduped_1_1 := BigInt( 1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, CreateCapCategoryObjectWithAttributes( cat_1, Cardinality, BigInt( 4 ) ), CreateCapCategoryObjectWithAttributes( cat_1, Cardinality, BigInt( 2 ) ), AsList, [ deduped_1_1, BigInt( 0 ), deduped_1_1, deduped_1_1 ] );
end
########
        
    , 1206 : IsPrecompiledDerivation := true );
    
    ##
    AddUniversalMorphismFromCoequalizerWithGivenCoequalizer( cat,
        
########
function ( cat_1, Y_1, morphisms_1, T_1, tau_1, P_1 )
    local hoisted_1_1;
    hoisted_1_1 := AsList( tau_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, Range( tau_1 ), AsList, List( SKELETAL_FIN_SETS_ExplicitCoequalizer( Cardinality( Y_1 ), List( morphisms_1, AsList ) ), function ( x_2 )
              return hoisted_1_1[1 + x_2[1]];
          end ) );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismFromCoproductWithGivenCoproduct( cat,
        
########
function ( cat_1, objects_1, T_1, tau_1, P_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, T_1, AsList, Concatenation( List( tau_1, AsList ) ) );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismFromInitialObjectWithGivenInitialObject( cat,
        
########
function ( cat_1, T_1, P_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, T_1, AsList, CapJitTypedExpression( [  ], function (  )
              return rec(
                  filter := IsList,
                  element_type := rec(
                      filter := IsInt ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismIntoDirectProductWithGivenDirectProduct( cat,
        
########
function ( cat_1, objects_1, T_1, tau_1, P_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, deduped_5_1;
    deduped_5_1 := [ 0 .. Length( objects_1 ) - 1 ];
    hoisted_2_1 := List( objects_1, Cardinality );
    hoisted_3_1 := List( deduped_5_1, function ( j_2 )
            return Product( hoisted_2_1{[ 1 .. j_2 ]} );
        end );
    hoisted_1_1 := List( tau_1, AsList );
    return CreateCapCategoryMorphismWithAttributes( cat_1, T_1, P_1, AsList, List( [ 0 .. Cardinality( T_1 ) - 1 ], function ( i_2 )
              local hoisted_1_2;
              hoisted_1_2 := 1 + i_2;
              return Sum( deduped_5_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_1_1[deduped_1_3][hoisted_1_2] * hoisted_3_1[deduped_1_3];
                  end );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismIntoEqualizerWithGivenEqualizer( cat,
        
########
function ( cat_1, Y_1, morphisms_1, T_1, tau_1, P_1 )
    local deduped_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1;
    hoisted_2_1 := [ 1 .. Length( morphisms_1 ) - 1 ];
    deduped_1_1 := List( morphisms_1, AsList );
    hoisted_4_1 := Filtered( [ 0 .. Cardinality( Y_1 ) - 1 ], function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + x_2;
            return ForAll( hoisted_2_1, function ( j_3 )
                    return deduped_1_1[j_3][deduped_1_2] = deduped_1_1[j_3 + 1][deduped_1_2];
                end );
        end );
    hoisted_3_1 := AsList( tau_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, T_1, P_1, AsList, List( [ 0 .. Cardinality( T_1 ) - 1 ], function ( x_2 )
              return -1 + BigInt( SafePosition( hoisted_4_1, hoisted_3_1[1 + x_2] ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismIntoTerminalObjectWithGivenTerminalObject( cat,
        
########
function ( cat_1, T_1, P_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, T_1, P_1, AsList, ListWithIdenticalEntries( Cardinality( T_1 ), BigInt( 0 ) ) );
end
########
        
    , 100 );
    
    if IsBound( cat!.precompiled_functions_added ) then
        
        # COVERAGE_IGNORE_NEXT_LINE
        Error( "precompiled functions have already been added before" );
        
    fi;
    
    cat!.precompiled_functions_added := true;
    
end );

BindGlobal( "SkeletalCategoryOfFiniteSetsWithMorphismsGivenByLists_precompiled", function (  )
  local category_constructor, cat;
    
    category_constructor :=
        
        
        function (  )
    return SkeletalCategoryOfFiniteSets(  );
end;
        
        
    
    cat := category_constructor(  : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_SkeletalCategoryOfFiniteSetsWithMorphismsGivenByLists_precompiled( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
