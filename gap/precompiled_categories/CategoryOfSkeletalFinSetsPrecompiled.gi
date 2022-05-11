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
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, s_1, r_1, AsList, List( [ 0 .. Length( s_1 ) - 1 ], function ( i_2 )
              return 1 + REM_INT( i_2, hoisted_1_1 ) * hoisted_2_1 + QUO_INT( i_2, hoisted_1_1 );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddCartesianCoevaluationMorphismWithGivenRange( cat,
        
########
function ( cat_1, a_1, b_1, r_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, deduped_4_1, deduped_5_1;
    deduped_5_1 := Length( b_1 );
    deduped_4_1 := Length( a_1 );
    hoisted_3_1 := [ 0 .. deduped_5_1 - 1 ];
    hoisted_2_1 := deduped_4_1 * deduped_5_1;
    hoisted_1_1 := deduped_5_1;
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, a_1, r_1, AsList, List( [ 0 .. deduped_4_1 - 1 ], function ( i_2 )
              local hoisted_1_2;
              hoisted_1_2 := i_2 * hoisted_1_1;
              return 1 + Sum( hoisted_3_1, function ( j_3 )
                        return (hoisted_1_2 + j_3) * hoisted_2_1 ^ (hoisted_1_1 - j_3 - 1);
                    end );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddCartesianEvaluationMorphismWithGivenSource( cat,
        
########
function ( cat_1, a_1, b_1, s_1 )
    local hoisted_1_1, hoisted_2_1;
    hoisted_2_1 := Length( b_1 );
    hoisted_1_1 := Length( a_1 );
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, s_1, b_1, AsList, List( [ 0 .. Length( s_1 ) - 1 ], function ( i_2 )
              return 1 + REM_INT( QUO_INT( QUO_INT( i_2, hoisted_1_1 ), hoisted_2_1 ^ (hoisted_1_1 - REM_INT( i_2, hoisted_1_1 ) - 1) ), hoisted_2_1 );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddCartesianLeftUnitorInverseWithGivenDirectProduct( cat,
        
########
function ( cat_1, a_1, r_1 )
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, a_1, a_1, AsList, [ 1 .. Length( a_1 ) ] );
end
########
        
    , 100 );
    
    ##
    AddCartesianLeftUnitorWithGivenDirectProduct( cat,
        
########
function ( cat_1, a_1, s_1 )
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, a_1, a_1, AsList, [ 1 .. Length( a_1 ) ] );
end
########
        
    , 100 );
    
    ##
    AddCartesianRightUnitorInverseWithGivenDirectProduct( cat,
        
########
function ( cat_1, a_1, r_1 )
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, a_1, a_1, AsList, [ 1 .. Length( a_1 ) ] );
end
########
        
    , 100 );
    
    ##
    AddCartesianRightUnitorWithGivenDirectProduct( cat,
        
########
function ( cat_1, a_1, s_1 )
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, a_1, a_1, AsList, [ 1 .. Length( a_1 ) ] );
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
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, deduped_2_1, Omega_1, AsList, List( [ 1 .. Length( deduped_2_1 ) ], function ( x_2 )
              if x_2 in hoisted_1_1 then
                  return 1;
              else
                  return 2;
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
    local hoisted_1_1, deduped_2_1;
    deduped_2_1 := AsList( alpha_1 );
    hoisted_1_1 := SSortedList( deduped_2_1 );
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, Source( alpha_1 ), I_1, AsList, List( deduped_2_1, function ( l_2 )
              return Position( hoisted_1_1, l_2 );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddCoequalizer( cat,
        
########
function ( cat_1, arg2_1 )
    return ObjectifyObjectForCAPWithAttributes( rec(
           ), cat_1, Length, Length( SKELETAL_FIN_SETS_ExplicitCoequalizer( arg2_1 ) ) );
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
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, deduped_3_1, Range( beta_1 ), AsList, List( [ 1 .. Length( deduped_3_1 ) ], function ( y_2 )
              if not y_2 in hoisted_1_1 then
                  return 1;
              else
                  return hoisted_2_1[Position( hoisted_1_1, y_2 )];
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
    return ObjectifyObjectForCAPWithAttributes( rec(
           ), cat_1, Length, Sum( arg2_1, function ( x_2 )
              return Length( x_2 );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddDirectProduct( cat,
        
########
function ( cat_1, arg2_1 )
    return ObjectifyObjectForCAPWithAttributes( rec(
           ), cat_1, Length, Product( List( arg2_1, function ( o_2 )
                return Length( o_2 );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddEmbeddingOfEqualizerWithGivenEqualizer( cat,
        
########
function ( cat_1, morphisms_1, P_1 )
    local hoisted_1_1, hoisted_2_1;
    hoisted_2_1 := List( morphisms_1, function ( fj_2 )
              return AsList( fj_2 );
          end ){[ 2 .. Length( morphisms_1 ) ]};
    hoisted_1_1 := List( morphisms_1, AsList )[1];
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, P_1, List( morphisms_1, Source )[1], AsList, Filtered( [ 1 .. List( morphisms_1, function ( logic_new_func_x_2 )
                      return Length( AsList( logic_new_func_x_2 ) );
                  end )[1] ], function ( x_2 )
              local hoisted_1_2;
              hoisted_1_2 := hoisted_1_1[x_2];
              return ForAll( hoisted_2_1, function ( fj_3 )
                      return hoisted_1_2 = fj_3[x_2];
                  end );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddEpimorphismFromSomeProjectiveObject( cat,
        
########
function ( cat_1, A_1 )
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, A_1, A_1, AsList, [ 1 .. Length( A_1 ) ] );
end
########
        
    , 100 );
    
    ##
    AddEqualizer( cat,
        
########
function ( cat_1, arg2_1 )
    local hoisted_1_1, hoisted_2_1;
    hoisted_2_1 := List( arg2_1, function ( fj_2 )
              return AsList( fj_2 );
          end ){[ 2 .. Length( arg2_1 ) ]};
    hoisted_1_1 := List( arg2_1, AsList )[1];
    return ObjectifyObjectForCAPWithAttributes( rec(
           ), cat_1, Length, Length( Filtered( [ 1 .. List( arg2_1, function ( logic_new_func_x_2 )
                        return Length( AsList( logic_new_func_x_2 ) );
                    end )[1] ], function ( x_2 )
                local hoisted_1_2;
                hoisted_1_2 := hoisted_1_1[x_2];
                return ForAll( hoisted_2_1, function ( fj_3 )
                        return hoisted_1_2 = fj_3[x_2];
                    end );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddExponentialOnMorphismsWithGivenExponentials( cat,
        
########
function ( cat_1, s_1, alpha_1, beta_1, r_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, deduped_9_1, deduped_10_1, deduped_11_1;
    deduped_11_1 := Length( Source( alpha_1 ) );
    deduped_10_1 := Length( Range( alpha_1 ) );
    deduped_9_1 := Length( Source( beta_1 ) );
    hoisted_8_1 := Length( Range( beta_1 ) );
    hoisted_7_1 := deduped_11_1;
    hoisted_6_1 := AsList( beta_1 );
    hoisted_5_1 := [ 1 .. deduped_11_1 ];
    hoisted_4_1 := AsList( alpha_1 );
    hoisted_3_1 := [ 1 .. deduped_10_1 ];
    hoisted_2_1 := deduped_9_1;
    hoisted_1_1 := deduped_10_1;
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, s_1, r_1, AsList, List( [ 0 .. deduped_9_1 ^ deduped_10_1 - 1 ], function ( i_2 )
              local hoisted_1_2, hoisted_2_2, hoisted_3_2;
              hoisted_1_2 := List( hoisted_3_1, function ( j_3 )
                      return 1 + REM_INT( QUO_INT( i_2, hoisted_2_1 ^ (hoisted_1_1 - j_3) ), hoisted_2_1 );
                  end );
              hoisted_2_2 := List( hoisted_5_1, function ( i_3 )
                      return hoisted_1_2[hoisted_4_1[i_3]];
                  end );
              hoisted_3_2 := List( hoisted_5_1, function ( i_3 )
                      return hoisted_6_1[hoisted_2_2[i_3]];
                  end );
              return 1 + Sum( hoisted_5_1, function ( k_3 )
                        return (hoisted_3_2[k_3] - 1) * hoisted_8_1 ^ (hoisted_7_1 - k_3);
                    end );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddExponentialOnObjects( cat,
        
########
function ( cat_1, a_1, b_1 )
    return ObjectifyObjectForCAPWithAttributes( rec(
           ), cat_1, Length, Length( b_1 ) ^ Length( a_1 ) );
end
########
        
    , 100 );
    
    ##
    AddIdentityMorphism( cat,
        
########
function ( cat_1, a_1 )
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, a_1, a_1, AsList, [ 1 .. Length( a_1 ) ] );
end
########
        
    , 100 );
    
    ##
    AddImageEmbeddingWithGivenImageObject( cat,
        
########
function ( cat_1, alpha_1, I_1 )
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, I_1, Range( alpha_1 ), AsList, SSortedList( AsList( alpha_1 ) ) );
end
########
        
    , 100 );
    
    ##
    AddImageObject( cat,
        
########
function ( cat_1, arg2_1 )
    return ObjectifyObjectForCAPWithAttributes( rec(
           ), cat_1, Length, Length( SSortedList( AsList( arg2_1 ) ) ) );
end
########
        
    , 100 );
    
    ##
    AddInitialObject( cat,
        
########
function ( cat_1 )
    return ObjectifyObjectForCAPWithAttributes( rec(
           ), cat_1, Length, 0 );
end
########
        
    , 100 );
    
    ##
    AddInjectionOfCofactorOfCoproductWithGivenCoproduct( cat,
        
########
function ( cat_1, objects_1, k_1, P_1 )
    local deduped_1_1;
    deduped_1_1 := Sum( objects_1{[ 1 .. k_1 - 1 ]}, function ( x_2 )
            return Length( x_2 );
        end );
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, objects_1[k_1], P_1, AsList, [ deduped_1_1 + 1 .. deduped_1_1 + List( objects_1, Length )[k_1] ] );
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
    return ForAll( function (  )
              if 100 * Length( deduped_2_1 ) < Length( deduped_3_1 ) then
                  return SSortedList( deduped_2_1 );
              else
                  return deduped_2_1;
              fi;
              return;
          end(  ), function ( y_2 )
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
                 return IsPosInt( a_2 );
             end ) then
        return false;
    elif not Length( Source( arg2_1 ) ) = Length( deduped_2_1 ) then
        return false;
    elif not ForAll( deduped_2_1, function ( a_2 )
                 return a_2 <= hoisted_1_1;
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
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, deduped_3_1, Source( beta_1 ), AsList, List( [ 1 .. Length( deduped_3_1 ) ], function ( x_2 )
              return Position( hoisted_2_1, hoisted_1_1[x_2] );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddMonomorphismIntoSomeInjectiveObjectWithGivenSomeInjectiveObject( cat,
        
########
function ( cat_1, A_1, I_1 )
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, A_1, I_1, AsList, [ 1 .. Length( A_1 ) ] );
end
########
        
    , 100 );
    
    ##
    AddMorphismConstructor( cat,
        
########
function ( cat_1, arg2_1, arg3_1, arg4_1 )
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, arg2_1, arg4_1, AsList, arg3_1 );
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
    AddObjectConstructor( cat,
        
########
function ( cat_1, arg2_1 )
    return ObjectifyObjectForCAPWithAttributes( rec(
           ), cat_1, Length, arg2_1 );
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
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, deduped_3_1, Range( beta_1 ), AsList, List( [ 1 .. Length( deduped_3_1 ) ], function ( i_2 )
              return hoisted_2_1[hoisted_1_1[i_2]];
          end ) );
end
########
        
    , 100 );
    
    ##
    AddProjectionInFactorOfDirectProductWithGivenDirectProduct( cat,
        
########
function ( cat_1, objects_1, k_1, P_1 )
    local hoisted_1_1, hoisted_2_1;
    hoisted_2_1 := List( objects_1, Length )[k_1];
    hoisted_1_1 := Product( objects_1{[ k_1 + 1 .. Length( objects_1 ) ]}, function ( M_2 )
            return Length( M_2 );
        end );
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, P_1, objects_1[k_1], AsList, List( [ 0 .. Length( P_1 ) - 1 ], function ( i_2 )
              return 1 + REM_INT( QUO_INT( i_2, hoisted_1_1 ), hoisted_2_1 );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddProjectionOntoCoequalizerWithGivenCoequalizer( cat,
        
########
function ( cat_1, morphisms_1, P_1 )
    local hoisted_1_1, deduped_2_1;
    deduped_2_1 := List( morphisms_1, Range )[1];
    hoisted_1_1 := SKELETAL_FIN_SETS_ExplicitCoequalizer( morphisms_1 );
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, deduped_2_1, P_1, AsList, List( [ 1 .. Length( deduped_2_1 ) ], function ( logic_new_func_x_2 )
              return Position( hoisted_1_1, First( hoisted_1_1, function ( c_3 )
                        return logic_new_func_x_2 in c_3;
                    end ) );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddSomeInjectiveObject( cat,
        
########
function ( cat_1, arg2_1 )
    if Length( arg2_1 ) = 0 then
        return ObjectifyObjectForCAPWithAttributes( rec(
               ), cat_1, Length, 1 );
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
    return ObjectifyObjectForCAPWithAttributes( rec(
           ), cat_1, Length, 2 );
end
########
        
    , 100 );
    
    ##
    AddTerminalObject( cat,
        
########
function ( cat_1 )
    return ObjectifyObjectForCAPWithAttributes( rec(
           ), cat_1, Length, 1 );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismFromCoequalizerWithGivenCoequalizer( cat,
        
########
function ( cat_1, morphisms_1, T_1, tau_1, P_1 )
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, P_1, Range( tau_1 ), AsList, List( SKELETAL_FIN_SETS_ExplicitCoequalizer( morphisms_1 ), function ( x_2 )
              return tau_1( x_2[1] );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismFromCoproductWithGivenCoproduct( cat,
        
########
function ( cat_1, objects_1, T_1, tau_1, P_1 )
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, P_1, T_1, AsList, Concatenation( List( tau_1, function ( t_2 )
                return AsList( t_2 );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismFromInitialObjectWithGivenInitialObject( cat,
        
########
function ( cat_1, T_1, P_1 )
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, P_1, T_1, AsList, [  ] );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismIntoDirectProductWithGivenDirectProduct( cat,
        
########
function ( cat_1, objects_1, T_1, tau_1, P_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, deduped_6_1, deduped_7_1;
    deduped_7_1 := Length( objects_1 );
    deduped_6_1 := [ 1 .. deduped_7_1 ];
    hoisted_5_1 := deduped_6_1;
    hoisted_3_1 := List( objects_1, function ( x_2 )
            return Length( x_2 );
        end );
    hoisted_2_1 := deduped_7_1;
    hoisted_4_1 := List( deduped_6_1, function ( i_2 )
            return Product( hoisted_3_1{[ i_2 + 1 .. hoisted_2_1 ]} );
        end );
    hoisted_1_1 := List( tau_1, function ( x_2 )
            return AsList( x_2 );
        end );
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, T_1, P_1, AsList, List( [ 1 .. Length( T_1 ) ], function ( i_2 )
              return 1 + Sum( hoisted_5_1, function ( j_3 )
                        return (hoisted_1_1[j_3][i_2] - 1) * hoisted_4_1[j_3];
                    end );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismIntoEqualizerWithGivenEqualizer( cat,
        
########
function ( cat_1, morphisms_1, T_1, tau_1, P_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, deduped_5_1;
    deduped_5_1 := List( morphisms_1, AsList )[1];
    hoisted_2_1 := List( morphisms_1, function ( fj_2 )
              return AsList( fj_2 );
          end ){[ 2 .. Length( morphisms_1 ) ]};
    hoisted_1_1 := deduped_5_1;
    hoisted_4_1 := Filtered( [ 1 .. Length( deduped_5_1 ) ], function ( x_2 )
            local hoisted_1_2;
            hoisted_1_2 := hoisted_1_1[x_2];
            return ForAll( hoisted_2_1, function ( fj_3 )
                    return hoisted_1_2 = fj_3[x_2];
                end );
        end );
    hoisted_3_1 := AsList( tau_1 );
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, T_1, P_1, AsList, List( [ 1 .. Length( T_1 ) ], function ( x_2 )
              return Position( hoisted_4_1, hoisted_3_1[x_2] );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismIntoTerminalObjectWithGivenTerminalObject( cat,
        
########
function ( cat_1, T_1, P_1 )
    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec(
           ), cat_1, T_1, P_1, AsList, List( [ 1 .. Length( T_1 ) ], function ( a_2 )
              return 1;
          end ) );
end
########
        
    , 100 );
    
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
