# SPDX-License-Identifier: GPL-2.0-or-later
# FinSetsForCAP: The elementary topos of (skeletal) finite sets
#
# Implementations
#
BindGlobal( "ADD_FUNCTIONS_FOR_CategoryOfSkeletalFinSetsWithMorphismsGivenByFunctionsPrecompiled", function ( cat )
    
    ##
    AddCartesianBraidingInverseWithGivenDirectProducts( cat,
        
########
function ( cat_1, s_1, a_1, b_1, r_1 )
    local deduped_1_1, hoisted_2_1;
    hoisted_2_1 := Length( a_1 );
    deduped_1_1 := Length( b_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, r_1, AsFunc, function ( i_2 )
            return REM_INT( i_2, deduped_1_1 ) * hoisted_2_1 + QUO_INT( i_2, deduped_1_1 );
        end );
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
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, r_1, AsFunc, function ( i_2 )
            return i_2 * hoisted_1_1 + hoisted_2_1;
        end );
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
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, b_1, AsFunc, function ( i_2 )
            return REM_INT( QUO_INT( i_2, deduped_3_1 ^ QUO_INT( i_2, hoisted_1_1 ) ), deduped_3_1 );
        end );
end
########
        
    , 100 );
    
    ##
    AddCartesianLambdaElimination( cat,
        
########
function ( cat_1, a_1, b_1, alpha_1 )
    local deduped_1_1, hoisted_2_1;
    hoisted_2_1 := AsFunc( alpha_1 )( 0 );
    deduped_1_1 := Length( b_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, b_1, AsFunc, function ( i_2 )
            return REM_INT( QUO_INT( hoisted_2_1, deduped_1_1 ^ i_2 ), deduped_1_1 );
        end );
end
########
        
    , 100 );
    
    ##
    AddCartesianLambdaIntroduction( cat,
        
########
function ( cat_1, alpha_1 )
    local hoisted_1_1, hoisted_3_1, deduped_4_1, deduped_5_1;
    deduped_5_1 := Length( Source( alpha_1 ) );
    deduped_4_1 := Length( Range( alpha_1 ) );
    hoisted_1_1 := AsFunc( alpha_1 );
    hoisted_3_1 := Sum( List( [ 0 .. deduped_5_1 - 1 ], function ( k_2 )
              return hoisted_1_1( k_2 ) * deduped_4_1 ^ k_2;
          end ) );
    return CreateCapCategoryMorphismWithAttributes( cat_1, CreateCapCategoryObjectWithAttributes( cat_1, Length, BigInt( 1 ) ), CreateCapCategoryObjectWithAttributes( cat_1, Length, deduped_4_1 ^ deduped_5_1 ), AsFunc, function ( i_2 )
            return hoisted_3_1;
        end );
end
########
        
    , 100 );
    
    ##
    AddCartesianLeftUnitorInverseWithGivenDirectProduct( cat,
        
########
function ( cat_1, a_1, r_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, a_1, AsFunc, ID_FUNC );
end
########
        
    , 100 );
    
    ##
    AddCartesianLeftUnitorWithGivenDirectProduct( cat,
        
########
function ( cat_1, a_1, s_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, a_1, AsFunc, ID_FUNC );
end
########
        
    , 100 );
    
    ##
    AddCartesianRightUnitorInverseWithGivenDirectProduct( cat,
        
########
function ( cat_1, a_1, r_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, a_1, AsFunc, ID_FUNC );
end
########
        
    , 100 );
    
    ##
    AddCartesianRightUnitorWithGivenDirectProduct( cat,
        
########
function ( cat_1, a_1, s_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, a_1, AsFunc, ID_FUNC );
end
########
        
    , 100 );
    
    ##
    AddClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier( cat,
        
########
function ( cat_1, alpha_1, Omega_1 )
    local hoisted_1_1, hoisted_2_1;
    hoisted_2_1 := BigInt( 1 );
    hoisted_1_1 := List( [ 0 .. Length( Source( alpha_1 ) ) - 1 ], AsFunc( alpha_1 ) );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Range( alpha_1 ), Omega_1, AsFunc, function ( x_2 )
            if x_2 in hoisted_1_1 then
                return hoisted_2_1;
            else
                return BigInt( 0 );
            fi;
            return;
        end );
end
########
        
    , 100 );
    
    ##
    AddCoastrictionToImageWithGivenImageObject( cat,
        
########
function ( cat_1, alpha_1, I_1 )
    local hoisted_2_1, deduped_3_1, deduped_4_1;
    deduped_4_1 := Source( alpha_1 );
    deduped_3_1 := List( [ 0 .. Length( deduped_4_1 ) - 1 ], AsFunc( alpha_1 ) );
    hoisted_2_1 := SSortedList( deduped_3_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, deduped_4_1, I_1, AsFunc, function ( i_2 )
            return -1 + BigInt( SafePosition( hoisted_2_1, deduped_3_1[(1 + i_2)] ) );
        end );
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
    local deduped_1_1, hoisted_2_1, hoisted_3_1;
    hoisted_3_1 := List( [ 0 .. Length( Source( beta_1 ) ) - 1 ], AsFunc( beta_1 ) );
    hoisted_2_1 := BigInt( 0 );
    deduped_1_1 := List( [ 0 .. Length( Source( alpha_1 ) ) - 1 ], AsFunc( alpha_1 ) );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Range( alpha_1 ), Range( beta_1 ), AsFunc, function ( y_2 )
            if not y_2 in deduped_1_1 then
                return hoisted_2_1;
            else
                return hoisted_3_1[SafePosition( deduped_1_1, y_2 )];
            fi;
            return;
        end );
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
    local deduped_1_1, hoisted_2_1, hoisted_3_1;
    hoisted_2_1 := [ 1 .. Length( morphisms_1 ) - 1 ];
    deduped_1_1 := List( morphisms_1, AsFunc );
    hoisted_3_1 := Filtered( [ 0 .. Length( Y_1 ) - 1 ], function ( x_2 )
            return ForAll( hoisted_2_1, function ( j_3 )
                    return deduped_1_1[j_3]( x_2 ) = deduped_1_1[j_3 + 1]( x_2 );
                end );
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, Y_1, AsFunc, function ( i_2 )
            return hoisted_3_1[1 + i_2];
        end );
end
########
        
    , 100 );
    
    ##
    AddEpimorphismFromSomeProjectiveObject( cat,
        
########
function ( cat_1, A_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, A_1, A_1, AsFunc, ID_FUNC );
end
########
        
    , 100 );
    
    ##
    AddEqualizer( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local deduped_1_1, hoisted_2_1;
    hoisted_2_1 := [ 1 .. Length( arg3_1 ) - 1 ];
    deduped_1_1 := List( arg3_1, AsFunc );
    return CreateCapCategoryObjectWithAttributes( cat_1, Length, Length( Filtered( [ 0 .. Length( arg2_1 ) - 1 ], function ( i_2 )
                return ForAll( hoisted_2_1, function ( j_3 )
                        return deduped_1_1[j_3]( i_2 ) = deduped_1_1[j_3 + 1]( i_2 );
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
    return List( [ 0 .. Length( arg2_1 ) - 1 ], function ( j_2 )
            return CreateCapCategoryMorphismWithAttributes( cat_1, hoisted_1_1, arg2_1, AsFunc, function ( i_3 )
                    return j_2;
                end );
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
    hoisted_3_1 := AsFunc( beta_1 );
    deduped_2_1 := Length( Source( beta_1 ) );
    hoisted_1_1 := AsFunc( alpha_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, s_1, r_1, AsFunc, function ( i_2 )
            return Sum( List( hoisted_5_1, function ( k_3 )
                      return hoisted_3_1( REM_INT( QUO_INT( i_2, deduped_2_1 ^ hoisted_1_1( k_3 ) ), deduped_2_1 ) ) * hoisted_4_1 ^ k_3;
                  end ) );
        end );
end
########
        
    , 1003 );
    
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
    return CreateCapCategoryMorphismWithAttributes( cat_1, a_1, a_1, AsFunc, ID_FUNC );
end
########
        
    , 100 );
    
    ##
    AddImageEmbeddingWithGivenImageObject( cat,
        
########
function ( cat_1, alpha_1, I_1 )
    local hoisted_1_1;
    hoisted_1_1 := SSortedList( List( [ 0 .. Length( Source( alpha_1 ) ) - 1 ], AsFunc( alpha_1 ) ) );
    return CreateCapCategoryMorphismWithAttributes( cat_1, I_1, Range( alpha_1 ), AsFunc, function ( i_2 )
            return hoisted_1_1[1 + i_2];
        end );
end
########
        
    , 100 );
    
    ##
    AddImageObject( cat,
        
########
function ( cat_1, arg2_1 )
    return CreateCapCategoryObjectWithAttributes( cat_1, Length, BigInt( Length( SSortedList( List( [ 0 .. Length( Source( arg2_1 ) ) - 1 ], AsFunc( arg2_1 ) ) ) ) ) );
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
    local hoisted_1_1;
    hoisted_1_1 := Sum( List( objects_1, Length ){[ 1 .. k_1 - 1 ]} );
    return CreateCapCategoryMorphismWithAttributes( cat_1, objects_1[k_1], P_1, AsFunc, function ( i_2 )
            return hoisted_1_1 + i_2;
        end );
end
########
        
    , 100 );
    
    ##
    AddIsColiftable( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_2_1, deduped_3_1;
    deduped_3_1 := List( [ 0 .. Length( Source( arg2_1 ) ) - 1 ], AsFunc( arg2_1 ) );
    hoisted_2_1 := List( [ 0 .. Length( Source( arg3_1 ) ) - 1 ], AsFunc( arg3_1 ) );
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
    return not false in SKELETAL_FIN_SETS_IsEpimorphism( List( [ 0 .. Length( Source( arg2_1 ) ) - 1 ], AsFunc( arg2_1 ) ), Length( Range( arg2_1 ) ) );
end
########
        
    , 100 );
    
    ##
    AddIsEqualForMorphisms( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local hoisted_1_1, hoisted_2_1;
    hoisted_2_1 := AsFunc( arg3_1 );
    hoisted_1_1 := AsFunc( arg2_1 );
    return ForAll( [ 0 .. Length( Source( arg2_1 ) ) - 1 ], function ( x_2 )
            return hoisted_1_1( x_2 ) = hoisted_2_1( x_2 );
        end );
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
    local hoisted_1_1, deduped_2_1, deduped_3_1, deduped_4_1;
    deduped_4_1 := [ 0 .. Length( Source( arg3_1 ) ) - 1 ];
    deduped_3_1 := [ 0 .. Length( Source( arg2_1 ) ) - 1 ];
    deduped_2_1 := List( deduped_3_1, AsFunc( arg2_1 ) );
    hoisted_1_1 := List( deduped_4_1, AsFunc( arg3_1 ) );
    return ForAll( IdFunc( function (  )
                if 100 * Length( deduped_3_1 ) < Length( deduped_4_1 ) then
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
    return SKELETAL_FIN_SETS_IsMonomorphism( List( [ 0 .. Length( Source( arg2_1 ) ) - 1 ], AsFunc( arg2_1 ) ), Length( Range( arg2_1 ) ) );
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
    return not false in SKELETAL_FIN_SETS_IsEpimorphism( List( [ 0 .. Length( Source( arg2_1 ) ) - 1 ], AsFunc( arg2_1 ) ), Length( Range( arg2_1 ) ) );
end
########
        
    , 100 );
    
    ##
    AddIsSplitMonomorphism( cat,
        
########
function ( cat_1, arg2_1 )
    local deduped_1_1, deduped_2_1;
    deduped_2_1 := Length( Source( arg2_1 ) );
    deduped_1_1 := Length( Range( arg2_1 ) );
    return deduped_1_1 = 0 or deduped_2_1 <> 0 and SKELETAL_FIN_SETS_IsMonomorphism( List( [ 0 .. deduped_2_1 - 1 ], AsFunc( arg2_1 ) ), deduped_1_1 );
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
    local hoisted_1_1, hoisted_2_1;
    hoisted_2_1 := Length( Range( arg2_1 ) );
    hoisted_1_1 := AsFunc( arg2_1 );
    if not ForAll( [ 0 .. Length( Source( arg2_1 ) ) - 1 ], function ( x_2 )
                 local deduped_1_2;
                 deduped_1_2 := hoisted_1_1( x_2 );
                 return (IsBigInt( deduped_1_2 ) and deduped_1_2 >= 0 and deduped_1_2 < hoisted_2_1);
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
    deduped_3_1 := Source( beta_1 );
    hoisted_2_1 := List( [ 0 .. Length( deduped_3_1 ) - 1 ], AsFunc( beta_1 ) );
    hoisted_1_1 := AsFunc( alpha_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Source( alpha_1 ), deduped_3_1, AsFunc, function ( x_2 )
            return -1 + BigInt( SafePosition( hoisted_2_1, hoisted_1_1( x_2 ) ) );
        end );
end
########
        
    , 100 );
    
    ##
    AddMonomorphismIntoSomeInjectiveObjectWithGivenSomeInjectiveObject( cat,
        
########
function ( cat_1, A_1, I_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, A_1, I_1, AsFunc, ID_FUNC );
end
########
        
    , 100 );
    
    ##
    AddMorphismConstructor( cat,
        
########
function ( cat_1, arg2_1, arg3_1, arg4_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg4_1, AsFunc, arg3_1 );
end
########
        
    , 100 );
    
    ##
    AddMorphismDatum( cat,
        
########
function ( cat_1, arg2_1 )
    return AsFunc( arg2_1 );
end
########
        
    , 100 );
    
    ##
    AddMorphismsOfExternalHom( cat,
        
########
function ( cat_1, arg2_1, arg3_1 )
    local deduped_2_1;
    deduped_2_1 := Length( arg3_1 );
    return List( [ 0 .. deduped_2_1 ^ Length( arg2_1 ) - 1 ], function ( logic_new_func_x_2 )
            return CreateCapCategoryMorphismWithAttributes( cat_1, arg2_1, arg3_1, AsFunc, function ( i_3 )
                    return REM_INT( QUO_INT( logic_new_func_x_2, deduped_2_1 ^ i_3 ), deduped_2_1 );
                end );
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
    local hoisted_1_1, hoisted_2_1;
    hoisted_2_1 := AsFunc( beta_1 );
    hoisted_1_1 := AsFunc( alpha_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Source( alpha_1 ), Range( beta_1 ), AsFunc, function ( i_2 )
            return hoisted_2_1( hoisted_1_1( i_2 ) );
        end );
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
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, objects_1[k_1], AsFunc, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_1_1 ), hoisted_2_1 );
        end );
end
########
        
    , 100 );
    
    ##
    AddProjectionOntoCoequalizerWithGivenCoequalizer( cat,
        
########
function ( cat_1, Y_1, morphisms_1, P_1 )
    local hoisted_1_1;
    hoisted_1_1 := SKELETAL_FIN_SETS_ExplicitCoequalizer( Y_1, morphisms_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, Y_1, P_1, AsFunc, function ( i_2 )
            return -1 + BigInt( SafeUniquePositionProperty( hoisted_1_1, function ( c_3 )
                        return (i_2 in c_3);
                    end ) );
        end );
end
########
        
    , 100 );
    
    ##
    AddPushoutComplement( cat,
        
########
function ( cat_1, l_1, m_1 )
    local deduped_5_1, deduped_6_1, hoisted_8_1, hoisted_10_1, hoisted_15_1, hoisted_18_1, hoisted_19_1, deduped_22_1, deduped_23_1, deduped_24_1, deduped_25_1, deduped_26_1, deduped_27_1, deduped_28_1, deduped_29_1, deduped_30_1, deduped_31_1, deduped_32_1, deduped_33_1, deduped_34_1, deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1;
    deduped_38_1 := BigInt( 3 );
    deduped_37_1 := BigInt( 2 );
    deduped_36_1 := BigInt( 1 );
    deduped_35_1 := BigInt( 0 );
    deduped_34_1 := Range( m_1 );
    deduped_33_1 := Length( Source( l_1 ) );
    deduped_32_1 := Length( Source( m_1 ) );
    deduped_31_1 := Length( deduped_34_1 );
    deduped_30_1 := Filtered( [ deduped_35_1, deduped_36_1, deduped_37_1, deduped_38_1 ], function ( x_2 )
            return IdFunc( function (  )
                        if (x_2 = deduped_38_1) then
                            return deduped_36_1;
                        else
                            return deduped_35_1;
                        fi;
                        return;
                    end )(  ) = REM_INT( x_2, deduped_37_1 );
        end );
    hoisted_10_1 := AsFunc( l_1 );
    deduped_29_1 := Filtered( [ 0 .. deduped_32_1 * deduped_33_1 - 1 ], function ( i_2 )
            return REM_INT( QUO_INT( i_2, deduped_36_1 ), deduped_32_1 ) = hoisted_10_1( REM_INT( QUO_INT( i_2, deduped_32_1 ), deduped_33_1 ) );
        end );
    deduped_28_1 := Filtered( [ 0 .. deduped_32_1 * deduped_32_1 - 1 ], function ( x_2 )
            return REM_INT( QUO_INT( x_2, deduped_36_1 ), deduped_32_1 ) = REM_INT( QUO_INT( x_2, deduped_32_1 ), deduped_32_1 );
        end );
    deduped_27_1 := Length( deduped_29_1 );
    deduped_26_1 := Filtered( [ 0 .. deduped_27_1 * deduped_33_1 - 1 ], function ( x_2 )
            return REM_INT( QUO_INT( deduped_29_1[1 + REM_INT( QUO_INT( x_2, deduped_36_1 ), deduped_27_1 )], deduped_32_1 ), deduped_33_1 ) = REM_INT( QUO_INT( x_2, deduped_27_1 ), deduped_33_1 );
        end );
    deduped_6_1 := deduped_31_1 * deduped_35_1;
    deduped_5_1 := AsFunc( m_1 );
    deduped_25_1 := SSortedList( List( [ 0 .. Length( deduped_28_1 ) - 1 ], function ( i_2 )
              return deduped_36_1 * deduped_5_1( REM_INT( QUO_INT( deduped_28_1[(1 + i_2)], deduped_36_1 ), deduped_32_1 ) ) + deduped_6_1;
          end ) );
    deduped_23_1 := SSortedList( List( [ 0 .. Length( deduped_26_1 ) - 1 ], function ( i_2 )
              return deduped_36_1 * deduped_5_1( REM_INT( QUO_INT( deduped_29_1[(1 + REM_INT( QUO_INT( deduped_26_1[(1 + i_2)], deduped_36_1 ), deduped_27_1 ))], deduped_36_1 ), deduped_32_1 ) ) + deduped_6_1;
          end ) );
    hoisted_19_1 := [ deduped_35_1 ];
    hoisted_18_1 := deduped_30_1{[ 1 .. Length( deduped_30_1 ) ]};
    hoisted_15_1 := List( [ 0 .. BigInt( Length( deduped_23_1 ) ) - 1 ], function ( i_2 )
            return deduped_23_1[1 + i_2];
        end );
    hoisted_8_1 := List( [ 0 .. BigInt( Length( deduped_25_1 ) ) - 1 ], function ( i_2 )
            return deduped_25_1[1 + i_2];
        end );
    deduped_24_1 := Filtered( [ 0 .. deduped_31_1 - 1 ], function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := REM_INT( QUO_INT( i_2, deduped_36_1 ), deduped_31_1 );
            return IdFunc( function (  )
                        if (deduped_36_1 * IdFunc( function (  )
                                          if (deduped_1_2 in hoisted_8_1) then
                                              return deduped_36_1;
                                          else
                                              return deduped_35_1;
                                          fi;
                                          return;
                                      end )(  ) + deduped_37_1 * IdFunc( function (  )
                                          if (deduped_1_2 in hoisted_15_1) then
                                              return deduped_36_1;
                                          else
                                              return deduped_35_1;
                                          fi;
                                          return;
                                      end )(  ) in hoisted_18_1) then
                            return deduped_36_1;
                        else
                            return deduped_35_1;
                        fi;
                        return;
                    end )(  ) = IdFunc( function (  )
                        if (REM_INT( QUO_INT( i_2, deduped_31_1 ), deduped_36_1 ) in hoisted_19_1) then
                            return deduped_36_1;
                        else
                            return deduped_35_1;
                        fi;
                        return;
                    end )(  );
        end );
    deduped_22_1 := SSortedList( List( [ 0 .. Length( deduped_24_1 ) - 1 ], function ( i_2 )
              return REM_INT( QUO_INT( deduped_24_1[1 + i_2], deduped_36_1 ), deduped_31_1 );
          end ) );
    return CreateCapCategoryMorphismWithAttributes( cat_1, CreateCapCategoryObjectWithAttributes( cat_1, Length, BigInt( Length( deduped_22_1 ) ) ), deduped_34_1, AsFunc, function ( i_2 )
            return deduped_22_1[1 + i_2];
        end );
end
########
        
    , 19767 : IsPrecompiledDerivation := true );
    
    ##
    AddSomeInjectiveObject( cat,
        
########
function ( cat_1, arg2_1 )
    if Length( arg2_1 ) = 0 then
        return CreateCapCategoryObjectWithAttributes( cat_1, Length, BigInt( 1 ) );
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
    local hoisted_1_1, hoisted_2_1;
    hoisted_2_1 := AsFunc( tau_1 );
    hoisted_1_1 := SKELETAL_FIN_SETS_ExplicitCoequalizer( Y_1, morphisms_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, Range( tau_1 ), AsFunc, function ( i_2 )
            return hoisted_2_1( hoisted_1_1[1 + i_2][1] );
        end );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismFromCoproductWithGivenCoproduct( cat,
        
########
function ( cat_1, objects_1, T_1, tau_1, P_1 )
    local hoisted_1_1, deduped_2_1, hoisted_3_1, hoisted_4_1, deduped_5_1;
    deduped_5_1 := Length( tau_1 );
    hoisted_4_1 := List( tau_1, AsFunc );
    hoisted_3_1 := [ 1 .. deduped_5_1 ];
    hoisted_1_1 := List( tau_1, function ( map_2 )
            return Length( Source( map_2 ) );
        end );
    deduped_2_1 := List( [ 0 .. deduped_5_1 ], function ( k_2 )
            return Sum( hoisted_1_1{[ 1 .. k_2 ]} );
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, T_1, AsFunc, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := SafePositionProperty( hoisted_3_1, function ( k_3 )
                    return i_2 < deduped_2_1[k_3 + 1];
                end );
            return hoisted_4_1[deduped_1_2]( i_2 - deduped_2_1[deduped_1_2] );
        end );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismFromInitialObjectWithGivenInitialObject( cat,
        
########
function ( cat_1, T_1, P_1 )
    return CreateCapCategoryMorphismWithAttributes( cat_1, P_1, T_1, AsFunc, ID_FUNC );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismIntoDirectProductWithGivenDirectProduct( cat,
        
########
function ( cat_1, objects_1, T_1, tau_1, P_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, deduped_5_1;
    deduped_5_1 := [ 0 .. Length( objects_1 ) - 1 ];
    hoisted_3_1 := List( tau_1, AsFunc );
    hoisted_1_1 := List( objects_1, Length );
    hoisted_2_1 := List( deduped_5_1, function ( j_2 )
            return Product( hoisted_1_1{[ 1 .. j_2 ]} );
        end );
    return CreateCapCategoryMorphismWithAttributes( cat_1, T_1, P_1, AsFunc, function ( i_2 )
            return Sum( deduped_5_1, function ( j_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + j_3;
                    return hoisted_2_1[deduped_1_3] * hoisted_3_1[deduped_1_3]( i_2 );
                end );
        end );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismIntoEqualizerWithGivenEqualizer( cat,
        
########
function ( cat_1, Y_1, morphisms_1, T_1, tau_1, P_1 )
    local deduped_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1;
    hoisted_2_1 := [ 1 .. Length( morphisms_1 ) - 1 ];
    deduped_1_1 := List( morphisms_1, AsFunc );
    hoisted_4_1 := Filtered( [ 0 .. Length( Y_1 ) - 1 ], function ( x_2 )
            return ForAll( hoisted_2_1, function ( j_3 )
                    return deduped_1_1[j_3]( x_2 ) = deduped_1_1[j_3 + 1]( x_2 );
                end );
        end );
    hoisted_3_1 := AsFunc( tau_1 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, T_1, P_1, AsFunc, function ( x_2 )
            return -1 + BigInt( SafePosition( hoisted_4_1, hoisted_3_1( x_2 ) ) );
        end );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismIntoTerminalObjectWithGivenTerminalObject( cat,
        
########
function ( cat_1, T_1, P_1 )
    local hoisted_1_1;
    hoisted_1_1 := BigInt( 0 );
    return CreateCapCategoryMorphismWithAttributes( cat_1, T_1, P_1, AsFunc, function ( i_2 )
            return hoisted_1_1;
        end );
end
########
        
    , 100 );
    
    if IsBound( cat!.precompiled_functions_added ) then
        
        # COVERAGE_IGNORE_NEXT_LINE
        Error( "precompiled functions have already been added before" );
        
    fi;
    
    cat!.precompiled_functions_added := true;
    
end );

BindGlobal( "CategoryOfSkeletalFinSetsWithMorphismsGivenByFunctionsPrecompiled", function (  )
  local category_constructor, cat;
    
    category_constructor :=
        
        
        function (  )
    return CategoryOfSkeletalFinSetsWithMorphismsGivenByFunctions(  );
end;
        
        
    
    cat := category_constructor(  : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_CategoryOfSkeletalFinSetsWithMorphismsGivenByFunctionsPrecompiled( cat );
    
    Finalize( cat );
    
    return cat;
    
end );
