# SPDX-License-Identifier: GPL-2.0-or-later
# FinSetsForCAP: The elementary topos of (skeletal) finite sets
#
# Implementations
#
BindGlobal( "ADD_FUNCTIONS_FOR_CategoryOfSkeletalFinSetsWithMorphismsGivenByListsPrecompiled", function ( cat )
    
    ##
    AddCartesianBraidingInverseWithGivenDirectProducts( cat,
        
########
function ( cat_1, s_1, a_1, b_1, r_1 )
    local deduped_1_1, hoisted_2_1;
    hoisted_2_1 := Length( a_1 );
    deduped_1_1 := Length( b_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, r_1, AsList, List( [ 0 .. Length( s_1 ) - 1 ], function ( i_2 )
              return REM_INT( i_2, deduped_1_1 ) * hoisted_2_1 + QUO_INT( i_2, deduped_1_1 );
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
    local hoisted_1_1, deduped_3_1;
    deduped_3_1 := Length( b_1 );
    hoisted_1_1 := deduped_3_1 ^ Length( a_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, b_1, AsList, List( [ 0 .. Length( s_1 ) - 1 ], function ( i_2 )
              return REM_INT( QUO_INT( i_2, deduped_3_1 ^ QUO_INT( i_2, hoisted_1_1 ) ), deduped_3_1 );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddCartesianLambdaElimination( cat,
        
########
function ( cat_1, a_1, b_1, alpha_1 )
    local deduped_1_1, hoisted_2_1;
    hoisted_2_1 := AsList( alpha_1 )[1];
    deduped_1_1 := Length( b_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, b_1, AsList, List( [ 0 .. Length( a_1 ) - 1 ], function ( i_2 )
              return REM_INT( QUO_INT( hoisted_2_1, deduped_1_1 ^ i_2 ), deduped_1_1 );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddCartesianLambdaIntroduction( cat,
        
########
function ( cat_1, alpha_1 )
    local hoisted_1_1, deduped_3_1, deduped_4_1;
    deduped_4_1 := Length( Source( alpha_1 ) );
    deduped_3_1 := Length( Range( alpha_1 ) );
    hoisted_1_1 := AsList( alpha_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, CreateCapCategoryObjectWithAttributes( cat_1, Length, BigInt( 1 ) ), CreateCapCategoryObjectWithAttributes( cat_1, Length, deduped_3_1 ^ deduped_4_1 ), AsList, [ Sum( List( [ 0 .. deduped_4_1 - 1 ], function ( k_2 )
                    return hoisted_1_1[(1 + k_2)] * deduped_3_1 ^ k_2;
                end ) ) ] );
end
########
        
    , 100 );
    
    ##
    AddCartesianLeftUnitorInverseWithGivenDirectProduct( cat,
        
########
function ( cat_1, a_1, r_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, r_1, AsList, [ 0 .. Length( a_1 ) - 1 ] );
end
########
        
    , 100 );
    
    ##
    AddCartesianLeftUnitorWithGivenDirectProduct( cat,
        
########
function ( cat_1, a_1, s_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, a_1, AsList, [ 0 .. Length( a_1 ) - 1 ] );
end
########
        
    , 100 );
    
    ##
    AddCartesianRightUnitorInverseWithGivenDirectProduct( cat,
        
########
function ( cat_1, a_1, r_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, r_1, AsList, [ 0 .. Length( a_1 ) - 1 ] );
end
########
        
    , 100 );
    
    ##
    AddCartesianRightUnitorWithGivenDirectProduct( cat,
        
########
function ( cat_1, a_1, s_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, a_1, AsList, [ 0 .. Length( a_1 ) - 1 ] );
end
########
        
    , 100 );
    
    ##
    AddClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier( cat,
        
########
function ( cat_1, alpha_1, Omega_1 )
    local hoisted_1_1, hoisted_2_1, deduped_3_1;
    deduped_3_1 := Range( alpha_1 );
    hoisted_2_1 := BigInt( 1 );
    hoisted_1_1 := AsList( alpha_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, deduped_3_1, Omega_1, AsList, List( [ 0 .. Length( deduped_3_1 ) - 1 ], function ( x_2 )
              if x_2 in hoisted_1_1 then
                  return hoisted_2_1;
              else
                  return BigInt( 0 );
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
    local hoisted_2_1, deduped_3_1, deduped_4_1;
    deduped_4_1 := AsList( alpha_1 );
    deduped_3_1 := Source( alpha_1 );
    hoisted_2_1 := SSortedList( deduped_4_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, deduped_3_1, I_1, AsList, List( [ 0 .. Length( deduped_3_1 ) - 1 ], function ( i_2 )
              return -1 + BigInt( SafePosition( hoisted_2_1, deduped_4_1[(1 + i_2)] ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddCoequalizer( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, Length, BigInt( Length( SKELETAL_FIN_SETS_ExplicitCoequalizer( arg2_1, arg3_1 ) ) ) );
end
########
        
    , 100 );
    
    ##
    AddColift( cat,
        
########
function ( cat_1, alpha_1, beta_1 )
    local deduped_1_1, hoisted_2_1, hoisted_3_1, deduped_4_1;
    deduped_4_1 := Range( alpha_1 );
    hoisted_3_1 := AsList( beta_1 );
    hoisted_2_1 := BigInt( 0 );
    deduped_1_1 := AsList( alpha_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, deduped_4_1, Range( beta_1 ), AsList, List( [ 0 .. Length( deduped_4_1 ) - 1 ], function ( y_2 )
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
    local deduped_1_1, hoisted_2_1;
    hoisted_2_1 := [ 1 .. Length( morphisms_1 ) - 1 ];
    deduped_1_1 := List( morphisms_1, AsList );
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, Y_1, AsList, Filtered( [ 0 .. Length( Y_1 ) - 1 ], function ( x_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + x_2;
                return ForAll( hoisted_2_1, function ( j_3 )
                        return deduped_1_1[j_3][deduped_1_2] = deduped_1_1[j_3 + 1][deduped_1_2];
                    end );
            end ){[ 1 .. Length( P_1 ) ]} );
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
    local deduped_1_1, hoisted_2_1;
    hoisted_2_1 := [ 1 .. Length( arg3_1 ) - 1 ];
    deduped_1_1 := List( arg3_1, AsList );
    return CreateCapCategoryObjectWithAttributes( cat_1, Length, Length( Filtered( [ 0 .. Length( arg2_1 ) - 1 ], function ( i_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + i_2;
                return ForAll( hoisted_2_1, function ( j_3 )
                        return deduped_1_1[j_3][deduped_1_2] = deduped_1_1[j_3 + 1][deduped_1_2];
                    end );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddExactCoverWithGlobalElements( cat,
        
########
function ( cat_1, arg2_1 )
    local hoisted_1_1;
    hoisted_1_1 := CreateCapCategoryObjectWithAttributes( cat_1, Length, BigInt( 1 ) );
    return List( [ 0 .. Length( arg2_1 ) - 1 ], function ( i_2 )
            return CreateCapCategoryMorphismWithAttributes( cat_1, hoisted_1_1, arg2_1, AsList, [ i_2 ] );
        end );
end
########
        
    , 100 );
    
    ##
    AddExponentialOnMorphismsWithGivenExponentials( cat,
        
########
function ( cat_1, s_1, alpha_1, beta_1, r_1 )
    local hoisted_1_1, deduped_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1;
    hoisted_5_1 := [ 0 .. Length( Source( alpha_1 ) ) - 1 ];
    hoisted_4_1 := Length( Range( beta_1 ) );
    hoisted_3_1 := AsList( beta_1 );
    deduped_2_1 := Length( Source( beta_1 ) );
    hoisted_1_1 := AsList( alpha_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, r_1, AsList, List( [ 0 .. Length( s_1 ) - 1 ], function ( i_2 )
              return Sum( List( hoisted_5_1, function ( k_3 )
                        return hoisted_3_1[(1 + REM_INT( QUO_INT( i_2, deduped_2_1 ^ hoisted_1_1[(1 + k_3)] ), deduped_2_1 ))] * hoisted_4_1 ^ k_3;
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
    return CreateCapCategoryMorphismWithAttributes( cat_1, I_1, Range( alpha_1 ), AsList, SSortedList( AsList( alpha_1 ) ){[ 1 .. Length( I_1 ) ]} );
end
########
        
    , 100 );
    
    ##
    AddImageObject( cat,
        
########
function ( cat_1, arg2_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, Length, BigInt( Length( SSortedList( AsList( arg2_1 ) ) ) ) );
end
########
        
    , 100 );
    
    ##
    AddInitialObject( cat,
        
########
function ( cat_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, Length, BigInt( 0 ) );
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
    local hoisted_2_1, deduped_3_1;
    deduped_3_1 := AsList( arg2_1 );
    hoisted_2_1 := AsList( arg3_1 );
    return ForAll( SSortedList( deduped_3_1 ), function ( i_2 )
            return Length( SSortedList( hoisted_2_1{Positions( deduped_3_1, i_2 )} ) ) = 1;
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
    return Length( arg2_1 ) = 0 or Length( arg3_1 ) <> 0;
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
    return Length( arg2_1 ) <> 0;
end
########
        
    , 100 );
    
    ##
    AddIsLiftable( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_1_1, deduped_2_1;
    deduped_2_1 := AsList( arg2_1 );
    hoisted_1_1 := AsList( arg3_1 );
    return ForAll( IdFunc( function (  )
                if 100 * Length( Source( arg2_1 ) ) < Length( Source( arg3_1 ) ) then
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
    return deduped_1_1 = 0 or Length( Source( arg2_1 ) ) <> 0 and SKELETAL_FIN_SETS_IsMonomorphism( AsList( arg2_1 ), deduped_1_1 );
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
    local hoisted_1_1, hoisted_3_1, deduped_4_1;
    deduped_4_1 := AsList( arg2_1 );
    hoisted_3_1 := Length( Range( arg2_1 ) );
    hoisted_1_1 := List( deduped_4_1, IsBigInt );
    if not ForAll( [ 0 .. Length( Source( arg2_1 ) ) - 1 ], function ( x_2 )
                 local deduped_1_2, deduped_2_2;
                 deduped_2_2 := 1 + x_2;
                 deduped_1_2 := deduped_4_1[deduped_2_2];
                 return (hoisted_1_1[deduped_2_2] and deduped_1_2 >= 0 and deduped_1_2 < hoisted_3_1);
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
              return -1 + BigInt( SafePosition( hoisted_2_1, hoisted_1_1[(1 + x_2)] ) );
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
    local hoisted_2_1, deduped_3_1, deduped_4_1;
    deduped_4_1 := Length( arg2_1 );
    deduped_3_1 := Length( arg3_1 );
    hoisted_2_1 := [ 0 .. deduped_4_1 - 1 ];
    return List( [ 0 .. deduped_3_1 ^ deduped_4_1 - 1 ], function ( i_2 )
            return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg3_1, AsList, List( hoisted_2_1, function ( i_3 )
                      return REM_INT( QUO_INT( i_2, deduped_3_1 ^ i_3 ), deduped_3_1 );
                  end ) );
        end );
end
########
        
    , 401 );
    
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
              return -1 + BigInt( SafeUniquePositionProperty( hoisted_1_1, function ( c_3 )
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
    local deduped_3_1, hoisted_4_1, hoisted_5_1, deduped_6_1, deduped_7_1, hoisted_8_1, deduped_10_1, hoisted_12_1, deduped_13_1, hoisted_15_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, hoisted_22_1, hoisted_23_1, deduped_24_1, hoisted_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1, deduped_39_1, deduped_40_1, deduped_41_1, deduped_42_1, deduped_43_1, deduped_44_1, deduped_45_1, deduped_46_1, deduped_47_1, deduped_48_1, deduped_49_1, deduped_50_1, deduped_51_1, deduped_52_1, deduped_53_1, deduped_54_1, deduped_55_1, deduped_56_1, deduped_57_1;
    deduped_57_1 := BigInt( 3 );
    deduped_56_1 := BigInt( 2 );
    deduped_55_1 := BigInt( 1 );
    deduped_54_1 := BigInt( 0 );
    deduped_53_1 := Range( m_1 );
    deduped_52_1 := Length( Source( l_1 ) );
    deduped_51_1 := Length( Source( m_1 ) );
    deduped_50_1 := Length( deduped_53_1 );
    deduped_49_1 := [ deduped_54_1, deduped_56_1, deduped_57_1 ]{[ 1, 2, 3 ]};
    deduped_48_1 := [ 0 .. deduped_50_1 - 1 ];
    deduped_47_1 := [ 0 .. deduped_51_1 * deduped_52_1 - 1 ];
    deduped_46_1 := [ 0 .. deduped_51_1 * deduped_51_1 - 1 ];
    deduped_3_1 := List( deduped_46_1, function ( i_2 )
            return REM_INT( i_2, deduped_51_1 );
        end );
    deduped_45_1 := Filtered( deduped_46_1, function ( x_2 )
            return deduped_3_1[1 + x_2] = REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( x_2 ), deduped_51_1 ), deduped_51_1 );
        end );
    deduped_44_1 := Length( deduped_45_1 );
    deduped_43_1 := [ 1 .. deduped_44_1 ];
    hoisted_12_1 := AsList( l_1 );
    deduped_10_1 := List( deduped_47_1, function ( i_2 )
            return REM_INT( i_2, deduped_51_1 );
        end );
    deduped_42_1 := Filtered( deduped_47_1, function ( x_2 )
            return deduped_10_1[1 + x_2] = hoisted_12_1[1 + REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( x_2 ), deduped_51_1 ), deduped_52_1 )];
        end );
    deduped_41_1 := [ 0 .. deduped_44_1 - 1 ];
    deduped_40_1 := Length( deduped_42_1 );
    deduped_39_1 := [ 1 .. deduped_40_1 ];
    deduped_38_1 := [ 0 .. deduped_40_1 - 1 ];
    deduped_7_1 := deduped_50_1 * deduped_54_1;
    deduped_6_1 := AsList( m_1 );
    hoisted_4_1 := deduped_45_1{deduped_43_1};
    hoisted_5_1 := List( deduped_41_1, function ( i_2 )
              return deduped_3_1[1 + hoisted_4_1[(1 + i_2)]];
          end ){deduped_43_1};
    deduped_37_1 := SSortedList( List( deduped_41_1, function ( i_2 )
              return deduped_6_1[1 + hoisted_5_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( i_2 ))]] + deduped_7_1;
          end ) );
    deduped_13_1 := deduped_42_1{deduped_39_1};
    hoisted_15_1 := (List( deduped_38_1, function ( i_2 )
                return REM_INT( QUO_INT( CAP_JIT_INCOMPLETE_LOGIC( deduped_13_1[1 + i_2] ), deduped_51_1 ), deduped_52_1 );
            end ){deduped_39_1}){deduped_39_1};
    deduped_36_1 := Filtered( [ 0 .. deduped_40_1 * deduped_52_1 - 1 ], function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( x_2 );
            return hoisted_15_1[1 + REM_INT( deduped_1_2, deduped_40_1 )] = REM_INT( QUO_INT( deduped_1_2, deduped_40_1 ), deduped_52_1 );
        end );
    deduped_34_1 := Length( deduped_36_1 );
    deduped_33_1 := [ 1 .. deduped_34_1 ];
    deduped_30_1 := [ 0 .. deduped_34_1 - 1 ];
    hoisted_16_1 := List( deduped_38_1, function ( i_2 )
              return deduped_10_1[1 + deduped_13_1[(1 + i_2)]];
          end ){deduped_39_1};
    hoisted_19_1 := List( deduped_38_1, function ( i_2 )
            return deduped_6_1[1 + hoisted_16_1[(1 + i_2)]];
        end );
    hoisted_17_1 := deduped_36_1{deduped_33_1};
    hoisted_18_1 := List( deduped_30_1, function ( i_2 )
              return REM_INT( CAP_JIT_INCOMPLETE_LOGIC( hoisted_17_1[1 + i_2] ), deduped_40_1 );
          end ){deduped_33_1};
    deduped_28_1 := SSortedList( List( deduped_30_1, function ( i_2 )
              return hoisted_19_1[1 + hoisted_18_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( i_2 ))]] + deduped_7_1;
          end ) );
    hoisted_22_1 := [ IdFunc( function (  )
                  if deduped_54_1 in deduped_49_1 then
                      return deduped_55_1;
                  else
                      return deduped_54_1;
                  fi;
                  return;
              end )(  ), IdFunc( function (  )
                  if deduped_55_1 in deduped_49_1 then
                      return deduped_55_1;
                  else
                      return deduped_54_1;
                  fi;
                  return;
              end )(  ), IdFunc( function (  )
                  if deduped_56_1 in deduped_49_1 then
                      return deduped_55_1;
                  else
                      return deduped_54_1;
                  fi;
                  return;
              end )(  ), IdFunc( function (  )
                  if deduped_57_1 in deduped_49_1 then
                      return deduped_55_1;
                  else
                      return deduped_54_1;
                  fi;
                  return;
              end )(  ) ];
    hoisted_20_1 := deduped_28_1{[ 1 .. BigInt( Length( deduped_28_1 ) ) ]};
    hoisted_8_1 := deduped_37_1{[ 1 .. BigInt( Length( deduped_37_1 ) ) ]};
    deduped_35_1 := Filtered( deduped_48_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( REM_INT( CAP_JIT_INCOMPLETE_LOGIC( i_2 ), deduped_50_1 ) );
            return hoisted_22_1[1 + (IdFunc( function (  )
                             if (deduped_1_2 in hoisted_8_1) then
                                 return deduped_55_1;
                             else
                                 return deduped_54_1;
                             fi;
                             return;
                         end )(  ) + deduped_56_1 * IdFunc( function (  )
                               if (deduped_1_2 in hoisted_20_1) then
                                   return deduped_55_1;
                               else
                                   return deduped_54_1;
                               fi;
                               return;
                           end )(  ))] = deduped_55_1;
        end );
    deduped_32_1 := Length( deduped_35_1 );
    deduped_31_1 := [ 1 .. deduped_32_1 ];
    deduped_29_1 := [ 0 .. deduped_32_1 - 1 ];
    deduped_24_1 := List( deduped_48_1, function ( i_2 )
            return REM_INT( i_2, deduped_50_1 );
        end );
    hoisted_23_1 := deduped_35_1{deduped_31_1};
    hoisted_25_1 := List( deduped_29_1, function ( i_2 )
              return deduped_24_1[1 + hoisted_23_1[(1 + i_2)]];
          end ){deduped_31_1};
    deduped_27_1 := SSortedList( List( deduped_29_1, function ( i_2 )
              return deduped_24_1[1 + hoisted_25_1[(1 + i_2)]];
          end ) );
    deduped_26_1 := BigInt( Length( deduped_27_1 ) );
    return CreateCapCategoryMorphismWithAttributes( cat_1, CreateCapCategoryObjectWithAttributes( cat_1, Length, deduped_26_1 ), deduped_53_1, AsList, deduped_27_1{[ 1 .. deduped_26_1 ]} );
end
########
        
    , 19767 : IsPrecompiledDerivation := true );
    
    ##
    AddSomeInjectiveObject( cat,
        
########
function ( cat_1, arg2_1 )
    local deduped_1_1;
    deduped_1_1 := Length( arg2_1 );
    return CreateCapCategoryObjectWithAttributes( cat_1, Length, IdFunc( function (  )
                if deduped_1_1 = 0 then
                    return BigInt( 1 );
                else
                    return deduped_1_1;
                fi;
                return;
            end )(  ) );
end
########
        
    , 100 );
    
    ##
    AddSubobjectClassifier( cat,
        
########
function ( cat_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, Length, BigInt( 2 ) );
end
########
        
    , 100 );
    
    ##
    AddTerminalObject( cat,
        
########
function ( cat_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, Length, BigInt( 1 ) );
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
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, T_1, AsList, [ 0 .. Length( P_1 ) - 1 ] );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismIntoDirectProductWithGivenDirectProduct( cat,
        
########
function ( cat_1, objects_1, T_1, tau_1, P_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, deduped_5_1;
    deduped_5_1 := [ 0 .. Length( objects_1 ) - 1 ];
    hoisted_3_1 := List( tau_1, AsList );
    hoisted_1_1 := List( objects_1, Length );
    hoisted_2_1 := List( deduped_5_1, function ( j_2 )
            return Product( hoisted_1_1{[ 1 .. j_2 ]} );
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, T_1, P_1, AsList, List( [ 0 .. Length( T_1 ) - 1 ], function ( i_2 )
              local hoisted_1_2;
              hoisted_1_2 := 1 + i_2;
              return Sum( deduped_5_1, function ( j_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + j_3;
                      return hoisted_2_1[deduped_1_3] * hoisted_3_1[deduped_1_3][hoisted_1_2];
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
    hoisted_4_1 := Filtered( [ 0 .. Length( Y_1 ) - 1 ], function ( x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + x_2;
            return ForAll( hoisted_2_1, function ( j_3 )
                    return deduped_1_1[j_3][deduped_1_2] = deduped_1_1[j_3 + 1][deduped_1_2];
                end );
        end );
    hoisted_3_1 := AsList( tau_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, T_1, P_1, AsList, List( [ 0 .. Length( T_1 ) - 1 ], function ( x_2 )
              return -1 + BigInt( SafePosition( hoisted_4_1, hoisted_3_1[(1 + x_2)] ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismIntoTerminalObjectWithGivenTerminalObject( cat,
        
########
function ( cat_1, T_1, P_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, T_1, P_1, AsList, ListWithIdenticalEntries( Length( T_1 ), BigInt( 0 ) ) );
end
########
        
    , 100 );
    
    if IsBound( cat!.precompiled_functions_added ) then
        
        # COVERAGE_IGNORE_NEXT_LINE
        Error( "precompiled functions have already been added before" );
        
    fi;
    
    cat!.precompiled_functions_added := true;
    
end );

BindGlobal( "CategoryOfSkeletalFinSetsWithMorphismsGivenByListsPrecompiled", function (  )
  local category_constructor, cat;
    
    category_constructor :=
        
        
        function (  )
    return CategoryOfSkeletalFinSetsWithMorphismsGivenByLists(  );
end;
        
        
    
    cat := category_constructor(  : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_CategoryOfSkeletalFinSetsWithMorphismsGivenByListsPrecompiled( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
