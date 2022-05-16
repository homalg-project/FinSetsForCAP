##################################################################################
# Test the correspondences between the cartesian closed structure of the category
# of finite sets and the cocartesian coclosed structure of its opposite.
##################################################################################

gap> START_TEST("SkeletalCartesianClosedOpposite.tst");

gap> LoadPackage("FinSets", false);
true

##############################################
# CartesianCategoriesTest
##############################################

gap> a := FinSet( 2 );;
gap> b := FinSet( 3 );;
gap> c := FinSet( 3 );;
gap> d := FinSet( 2 );;

gap> finsets := CapCategory( a );;

gap> alpha := MapOfFinSets( a, [ 2, 1 ], b );;
gap> beta := MapOfFinSets( c, [ 0, 0, 1 ], d );;

gap> CartesianCategoriesTest( finsets, a, b, c, alpha, beta );;
gap> CartesianCategoriesTest( finsets, a, b, c, alpha, beta : only_primitive_operations := true );;

gap> i := InitialObject( finsets );;
gap> t := TerminalObject( finsets );;

gap> alpha := UniversalMorphismFromInitialObject( a );;
gap> beta := UniversalMorphismIntoTerminalObject( a );;

gap> CartesianCategoriesTest( finsets, i, a, a, alpha, beta );;
gap> CartesianCategoriesTest( finsets, i, a, a, alpha, beta : only_primitive_operations := true );;

gap> CartesianCategoriesTest( finsets, a, t, i, beta, alpha );;
gap> CartesianCategoriesTest( finsets, a, t, i, beta, alpha : only_primitive_operations := true );;

##############################################
# CoartesianCategoriesTest
##############################################

gap> a := FinSet( 2 );;
gap> b := FinSet( 3 );;
gap> c := FinSet( 3 );;
gap> d := FinSet( 2 );;

gap> alpha := MapOfFinSets( a, [ 2, 1 ], b );;
gap> beta := MapOfFinSets( c, [ 0, 0, 1 ], d );;

gap> CocartesianCategoriesTest( finsets, a, b, c, alpha, beta );;
gap> CocartesianCategoriesTest( finsets, a, b, c, alpha, beta : only_primitive_operations := true );;

gap> i := InitialObject( finsets );;
gap> t := TerminalObject( finsets );;

gap> alpha := UniversalMorphismFromInitialObject( a );;
gap> beta := UniversalMorphismIntoTerminalObject( a );;

gap> CocartesianCategoriesTest( finsets, i, a, a, alpha, beta );;
gap> CocartesianCategoriesTest( finsets, i, a, a, alpha, beta : only_primitive_operations := true );;

gap> CocartesianCategoriesTest( finsets, a, t, i, beta, alpha );;
gap> CocartesianCategoriesTest( finsets, a, t, i, beta, alpha : only_primitive_operations := true );;

##############################################
# BraidedCartesianCategoriesTest
##############################################

gap> a := FinSet( 2 );;
gap> b := FinSet( 3 );;

gap> BraidedCartesianCategoriesTest( finsets, a, b );;
gap> BraidedCartesianCategoriesTest( finsets, a, b : only_primitive_operations := true );;

gap> a := FinSet( 3 );;
gap> b := FinSet( 2 );;

gap> BraidedCartesianCategoriesTest( finsets, a, b );;
gap> BraidedCartesianCategoriesTest( finsets, a, b : only_primitive_operations := true );;

gap> i := InitialObject( finsets );;
gap> a := FinSet( 4 );;

gap> BraidedCartesianCategoriesTest( finsets, i, a );;
gap> BraidedCartesianCategoriesTest( finsets, i, a );;

gap> BraidedCartesianCategoriesTest( finsets, a, i );;
gap> BraidedCartesianCategoriesTest( finsets, a, i : only_primitive_operations := true );;

gap> t := TerminalObject( finsets );;
gap> a := FinSet( 3 );;

gap> BraidedCartesianCategoriesTest( finsets, t, a );;
gap> BraidedCartesianCategoriesTest( finsets, t, a : only_primitive_operations := true );;

gap> BraidedCartesianCategoriesTest( finsets, a, t );;
gap> BraidedCartesianCategoriesTest( finsets, a, t : only_primitive_operations := true );;

##############################################
# BraidedCocartesianCategoriesTest
##############################################

gap> a := FinSet( 2 );;
gap> b := FinSet( 3 );;

gap> BraidedCocartesianCategoriesTest( finsets, a, b );;
gap> BraidedCocartesianCategoriesTest( finsets, a, b : only_primitive_operations := true );;

gap> a := FinSet( 3 );;
gap> b := FinSet( 2 );;

gap> BraidedCocartesianCategoriesTest( finsets, a, b );;
gap> BraidedCocartesianCategoriesTest( finsets, a, b : only_primitive_operations := true );;

gap> i := InitialObject( finsets );;
gap> a := FinSet( 4 );;

gap> BraidedCocartesianCategoriesTest( finsets, i, a );;
gap> BraidedCocartesianCategoriesTest( finsets, i, a : only_primitive_operations := true );;

gap> BraidedCocartesianCategoriesTest( finsets, a, i );;
gap> BraidedCocartesianCategoriesTest( finsets, a, i : only_primitive_operations := true );;

gap> t := TerminalObject( finsets );;
gap> a := FinSet( 3 );;

gap> BraidedCocartesianCategoriesTest( finsets, t, a );;
gap> BraidedCocartesianCategoriesTest( finsets, t, a : only_primitive_operations := true );;

gap> BraidedCocartesianCategoriesTest( finsets, a, t );;
gap> BraidedCocartesianCategoriesTest( finsets, a, t : only_primitive_operations := true );;

##############################################
# DistributiveCartesianCategoriesTest
##############################################

gap> a := FinSet( 2 );;
gap> L := [ FinSet( 4 ), FinSet( 2 ), FinSet( 6 ) ];;

gap> DistributiveCartesianCategoriesTest( finsets, a, L : only_primitive_operations := true );;
gap> DistributiveCartesianCategoriesTest( finsets, a, L );;

gap> a := InitialObject( finsets );;
gap> L := [ FinSet( 4 ), FinSet( 2 ), FinSet( 6 ) ];;

gap> DistributiveCartesianCategoriesTest( finsets, a, L : only_primitive_operations := true );;
gap> DistributiveCartesianCategoriesTest( finsets, a, L );;

gap> a := FinSet( 2 );;
gap> L := [ FinSet( 4 ), InitialObject( finsets ), FinSet( 6 ) ];;

gap> DistributiveCartesianCategoriesTest( finsets, a, L : only_primitive_operations := true );;
gap> DistributiveCartesianCategoriesTest( finsets, a, L );;

gap> a := TerminalObject( finsets );;
gap> L := [ FinSet( 4 ), FinSet( 2 ), FinSet( 6 ) ];;

gap> DistributiveCartesianCategoriesTest( finsets, a, L : only_primitive_operations := true );;
gap> DistributiveCartesianCategoriesTest( finsets, a, L );;

gap> a := FinSet( 2 );;
gap> L := [ FinSet( 4 ), TerminalObject( finsets ), FinSet( 6 ) ];;

gap> DistributiveCartesianCategoriesTest( finsets, a, L : only_primitive_operations := true );;
gap> DistributiveCartesianCategoriesTest( finsets, a, L );;

##############################################
# CartesianClosedCategoriesTest
##############################################

#@if ValueOption( "no_precompiled_code" ) <> true
gap> a := FinSet( 2 );;
gap> b := FinSet( 1 );;
gap> c := FinSet( 2 );;
gap> d := FinSet( 2 );;
gap> t := TerminalObject( finsets );;

gap> a_product_b := DirectProduct( a, b );;
gap> c_product_d := DirectProduct( c, d );;

gap> exp_ab := Exponential( a, b );;
gap> exp_cd := Exponential( c, d );;

gap> alpha := MapOfFinSets( a, [ 0, 0 ], b );;
gap> beta := MapOfFinSets( c, [ 1, 0 ], d );;
gap> gamma := UniversalMorphismIntoTerminalObject( a_product_b );;
gap> delta := UniversalMorphismIntoTerminalObject( c_product_d );;
gap> epsilon := MapOfFinSets( t, [ 0 ], exp_ab );;
gap> zeta := MapOfFinSets( t, [ 1 ], exp_cd );;

gap> CartesianClosedCategoriesTest( finsets, a, b, c, d, alpha, beta, gamma, delta, epsilon, zeta );;
gap> CartesianClosedCategoriesTest( finsets, a, b, c, d, alpha, beta, gamma, delta, epsilon, zeta : only_primitive_operations := true );;

gap> i := InitialObject( finsets );;

gap> i_product_a := DirectProduct( i, a );;
gap> a_product_t := DirectProduct( a, t );;

gap> exp_ia := Exponential( i, a );;
gap> exp_at := Exponential( a, t );;

gap> alpha := UniversalMorphismFromInitialObject( a );;
gap> beta := UniversalMorphismIntoTerminalObject( a );;
gap> gamma := UniversalMorphismIntoTerminalObject( i_product_a );;
gap> delta := UniversalMorphismIntoTerminalObject( a_product_t );;
gap> epsilon := MapOfFinSets( t, [ 0 ], exp_ia );;
gap> zeta := MapOfFinSets( t, [ 0 ], exp_at );;

gap> CartesianClosedCategoriesTest( finsets, i, a, a, t, alpha, beta, gamma, delta, epsilon, zeta );;
gap> CartesianClosedCategoriesTest( finsets, i, a, a, t, alpha, beta, gamma, delta, epsilon, zeta : only_primitive_operations := true );;

#@fi
gap> STOP_TEST("SkeletalCartesianClosedOpposite.tst", 1);
