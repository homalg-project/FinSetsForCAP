# SPDX-License-Identifier: GPL-2.0-or-later
# FinSetsForCAP: The elementary topos of (skeletal) finite sets
#
# Implementations
#
BindGlobal( "ADD_FUNCTIONS_FOR_CategoryOfSkeletalFinSetsPrecompiled", function ( cat )
    
    ##
    AddCartesianBraidingInverseWithGivenDirectProducts( cat,
        
########
function ( cat_1, s_1, a_1, b_1, r_1 )
    local hoisted_1_1, hoisted_2_1;
    hoisted_2_1 := Length( a_1 );
    hoisted_1_1 := Length( b_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, r_1, AsList, List( [ 0 .. Length( s_1 ) - 1 ], function ( i_2 )
              return REM_INT( i_2, hoisted_1_1 ) * hoisted_2_1 + QUO_INT( i_2, hoisted_1_1 );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddCartesianCoevaluationMorphismWithGivenRange( cat,
        
########
function ( cat_1, a_1, b_1, r_1 )
    local hoisted_1_1, hoisted_2_1, deduped_3_1, deduped_4_1, deduped_5_1;
    deduped_5_1 := Length( b_1 );
    deduped_4_1 := Length( a_1 );
    deduped_3_1 := deduped_4_1 * deduped_5_1;
    hoisted_2_1 := deduped_4_1 * deduped_3_1 * GeometricSumDiff1( deduped_3_1, deduped_5_1 );
    hoisted_1_1 := GeometricSum( deduped_3_1, deduped_5_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, r_1, AsList, List( [ 0 .. deduped_4_1 - 1 ], function ( i_2 )
              return i_2 * hoisted_1_1 + hoisted_2_1;
          end ) );
end
########
        
    , 100 );
    
    ##
    AddCartesianEvaluationMorphismWithGivenSource( cat,
        
########
function ( cat_1, a_1, b_1, s_1 )
    local hoisted_1_1, hoisted_2_1, deduped_3_1, deduped_4_1, deduped_5_1;
    deduped_5_1 := Length( a_1 );
    deduped_4_1 := Length( b_1 );
    deduped_3_1 := deduped_4_1 ^ deduped_5_1;
    hoisted_2_1 := deduped_4_1;
    hoisted_1_1 := deduped_3_1;
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, b_1, AsList, List( [ 0 .. deduped_3_1 * deduped_5_1 - 1 ], function ( i_2 )
              return REM_INT( QUO_INT( i_2, hoisted_2_1 ^ QUO_INT( i_2, hoisted_1_1 ) ), hoisted_2_1 );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddCartesianLambdaElimination( cat,
        
########
function ( cat_1, a_1, b_1, alpha_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, deduped_10_1, deduped_11_1, deduped_12_1, deduped_13_1, deduped_14_1;
    deduped_14_1 := Length( b_1 );
    deduped_13_1 := Length( a_1 );
    deduped_12_1 := Length( Source( alpha_1 ) );
    deduped_11_1 := deduped_14_1 ^ deduped_13_1;
    deduped_10_1 := [ 0 .. deduped_12_1 * deduped_13_1 - 1 ];
    hoisted_2_1 := deduped_14_1;
    hoisted_1_1 := deduped_11_1;
    hoisted_8_1 := List( [ 0 .. deduped_11_1 * deduped_13_1 - 1 ], function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_2_1 ^ QUO_INT( i_2, hoisted_1_1 ) ), hoisted_2_1 );
        end );
    hoisted_7_1 := Length( Range( alpha_1 ) );
    hoisted_6_1 := deduped_13_1;
    hoisted_5_1 := AsList( alpha_1 );
    hoisted_4_1 := deduped_12_1;
    hoisted_3_1 := deduped_10_1;
    hoisted_9_1 := List( deduped_10_1, function ( logic_new_func_x_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[1 + logic_new_func_x_2] );
            return hoisted_8_1[1 + (hoisted_5_1[1 + REM_INT( deduped_1_2, hoisted_4_1 )] + REM_INT( QUO_INT( deduped_1_2, hoisted_4_1 ), hoisted_6_1 ) * hoisted_7_1)];
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, b_1, AsList, List( [ 0 .. deduped_13_1 - 1 ], function ( i_2 )
              return hoisted_9_1[1 + i_2];
          end ) );
end
########
        
    , 1407 : IsPrecompiledDerivation := true );
    
    ##
    AddCartesianLambdaIntroduction( cat,
        
########
function ( cat_1, alpha_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, deduped_6_1, deduped_7_1, deduped_8_1;
    deduped_8_1 := Length( Source( alpha_1 ) );
    deduped_7_1 := Length( Range( alpha_1 ) );
    deduped_6_1 := [ 0 .. deduped_8_1 - 1 ];
    hoisted_5_1 := deduped_7_1;
    hoisted_4_1 := AsList( alpha_1 );
    hoisted_3_1 := CAP_JIT_INCOMPLETE_LOGIC( [ 0 .. deduped_8_1 ^ deduped_8_1 - 1 ][1 + deduped_8_1 * GeometricSumDiff1( deduped_8_1, deduped_8_1 )] );
    hoisted_2_1 := deduped_8_1;
    hoisted_1_1 := deduped_6_1;
    return CreateCapCategoryMorphismWithAttributes( cat_1, CreateCapCategoryObjectWithAttributes( cat_1, Length, 1 ), CreateCapCategoryObjectWithAttributes( cat_1, Length, deduped_7_1 ^ deduped_8_1 ), AsList, [ Sum( List( deduped_6_1, function ( k_2 )
                    return hoisted_4_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_1_1[(1 + REM_INT( QUO_INT( hoisted_3_1, hoisted_2_1 ^ CAP_JIT_INCOMPLETE_LOGIC( hoisted_1_1[(1 + k_2)] ) ), hoisted_2_1 ))] ))] * hoisted_5_1 ^ k_2;
                end ) ) ] );
end
########
        
    , 1105 : IsPrecompiledDerivation := true );
    
    ##
    AddCartesianLeftUnitorInverseWithGivenDirectProduct( cat,
        
########
function ( cat_1, a_1, r_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, a_1, AsList, [ 0 .. Length( a_1 ) - 1 ] );
end
########
        
    , 100 );
    
    ##
    AddCartesianLeftUnitorWithGivenDirectProduct( cat,
        
########
function ( cat_1, a_1, s_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, a_1, AsList, [ 0 .. Length( a_1 ) - 1 ] );
end
########
        
    , 100 );
    
    ##
    AddCartesianRightUnitorInverseWithGivenDirectProduct( cat,
        
########
function ( cat_1, a_1, r_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, a_1, AsList, [ 0 .. Length( a_1 ) - 1 ] );
end
########
        
    , 100 );
    
    ##
    AddCartesianRightUnitorWithGivenDirectProduct( cat,
        
########
function ( cat_1, a_1, s_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, a_1, AsList, [ 0 .. Length( a_1 ) - 1 ] );
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
    return CreateCapCategoryMorphismWithAttributes( cat_1, deduped_2_1, Omega_1, AsList, List( [ 0 .. Length( deduped_2_1 ) - 1 ], function ( x_2 )
              if x_2 in hoisted_1_1 then
                  return 1;
              else
                  return 0;
              fi;
              return;
          end ) );
end
########
        
    , 100 );
    
    ##
    AddCoastrictionToImageWithGivenImageObject( cat,
        
########
function ( cat_1, alpha_1, I_1 )
    local hoisted_1_1, hoisted_2_1, deduped_3_1, deduped_4_1;
    deduped_4_1 := AsList( alpha_1 );
    deduped_3_1 := Source( alpha_1 );
    hoisted_2_1 := SSortedList( deduped_4_1 );
    hoisted_1_1 := deduped_4_1;
    return CreateCapCategoryMorphismWithAttributes( cat_1, deduped_3_1, I_1, AsList, List( [ 0 .. Length( deduped_3_1 ) - 1 ], function ( i_2 )
              return -1 + SafePosition( hoisted_2_1, hoisted_1_1[(1 + i_2)] );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddCoequalizer( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, Length, Length( SKELETAL_FIN_SETS_ExplicitCoequalizer( arg2_1, arg3_1 ) ) );
end
########
        
    , 100 );
    
    ##
    AddColift( cat,
        
########
function ( cat_1, alpha_1, beta_1 )
    local hoisted_1_1, hoisted_2_1, deduped_3_1;
    deduped_3_1 := Range( alpha_1 );
    hoisted_2_1 := AsList( beta_1 );
    hoisted_1_1 := AsList( alpha_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, deduped_3_1, Range( beta_1 ), AsList, List( [ 0 .. Length( deduped_3_1 ) - 1 ], function ( y_2 )
              if not y_2 in hoisted_1_1 then
                  return 0;
              else
                  return hoisted_2_1[SafePosition( hoisted_1_1, y_2 )];
              fi;
              return;
          end ) );
end
########
        
    , 100 );
    
    ##
    AddCoproduct( cat,
        
########
function ( cat_1, arg2_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, Length, Sum( List( arg2_1, Length ) ) );
end
########
        
    , 100 );
    
    ##
    AddDirectProduct( cat,
        
########
function ( cat_1, arg2_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, Length, Product( List( arg2_1, Length ) ) );
end
########
        
    , 100 );
    
    ##
    AddEmbeddingOfEqualizerWithGivenEqualizer( cat,
        
########
function ( cat_1, Y_1, morphisms_1, P_1 )
    local hoisted_1_1, hoisted_2_1;
    hoisted_2_1 := [ 1 .. Length( morphisms_1 ) - 1 ];
    hoisted_1_1 := List( morphisms_1, AsList );
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, Y_1, AsList, Filtered( [ 0 .. Length( Y_1 ) - 1 ], function ( x_2 )
              local hoisted_1_2;
              hoisted_1_2 := 1 + x_2;
              return ForAll( hoisted_2_1, function ( j_3 )
                      return hoisted_1_1[j_3][hoisted_1_2] = hoisted_1_1[j_3 + 1][hoisted_1_2];
                  end );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddEpimorphismFromSomeProjectiveObject( cat,
        
########
function ( cat_1, A_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, A_1, A_1, AsList, [ 0 .. Length( A_1 ) - 1 ] );
end
########
        
    , 100 );
    
    ##
    AddEqualizer( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_1_1, hoisted_2_1;
    hoisted_2_1 := [ 1 .. Length( arg3_1 ) - 1 ];
    hoisted_1_1 := List( arg3_1, AsList );
    return CreateCapCategoryObjectWithAttributes( cat_1, Length, Length( Filtered( [ 0 .. Length( arg2_1 ) - 1 ], function ( x_2 )
                local hoisted_1_2;
                hoisted_1_2 := 1 + x_2;
                return ForAll( hoisted_2_1, function ( j_3 )
                        return hoisted_1_1[j_3][hoisted_1_2] = hoisted_1_1[j_3 + 1][hoisted_1_2];
                    end );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddExponentialOnMorphismsWithGivenExponentials( cat,
        
########
function ( cat_1, s_1, alpha_1, beta_1, r_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, deduped_7_1, deduped_8_1;
    deduped_8_1 := Length( Range( alpha_1 ) );
    deduped_7_1 := Length( Source( beta_1 ) );
    hoisted_6_1 := Length( Range( beta_1 ) );
    hoisted_5_1 := AsList( beta_1 );
    hoisted_4_1 := AsList( alpha_1 );
    hoisted_3_1 := [ 0 .. Length( Source( alpha_1 ) ) - 1 ];
    hoisted_2_1 := [ 0 .. deduped_8_1 - 1 ];
    hoisted_1_1 := deduped_7_1;
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, r_1, AsList, List( [ 0 .. deduped_7_1 ^ deduped_8_1 - 1 ], function ( i_2 )
              local hoisted_1_2;
              hoisted_1_2 := List( hoisted_2_1, function ( j_3 )
                      return REM_INT( QUO_INT( i_2, hoisted_1_1 ^ j_3 ), hoisted_1_1 );
                  end );
              return Sum( List( hoisted_3_1, function ( k_3 )
                        return hoisted_5_1[(1 + hoisted_1_2[(1 + hoisted_4_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_3_1[(1 + k_3)] ))])])] * hoisted_6_1 ^ k_3;
                    end ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddExponentialOnObjects( cat,
        
########
function ( cat_1, a_1, b_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, Length, Length( b_1 ) ^ Length( a_1 ) );
end
########
        
    , 100 );
    
    ##
    AddIdentityMorphism( cat,
        
########
function ( cat_1, a_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, a_1, AsList, [ 0 .. Length( a_1 ) - 1 ] );
end
########
        
    , 100 );
    
    ##
    AddImageEmbeddingWithGivenImageObject( cat,
        
########
function ( cat_1, alpha_1, I_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, I_1, Range( alpha_1 ), AsList, SSortedList( AsList( alpha_1 ) ) );
end
########
        
    , 100 );
    
    ##
    AddImageObject( cat,
        
########
function ( cat_1, arg2_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, Length, Length( SSortedList( AsList( arg2_1 ) ) ) );
end
########
        
    , 100 );
    
    ##
    AddInitialObject( cat,
        
########
function ( cat_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, Length, 0 );
end
########
        
    , 100 );
    
    ##
    AddInjectionOfCofactorOfCoproductWithGivenCoproduct( cat,
        
########
function ( cat_1, objects_1, k_1, P_1 )
    local deduped_1_1, deduped_2_1;
    deduped_2_1 := List( objects_1, Length );
    deduped_1_1 := Sum( deduped_2_1{[ 1 .. k_1 - 1 ]} );
    return CreateCapCategoryMorphismWithAttributes( cat_1, objects_1[k_1], P_1, AsList, [ deduped_1_1 .. deduped_1_1 + deduped_2_1[k_1] - 1 ] );
end
########
        
    , 100 );
    
    ##
    AddIsColiftable( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_1_1, hoisted_2_1, deduped_3_1;
    deduped_3_1 := AsList( arg2_1 );
    hoisted_2_1 := AsList( arg3_1 );
    hoisted_1_1 := deduped_3_1;
    return ForAll( SSortedList( deduped_3_1 ), function ( i_2 )
            return Length( SSortedList( hoisted_2_1{Positions( hoisted_1_1, i_2 )} ) ) = 1;
        end );
end
########
        
    , 100 );
    
    ##
    AddIsEpimorphism( cat,
        
########
function ( cat_1, arg2_1 )
    return not false in SKELETAL_FIN_SETS_IsEpimorphism( AsList( arg2_1 ), Length( Range( arg2_1 ) ) );
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
    return Length( arg2_1 ) = Length( arg3_1 );
end
########
        
    , 100 );
    
    ##
    AddIsHomSetInhabited( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    return Length( arg2_1 ) = 0 or not Length( arg3_1 ) = 0;
end
########
        
    , 100 );
    
    ##
    AddIsInitial( cat,
        
########
function ( cat_1, arg2_1 )
    return Length( arg2_1 ) = 0;
end
########
        
    , 100 );
    
    ##
    AddIsInjective( cat,
        
########
function ( cat_1, arg2_1 )
    return not Length( arg2_1 ) = 0;
end
########
        
    , 100 );
    
    ##
    AddIsLiftable( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_1_1, deduped_2_1, deduped_3_1;
    deduped_3_1 := AsList( arg3_1 );
    deduped_2_1 := AsList( arg2_1 );
    hoisted_1_1 := deduped_3_1;
    return ForAll( IdFunc( function (  )
                if 100 * Length( deduped_2_1 ) < Length( deduped_3_1 ) then
                    return SSortedList( deduped_2_1 );
                else
                    return deduped_2_1;
                fi;
                return;
            end )(  ), function ( y_2 )
            return y_2 in hoisted_1_1;
        end );
end
########
        
    , 100 );
    
    ##
    AddIsMonomorphism( cat,
        
########
function ( cat_1, arg2_1 )
    return SKELETAL_FIN_SETS_IsMonomorphism( AsList( arg2_1 ), Length( Range( arg2_1 ) ) );
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
    return not false in SKELETAL_FIN_SETS_IsEpimorphism( AsList( arg2_1 ), Length( Range( arg2_1 ) ) );
end
########
        
    , 100 );
    
    ##
    AddIsSplitMonomorphism( cat,
        
########
function ( cat_1, arg2_1 )
    local deduped_1_1;
    deduped_1_1 := Length( Range( arg2_1 ) );
    return deduped_1_1 = 0 or not Length( Source( arg2_1 ) ) = 0 and SKELETAL_FIN_SETS_IsMonomorphism( AsList( arg2_1 ), deduped_1_1 );
end
########
        
    , 100 );
    
    ##
    AddIsTerminal( cat,
        
########
function ( cat_1, arg2_1 )
    return Length( arg2_1 ) = 1;
end
########
        
    , 100 );
    
    ##
    AddIsWellDefinedForMorphisms( cat,
        
########
function ( cat_1, arg2_1 )
    local hoisted_1_1, deduped_2_1;
    deduped_2_1 := AsList( arg2_1 );
    hoisted_1_1 := Length( Range( arg2_1 ) );
    if not ForAll( deduped_2_1, function ( a_2 )
                 return (IsInt( a_2 ) and a_2 >= 0);
             end ) then
        return false;
    elif Length( Source( arg2_1 ) ) <> Length( deduped_2_1 ) then
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
    return Length( arg2_1 ) >= 0;
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
    return CreateCapCategoryMorphismWithAttributes( cat_1, deduped_3_1, Source( beta_1 ), AsList, List( [ 0 .. Length( deduped_3_1 ) - 1 ], function ( x_2 )
              return -1 + SafePosition( hoisted_2_1, hoisted_1_1[(1 + x_2)] );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddMonomorphismIntoSomeInjectiveObjectWithGivenSomeInjectiveObject( cat,
        
########
function ( cat_1, A_1, I_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, A_1, I_1, AsList, [ 0 .. Length( A_1 ) - 1 ] );
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
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, deduped_7_1, deduped_8_1, deduped_9_1, deduped_10_1;
    deduped_10_1 := Length( arg2_1 );
    deduped_9_1 := Length( arg3_1 );
    deduped_8_1 := deduped_9_1 ^ deduped_10_1;
    deduped_7_1 := [ 0 .. deduped_10_1 - 1 ];
    hoisted_6_1 := deduped_7_1;
    hoisted_2_1 := deduped_9_1;
    hoisted_1_1 := deduped_8_1;
    hoisted_5_1 := List( [ 0 .. deduped_8_1 * deduped_10_1 - 1 ], function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_2_1 ^ QUO_INT( i_2, hoisted_1_1 ) ), hoisted_2_1 );
        end );
    hoisted_3_1 := deduped_10_1;
    hoisted_4_1 := List( deduped_7_1, function ( logic_new_func_x_2 )
            return REM_INT( logic_new_func_x_2, hoisted_3_1 );
        end );
    return List( [ 0 .. deduped_8_1 - 1 ], function ( i_2 )
            return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg3_1, AsList, List( hoisted_6_1, function ( logic_new_func_x_3 )
                      return hoisted_5_1[1 + (i_2 + hoisted_4_1[(1 + logic_new_func_x_3)] * hoisted_1_1)];
                  end ) );
        end );
end
########
        
    , 100 );
    
    ##
    AddObjectConstructor( cat,
        
########
function ( cat_1, arg2_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, Length, arg2_1 );
end
########
        
    , 100 );
    
    ##
    AddObjectDatum( cat,
        
########
function ( cat_1, arg2_1 )
    return Length( arg2_1 );
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
    return CreateCapCategoryMorphismWithAttributes( cat_1, deduped_3_1, Range( beta_1 ), AsList, List( [ 0 .. Length( deduped_3_1 ) - 1 ], function ( i_2 )
              return hoisted_2_1[1 + hoisted_1_1[(1 + i_2)]];
          end ) );
end
########
        
    , 100 );
    
    ##
    AddProjectionInFactorOfDirectProductWithGivenDirectProduct( cat,
        
########
function ( cat_1, objects_1, k_1, P_1 )
    local hoisted_1_1, hoisted_2_1, deduped_3_1;
    deduped_3_1 := List( objects_1, Length );
    hoisted_2_1 := deduped_3_1[k_1];
    hoisted_1_1 := Product( deduped_3_1{[ 1 .. k_1 - 1 ]} );
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, objects_1[k_1], AsList, List( [ 0 .. Length( P_1 ) - 1 ], function ( i_2 )
              return REM_INT( QUO_INT( i_2, hoisted_1_1 ), hoisted_2_1 );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddProjectionOntoCoequalizerWithGivenCoequalizer( cat,
        
########
function ( cat_1, Y_1, morphisms_1, P_1 )
    local hoisted_1_1;
    hoisted_1_1 := SKELETAL_FIN_SETS_ExplicitCoequalizer( Y_1, morphisms_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Y_1, P_1, AsList, List( [ 0 .. Length( Y_1 ) - 1 ], function ( x_2 )
              return -1 + SafePosition( hoisted_1_1, SafeFirst( hoisted_1_1, function ( c_3 )
                          return (x_2 in c_3);
                      end ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddPushoutComplement( cat,
        
########
function ( cat_1, l_1, m_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, hoisted_19_1, deduped_20_1, deduped_21_1, deduped_22_1, deduped_23_1, deduped_24_1, deduped_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1;
    deduped_34_1 := Range( m_1 );
    deduped_33_1 := Length( Source( l_1 ) );
    deduped_32_1 := Length( Source( m_1 ) );
    deduped_31_1 := Length( deduped_34_1 );
    deduped_30_1 := [ 0 .. deduped_31_1 - 1 ];
    deduped_29_1 := [ 0 .. deduped_32_1 * deduped_33_1 - 1 ];
    deduped_28_1 := [ 0 .. deduped_32_1 * deduped_32_1 - 1 ];
    hoisted_3_1 := deduped_32_1;
    deduped_27_1 := Filtered( deduped_28_1, function ( x_2 )
            return REM_INT( x_2, hoisted_3_1 ) = REM_INT( QUO_INT( x_2, hoisted_3_1 ), hoisted_3_1 );
        end );
    hoisted_9_1 := AsList( l_1 );
    hoisted_8_1 := deduped_33_1;
    deduped_26_1 := Filtered( deduped_29_1, function ( x_2 )
            return REM_INT( x_2, hoisted_3_1 ) = hoisted_9_1[1 + REM_INT( QUO_INT( x_2, hoisted_3_1 ), hoisted_8_1 )];
        end );
    deduped_25_1 := Length( deduped_26_1 );
    deduped_24_1 := [ 0 .. deduped_25_1 - 1 ];
    deduped_23_1 := [ 0 .. deduped_25_1 * deduped_33_1 - 1 ];
    hoisted_11_1 := deduped_29_1;
    hoisted_10_1 := deduped_26_1;
    hoisted_13_1 := List( deduped_24_1, function ( logic_new_func_x_2 )
            return REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( hoisted_11_1[1 + hoisted_10_1[(1 + logic_new_func_x_2)]] ), hoisted_3_1 ), hoisted_8_1 );
        end );
    hoisted_12_1 := deduped_25_1;
    deduped_22_1 := Filtered( deduped_23_1, function ( x_2 )
            return hoisted_13_1[1 + REM_INT( x_2, hoisted_12_1 )] = REM_INT( QUO_INT( x_2, hoisted_12_1 ), hoisted_8_1 );
        end );
    hoisted_18_1 := [ 1, 0, 1, 1 ];
    hoisted_6_1 := AsList( m_1 );
    hoisted_16_1 := List( deduped_24_1, function ( logic_new_func_x_2 )
            return hoisted_6_1[1 + REM_INT( CAP_JIT_INCOMPLETE_LOGIC( hoisted_11_1[(1 + hoisted_10_1[(1 + logic_new_func_x_2)])] ), hoisted_3_1 )];
        end );
    hoisted_15_1 := deduped_23_1;
    hoisted_14_1 := deduped_22_1;
    hoisted_17_1 := List( [ 0 .. Length( deduped_22_1 ) - 1 ], function ( logic_new_func_x_2 )
            return hoisted_16_1[1 + REM_INT( CAP_JIT_INCOMPLETE_LOGIC( hoisted_15_1[(1 + hoisted_14_1[(1 + logic_new_func_x_2)])] ), hoisted_12_1 )];
        end );
    hoisted_5_1 := deduped_28_1;
    hoisted_4_1 := deduped_27_1;
    hoisted_7_1 := List( [ 0 .. Length( deduped_27_1 ) - 1 ], function ( logic_new_func_x_2 )
            return hoisted_6_1[1 + REM_INT( CAP_JIT_INCOMPLETE_LOGIC( hoisted_5_1[(1 + hoisted_4_1[(1 + logic_new_func_x_2)])] ), hoisted_3_1 )];
        end );
    hoisted_2_1 := deduped_30_1;
    hoisted_1_1 := deduped_31_1;
    deduped_21_1 := Filtered( deduped_30_1, function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_2_1[1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_2_1[(1 + REM_INT( x_2, hoisted_1_1 ))] )] );
            return hoisted_18_1[1 + (IdFunc( function (  )
                             if (deduped_1_2 in hoisted_7_1) then
                                 return 1;
                             else
                                 return 0;
                             fi;
                             return;
                         end )(  ) + IdFunc( function (  )
                               if (deduped_1_2 in hoisted_17_1) then
                                   return 1;
                               else
                                   return 0;
                               fi;
                               return;
                           end )(  ) * 2)] = 1;
        end );
    hoisted_19_1 := deduped_21_1;
    deduped_20_1 := SSortedList( List( [ 0 .. Length( deduped_21_1 ) - 1 ], function ( logic_new_func_x_2 )
              return REM_INT( CAP_JIT_INCOMPLETE_LOGIC( hoisted_2_1[1 + REM_INT( CAP_JIT_INCOMPLETE_LOGIC( hoisted_2_1[(1 + hoisted_19_1[(1 + logic_new_func_x_2)])] ), hoisted_1_1 )] ), hoisted_1_1 );
          end ) );
    return CreateCapCategoryMorphismWithAttributes( cat_1, CreateCapCategoryObjectWithAttributes( cat_1, Length, Length( deduped_20_1 ) ), deduped_34_1, AsList, deduped_20_1 );
end
########
        
    , 5723 : IsPrecompiledDerivation := true );
    
    ##
    AddSomeInjectiveObject( cat,
        
########
function ( cat_1, arg2_1 )
    if Length( arg2_1 ) = 0 then
        return CreateCapCategoryObjectWithAttributes( cat_1, Length, 1 );
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
    return CreateCapCategoryObjectWithAttributes( cat_1, Length, 2 );
end
########
        
    , 100 );
    
    ##
    AddTerminalObject( cat,
        
########
function ( cat_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, Length, 1 );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismFromCoequalizerWithGivenCoequalizer( cat,
        
########
function ( cat_1, Y_1, morphisms_1, T_1, tau_1, P_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, Range( tau_1 ), AsList, List( SKELETAL_FIN_SETS_ExplicitCoequalizer( Y_1, morphisms_1 ), function ( x_2 )
              return tau_1( x_2[1] );
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
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, T_1, AsList, [  ] );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismIntoDirectProductWithGivenDirectProduct( cat,
        
########
function ( cat_1, objects_1, T_1, tau_1, P_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, deduped_5_1;
    deduped_5_1 := [ 0 .. Length( objects_1 ) - 1 ];
    hoisted_4_1 := deduped_5_1;
    hoisted_2_1 := List( objects_1, Length );
    hoisted_3_1 := List( deduped_5_1, function ( j_2 )
            return Product( hoisted_2_1{[ 1 .. j_2 ]} );
        end );
    hoisted_1_1 := List( tau_1, AsList );
    return CreateCapCategoryMorphismWithAttributes( cat_1, T_1, P_1, AsList, List( [ 0 .. Length( T_1 ) - 1 ], function ( i_2 )
              local hoisted_1_2;
              hoisted_1_2 := 1 + i_2;
              return Sum( hoisted_4_1, function ( j_3 )
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
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1;
    hoisted_2_1 := [ 1 .. Length( morphisms_1 ) - 1 ];
    hoisted_1_1 := List( morphisms_1, AsList );
    hoisted_4_1 := Filtered( [ 0 .. Length( Y_1 ) - 1 ], function ( x_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + x_2;
            return ForAll( hoisted_2_1, function ( j_3 )
                    return hoisted_1_1[j_3][hoisted_1_2] = hoisted_1_1[j_3 + 1][hoisted_1_2];
                end );
        end );
    hoisted_3_1 := AsList( tau_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, T_1, P_1, AsList, List( [ 0 .. Length( T_1 ) - 1 ], function ( x_2 )
              return -1 + SafePosition( hoisted_4_1, hoisted_3_1[(1 + x_2)] );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismIntoTerminalObjectWithGivenTerminalObject( cat,
        
########
function ( cat_1, T_1, P_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, T_1, P_1, AsList, ListWithIdenticalEntries( Length( T_1 ), 0 ) );
end
########
        
    , 100 );
    
    if IsBound( cat!.precompiled_functions_added ) then
        
        # COVERAGE_IGNORE_NEXT_LINE
        Error( "precompiled functions have already been added before" );
        
    fi;
    
    cat!.precompiled_functions_added := true;
    
end );

BindGlobal( "CategoryOfSkeletalFinSetsPrecompiled", function (  )
  local category_constructor, cat;
    
    category_constructor :=
        
        
        function (  )
    return CategoryOfSkeletalFinSets(  );
end;
        
        
    
    cat := category_constructor(  : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_CategoryOfSkeletalFinSetsPrecompiled( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
