# SPDX-License-Identifier: GPL-2.0-or-later
# FinSetsForCAP: The elementary topos of (skeletal) finite sets
#
# Implementations
#
BindGlobal( "ADD_FUNCTIONS_FOR_CategoryOfSkeletalFinSetsPrecompiled", function ( cat )
    
    ##
    AddCartesianEvaluationMorphismWithGivenSource( cat,
        
########
function ( cat_1, a_1, b_1, s_1 )
    return MapOfFinSets( s_1, List( Cartesian( List( Tuples( AsList( b_1 ), Length( a_1 ) ), function ( x_2 )
                  return MapOfFinSets( a_1, x_2, b_1 );
              end ), AsList( a_1 ) ), function ( fx_2 )
              return fx_2[1]( fx_2[2] );
          end ), b_1 );
end
########
        
    , 100 );
    
    ##
    AddCartesianLambdaIntroduction( cat,
        
########
function ( cat_1, alpha_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, deduped_4_1, deduped_5_1;
    deduped_5_1 := Range( alpha_1 );
    deduped_4_1 := Length( Source( alpha_1 ) );
    hoisted_3_1 := Length( deduped_5_1 );
    hoisted_2_1 := deduped_4_1;
    hoisted_1_1 := AsList( alpha_1 );
    return MapOfFinSets( FinSet( cat_1, 1 ), [ 1 + Sum( [ 1 .. deduped_4_1 ], function ( i_2 )
                    return (hoisted_1_1[i_2] - 1) * hoisted_3_1 ^ (hoisted_2_1 - i_2);
                end ) ], FinSet( cat_1, Length( Tuples( AsList( deduped_5_1 ), deduped_4_1 ) ) ) );
end
########
        
    , 100 );
    
    ##
    AddCartesianLeftUnitorInverseWithGivenDirectProduct( cat,
        
########
function ( cat_1, a_1, r_1 )
    return MapOfFinSets( a_1, [ 1 .. Length( a_1 ) ], a_1 );
end
########
        
    , 100 );
    
    ##
    AddCartesianLeftUnitorWithGivenDirectProduct( cat,
        
########
function ( cat_1, a_1, s_1 )
    return MapOfFinSets( a_1, [ 1 .. Length( a_1 ) ], a_1 );
end
########
        
    , 100 );
    
    ##
    AddCartesianRightUnitorInverseWithGivenDirectProduct( cat,
        
########
function ( cat_1, a_1, r_1 )
    return MapOfFinSets( a_1, [ 1 .. Length( a_1 ) ], a_1 );
end
########
        
    , 100 );
    
    ##
    AddCartesianRightUnitorWithGivenDirectProduct( cat,
        
########
function ( cat_1, a_1, s_1 )
    return MapOfFinSets( a_1, [ 1 .. Length( a_1 ) ], a_1 );
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
    return MapOfFinSets( deduped_2_1, List( deduped_2_1, function ( x_2 )
              if x_2 in hoisted_1_1 then
                  return 1;
              else
                  return 2;
              fi;
              return;
          end ), Omega_1 );
end
########
        
    , 100 );
    
    ##
    AddCoastrictionToImage( cat,
        
########
function ( cat_1, alpha_1 )
    local hoisted_1_1, deduped_2_1, deduped_3_1;
    deduped_3_1 := AsList( alpha_1 );
    deduped_2_1 := SSortedList( deduped_3_1 );
    hoisted_1_1 := deduped_2_1;
    return MapOfFinSets( Source( alpha_1 ), List( deduped_3_1, function ( l_2 )
              return Position( hoisted_1_1, l_2 );
          end ), FinSet( cat_1, Length( deduped_2_1 ) ) );
end
########
        
    , 100 );
    
    ##
    AddCoequalizer( cat,
        
########
function ( cat_1, arg2_1 )
    return FinSet( cat_1, Length( SKELETAL_FIN_SETS_Coequalizer( arg2_1 ) ) );
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
    return MapOfFinSets( deduped_3_1, List( AsList( deduped_3_1 ), function ( y_2 )
              if not y_2 in hoisted_1_1 then
                  return 1;
              else
                  return hoisted_2_1[Position( hoisted_1_1, y_2 )];
              fi;
              return;
          end ), Range( beta_1 ) );
end
########
        
    , 100 );
    
    ##
    AddCoproduct( cat,
        
########
function ( cat_1, arg2_1 )
    return FinSet( cat_1, Sum( arg2_1, function ( x_2 )
              return Length( x_2 );
          end ) );
end
########
        
    , 100 );
    
    ##
    AddDirectProduct( cat,
        
########
function ( cat_1, arg2_1 )
    return FinSet( cat_1, Product( List( arg2_1, function ( o_2 )
                return Length( o_2 );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddEmbeddingOfEqualizerWithGivenEqualizer( cat,
        
########
function ( cat_1, morphisms_1, P_1 )
    local hoisted_1_1, hoisted_2_1, deduped_3_1, deduped_4_1;
    deduped_4_1 := morphisms_1[1];
    deduped_3_1 := Source( deduped_4_1 );
    hoisted_2_1 := morphisms_1{[ 2 .. Length( morphisms_1 ) ]};
    hoisted_1_1 := deduped_4_1;
    return MapOfFinSets( P_1, Filtered( AsList( deduped_3_1 ), function ( x_2 )
              local hoisted_1_2;
              hoisted_1_2 := hoisted_1_1( x_2 );
              return ForAll( hoisted_2_1, function ( fj_3 )
                      return hoisted_1_2 = fj_3( x_2 );
                  end );
          end ), deduped_3_1 );
end
########
        
    , 100 );
    
    ##
    AddEpimorphismFromSomeProjectiveObject( cat,
        
########
function ( cat_1, A_1 )
    return MapOfFinSets( A_1, [ 1 .. Length( A_1 ) ], A_1 );
end
########
        
    , 100 );
    
    ##
    AddEqualizer( cat,
        
########
function ( cat_1, arg2_1 )
    local hoisted_1_1, hoisted_2_1, deduped_3_1;
    deduped_3_1 := arg2_1[1];
    hoisted_2_1 := arg2_1{[ 2 .. Length( arg2_1 ) ]};
    hoisted_1_1 := deduped_3_1;
    return FinSet( cat_1, Length( Filtered( AsList( Source( deduped_3_1 ) ), function ( x_2 )
                local hoisted_1_2;
                hoisted_1_2 := hoisted_1_1( x_2 );
                return ForAll( hoisted_2_1, function ( fj_3 )
                        return hoisted_1_2 = fj_3( x_2 );
                    end );
            end ) ) );
end
########
        
    , 100 );
    
    ##
    AddExponentialOnMorphismsWithGivenExponentials( cat,
        
########
function ( cat_1, s_1, alpha_1, beta_1, r_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, deduped_8_1, deduped_9_1, deduped_10_1, deduped_11_1;
    deduped_11_1 := Range( beta_1 );
    deduped_10_1 := Source( alpha_1 );
    deduped_9_1 := Range( alpha_1 );
    deduped_8_1 := Source( beta_1 );
    hoisted_2_1 := deduped_11_1;
    hoisted_1_1 := deduped_10_1;
    hoisted_7_1 := List( Tuples( AsList( deduped_11_1 ), Length( deduped_10_1 ) ), function ( x_2 )
            return MapOfFinSets( hoisted_1_1, x_2, hoisted_2_1 );
        end );
    hoisted_6_1 := AsList( beta_1 );
    hoisted_5_1 := AsList( alpha_1 );
    hoisted_4_1 := deduped_8_1;
    hoisted_3_1 := deduped_9_1;
    return MapOfFinSets( s_1, List( Tuples( AsList( deduped_8_1 ), Length( deduped_9_1 ) ), function ( logic_new_func_x_2 )
              local hoisted_1_2, hoisted_2_2, deduped_3_2, deduped_4_2, deduped_5_2;
              deduped_5_2 := MapOfFinSets( hoisted_3_1, logic_new_func_x_2, hoisted_4_1 );
              hoisted_1_2 := AsList( deduped_5_2 );
              deduped_4_2 := MapOfFinSets( hoisted_1_1, List( hoisted_1_1, function ( i_3 )
                        return hoisted_1_2[hoisted_5_1[i_3]];
                    end ), Range( deduped_5_2 ) );
              deduped_3_2 := Source( deduped_4_2 );
              hoisted_2_2 := AsList( deduped_4_2 );
              return Position( hoisted_7_1, MapOfFinSets( deduped_3_2, List( deduped_3_2, function ( i_3 )
                          return hoisted_6_1[hoisted_2_2[i_3]];
                      end ), hoisted_2_1 ) );
          end ), r_1 );
end
########
        
    , 100 );
    
    ##
    AddExponentialOnObjects( cat,
        
########
function ( cat_1, a_1, b_1 )
    return FinSet( cat_1, Length( Tuples( AsList( b_1 ), Length( a_1 ) ) ) );
end
########
        
    , 100 );
    
    ##
    AddIdentityMorphism( cat,
        
########
function ( cat_1, a_1 )
    return MapOfFinSets( a_1, [ 1 .. Length( a_1 ) ], a_1 );
end
########
        
    , 100 );
    
    ##
    AddImageEmbeddingWithGivenImageObject( cat,
        
########
function ( cat_1, alpha_1, I_1 )
    return MapOfFinSets( I_1, SSortedList( AsList( alpha_1 ) ), Range( alpha_1 ) );
end
########
        
    , 100 );
    
    ##
    AddImageObject( cat,
        
########
function ( cat_1, arg2_1 )
    return FinSet( cat_1, Length( SSortedList( AsList( arg2_1 ) ) ) );
end
########
        
    , 100 );
    
    ##
    AddInitialObject( cat,
        
########
function ( cat_1 )
    return FinSet( cat_1, 0 );
end
########
        
    , 100 );
    
    ##
    AddInjectionOfCofactorOfCoproductWithGivenCoproduct( cat,
        
########
function ( cat_1, objects_1, k_1, P_1 )
    local hoisted_1_1;
    hoisted_1_1 := Sum( objects_1{[ 1 .. k_1 - 1 ]}, function ( x_2 )
            return Length( x_2 );
        end );
    return MapOfFinSets( objects_1[k_1], List( objects_1, function ( logic_new_func_list_2 )
                return List( logic_new_func_list_2, function ( x_3 )
                        return hoisted_1_1 + x_3;
                    end );
            end )[k_1], P_1 );
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
    return MapOfFinSets( deduped_3_1, List( AsList( deduped_3_1 ), function ( x_2 )
              return Position( hoisted_2_1, hoisted_1_1[x_2] );
          end ), Source( beta_1 ) );
end
########
        
    , 100 );
    
    ##
    AddMonomorphismIntoSomeInjectiveObject( cat,
        
########
function ( cat_1, A_1 )
    local hoisted_1_1, deduped_2_1, deduped_3_1;
    deduped_2_1 := Length( A_1 );
    if deduped_2_1 = 0 then
        deduped_3_1 := FinSet( cat_1, 1 );
        hoisted_1_1 := Length( deduped_3_1 );
        return MapOfFinSets( A_1, List( AsList( A_1 ), function ( a_2 )
                  return hoisted_1_1;
              end ), deduped_3_1 );
    else
        return MapOfFinSets( A_1, [ 1 .. deduped_2_1 ], A_1 );
    fi;
    return;
end
########
        
    , 100 );
    
    ##
    AddMorphismConstructor( cat,
        
########
function ( cat_1, arg2_1, arg3_1, arg4_1 )
    return MapOfFinSets( arg2_1, arg3_1, arg4_1 );
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
    return FinSet( cat_1, arg2_1 );
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
    return MapOfFinSets( deduped_3_1, List( deduped_3_1, function ( i_2 )
              return hoisted_2_1[hoisted_1_1[i_2]];
          end ), Range( beta_1 ) );
end
########
        
    , 100 );
    
    ##
    AddProjectionOntoCoequalizerWithGivenCoequalizer( cat,
        
########
function ( cat_1, morphisms_1, P_1 )
    local hoisted_1_1, deduped_2_1;
    deduped_2_1 := Range( morphisms_1[1] );
    hoisted_1_1 := SKELETAL_FIN_SETS_Coequalizer( morphisms_1 );
    return MapOfFinSets( deduped_2_1, List( deduped_2_1, function ( logic_new_func_x_2 )
              return Position( hoisted_1_1, First( hoisted_1_1, function ( c_3 )
                        return logic_new_func_x_2 in c_3;
                    end ) );
          end ), P_1 );
end
########
        
    , 100 );
    
    ##
    AddSubobjectClassifier( cat,
        
########
function ( cat_1 )
    return FinSet( cat_1, 2 );
end
########
        
    , 100 );
    
    ##
    AddTerminalObject( cat,
        
########
function ( cat_1 )
    return FinSet( cat_1, 1 );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismFromCoequalizerWithGivenCoequalizer( cat,
        
########
function ( cat_1, morphisms_1, T_1, tau_1, P_1 )
    return MapOfFinSets( P_1, List( SKELETAL_FIN_SETS_Coequalizer( morphisms_1 ), function ( x_2 )
              return tau_1( x_2[1] );
          end ), Range( tau_1 ) );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismFromCoproductWithGivenCoproduct( cat,
        
########
function ( cat_1, objects_1, T_1, tau_1, P_1 )
    return MapOfFinSets( P_1, Concatenation( List( [ 1 .. Length( tau_1 ) ], function ( x_2 )
                return AsList( tau_1[x_2] );
            end ) ), Range( tau_1[1] ) );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismFromInitialObjectWithGivenInitialObject( cat,
        
########
function ( cat_1, T_1, P_1 )
    return MapOfFinSets( P_1, [  ], T_1 );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismIntoEqualizerWithGivenEqualizer( cat,
        
########
function ( cat_1, morphisms_1, T_1, tau_1, P_1 )
    local hoisted_1_1, hoisted_2_1, deduped_3_1, deduped_4_1;
    deduped_4_1 := morphisms_1[1];
    deduped_3_1 := Source( tau_1 );
    hoisted_1_1 := deduped_4_1;
    hoisted_2_1 := Filtered( AsList( Source( deduped_4_1 ) ), function ( x_2 )
            local hoisted_1_2;
            hoisted_1_2 := hoisted_1_1( x_2 );
            return ForAll( morphisms_1, function ( fj_3 )
                    return hoisted_1_2 = fj_3( x_2 );
                end );
        end );
    return MapOfFinSets( deduped_3_1, List( deduped_3_1, function ( x_2 )
              return Position( hoisted_2_1, tau_1( x_2 ) );
          end ), P_1 );
end
########
        
    , 100 );
    
    ##
    AddUniversalMorphismIntoTerminalObjectWithGivenTerminalObject( cat,
        
########
function ( cat_1, T_1, P_1 )
    local hoisted_1_1;
    hoisted_1_1 := Length( P_1 );
    return MapOfFinSets( T_1, List( AsList( T_1 ), function ( a_2 )
              return hoisted_1_1;
          end ), P_1 );
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
