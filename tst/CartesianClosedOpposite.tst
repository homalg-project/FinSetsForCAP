##################################################################################
# Test the correspondences between the cartesian closed structure of the category
# of finite sets and the cocartesian coclosed structure of its opposite.
##################################################################################

gap> START_TEST( "CartesianClosedOpposite" );

#
gap> LoadPackage( "FinSets", false );
true

#
##############################################
# CartesianCategoriesTest
##############################################
#
gap> a := FinSet( [ 1 .. 2 ] );;
gap> b := FinSet( [ 3 .. 5 ] );;
gap> c := FinSet( [ 6 .. 8 ] );;
gap> d := FinSet( [ 12 .. 13 ] );; 

#
gap> finsets := CapCategory( a );;
gap> opposite := Opposite( finsets, "Opposite with all operations" );;
gap> opposite_primitive := Opposite( finsets, "Opposite with primitive operations" : only_primitive_operations := true );;

#
gap> alpha := MapOfFinSets( a, [ [ 1, 3 ], [ 2, 5 ] ], b );;
gap> beta := MapOfFinSets( c, [ [ 6, 12 ], [ 7, 12 ], [ 8, 13 ] ], d );;

#
gap> CartesianCategoriesTest( finsets, opposite, a, b, c, alpha, beta );;
gap> CartesianCategoriesTest( finsets, opposite_primitive, a, b, c, alpha, beta );;

#
gap> i := InitialObject( finsets );;
gap> t := TerminalObject( finsets );;

#
gap> alpha := UniversalMorphismFromInitialObject( a );;
gap> beta := UniversalMorphismIntoTerminalObject( a );;

#
gap> CartesianCategoriesTest( finsets, opposite, i, a, a, alpha, beta );;
gap> CartesianCategoriesTest( finsets, opposite_primitive, i, a, a, alpha, beta );;

#
gap> CartesianCategoriesTest( finsets, opposite, a, t, i, beta, alpha );;
gap> CartesianCategoriesTest( finsets, opposite_primitive, a, t, i, beta, alpha );;

#
##############################################
# CoartesianCategoriesTest
##############################################
#
gap> a := FinSet( [ 1 .. 2 ] );;
gap> b := FinSet( [ 3 .. 5 ] );;
gap> c := FinSet( [ 6 .. 8 ] );;
gap> d := FinSet( [ 12 .. 13 ] );;

#
gap> alpha := MapOfFinSets( a, [ [ 1, 3 ], [ 2, 5 ] ], b );;
gap> beta := MapOfFinSets( c, [ [ 6, 12 ], [ 7, 12 ], [ 8, 13 ] ], d );;

#
gap> CocartesianCategoriesTest( finsets, opposite, a, b, c, alpha, beta );;
gap> CocartesianCategoriesTest( finsets, opposite_primitive, a, b, c, alpha, beta );;

#
gap> i := InitialObject( finsets );;
gap> t := TerminalObject( finsets );;

#
gap> alpha := UniversalMorphismFromInitialObject( a );;
gap> beta := UniversalMorphismIntoTerminalObject( a );;

#
gap> CocartesianCategoriesTest( finsets, opposite, i, a, a, alpha, beta );;
gap> CocartesianCategoriesTest( finsets, opposite_primitive, i, a, a, alpha, beta );;

#
gap> CocartesianCategoriesTest( finsets, opposite, a, t, i, beta, alpha );;
gap> CocartesianCategoriesTest( finsets, opposite_primitive, a, t, i, beta, alpha );;

#
##############################################
# BraidedCartesianCategoriesTest
##############################################
#
gap> a := FinSet( [ 1 .. 2 ] );;
gap> b := FinSet( [ 3 .. 5 ] );;

#
gap> BraidedCartesianCategoriesTest( finsets, opposite, a, b );;
gap> BraidedCartesianCategoriesTest( finsets, opposite_primitive, a, b );;

#
gap> a := FinSet( [ 6 .. 8 ] );;
gap> b := FinSet( [ 12 .. 13 ] );;

#
gap> BraidedCartesianCategoriesTest( finsets, opposite, a, b );;
gap> BraidedCartesianCategoriesTest( finsets, opposite_primitive, a, b );;

#
gap> i := InitialObject( finsets );;
gap> a := FinSet( [ 5 .. 8 ] );;

#
gap> BraidedCartesianCategoriesTest( finsets, opposite, i, a );;
gap> BraidedCartesianCategoriesTest( finsets, opposite_primitive, i, a );;

#
gap> BraidedCartesianCategoriesTest( finsets, opposite, a, i );;
gap> BraidedCartesianCategoriesTest( finsets, opposite_primitive, a, i );;

#
gap> t := TerminalObject( finsets );;
gap> a := FinSet( [ 1 .. 3 ] );;

#
gap> BraidedCartesianCategoriesTest( finsets, opposite, t, a );;
gap> BraidedCartesianCategoriesTest( finsets, opposite_primitive, t, a );;

#
gap> BraidedCartesianCategoriesTest( finsets, opposite, a, t );;
gap> BraidedCartesianCategoriesTest( finsets, opposite_primitive, a, t );;

#
##############################################
# BraidedCocartesianCategoriesTest
##############################################
#
gap> a := FinSet( [ 1 .. 2 ] );;
gap> b := FinSet( [ 3 .. 5 ] );;

#
gap> BraidedCocartesianCategoriesTest( finsets, opposite, a, b );;
gap> BraidedCocartesianCategoriesTest( finsets, opposite_primitive, a, b );;

#
gap> a := FinSet( [ 6 .. 8 ] );;
gap> b := FinSet( [ 12 .. 13 ] );;

#
gap> BraidedCocartesianCategoriesTest( finsets, opposite, a, b );;
gap> BraidedCocartesianCategoriesTest( finsets, opposite_primitive, a, b );;

#
gap> i := InitialObject( finsets );;
gap> a := FinSet( [ 5 .. 8 ] );;

#
gap> BraidedCocartesianCategoriesTest( finsets, opposite, i, a );;
gap> BraidedCocartesianCategoriesTest( finsets, opposite_primitive, i, a );;

#
gap> BraidedCocartesianCategoriesTest( finsets, opposite, a, i );;
gap> BraidedCocartesianCategoriesTest( finsets, opposite_primitive, a, i );;

#
gap> t := TerminalObject( finsets );;
gap> a := FinSet( [ 1 .. 3 ] );;

#
gap> BraidedCocartesianCategoriesTest( finsets, opposite, t, a );;
gap> BraidedCocartesianCategoriesTest( finsets, opposite_primitive, t, a );;

#
gap> BraidedCocartesianCategoriesTest( finsets, opposite, a, t );;
gap> BraidedCocartesianCategoriesTest( finsets, opposite_primitive, a, t );;

#
##############################################
# DistributiveCartesianCategoriesTest
##############################################
#
gap> a := FinSet( [ 1 .. 2 ] );;
gap> L := [ FinSet( [ 2 .. 5 ] ), FinSet( [ 6 .. 7 ] ), FinSet( [ 3 .. 8 ] ) ];;

#
gap> DistributiveCartesianCategoriesTest( finsets, opposite, a, L );;
gap> DistributiveCartesianCategoriesTest( finsets, opposite_primitive, a, L );;

#
gap> a := InitialObject( finsets );;
gap> L := [ FinSet( [ 2 .. 5 ] ), FinSet( [ 6 .. 7 ] ), FinSet( [ 3 .. 8 ] ) ];;

#
gap> DistributiveCartesianCategoriesTest( finsets, opposite, a, L );;
gap> DistributiveCartesianCategoriesTest( finsets, opposite_primitive, a, L );;

#
gap> a := FinSet( [ 1 .. 2 ] );;
gap> L := [ FinSet( [ 2 .. 5 ] ), InitialObject( finsets ), FinSet( [ 3 .. 8 ] ) ];;

#
gap> DistributiveCartesianCategoriesTest( finsets, opposite, a, L );;
gap> DistributiveCartesianCategoriesTest( finsets, opposite_primitive, a, L );;

#
gap> a := TerminalObject( finsets );;
gap> L := [ FinSet( [ 2 .. 5 ] ), FinSet( [ 6 .. 7 ] ), FinSet( [ 3 .. 8 ] ) ];;

#
gap> DistributiveCartesianCategoriesTest( finsets, opposite, a, L );;
gap> DistributiveCartesianCategoriesTest( finsets, opposite_primitive, a, L );;

#
gap> a := FinSet( [ 1 .. 2 ] );;
gap> L := [ FinSet( [ 2 .. 5 ] ), TerminalObject( finsets ), FinSet( [ 3 .. 8 ] ) ];;

#
gap> DistributiveCartesianCategoriesTest( finsets, opposite, a, L );;
gap> DistributiveCartesianCategoriesTest( finsets, opposite_primitive, a, L );;

#
##############################################
# CartesianClosedCategoriesTest
##############################################
#
gap> a := FinSet( [ 1 .. 2 ] );;
gap> b := FinSet( [ 3 ] );;
gap> c := FinSet( [ 6 .. 7 ] );;
gap> d := FinSet( [ 12 .. 13 ] );;
gap> t := TerminalObject( finsets );;

#
gap> a_product_b := DirectProduct( a, b );;
gap> c_product_d := DirectProduct( c, d );;

#
gap> exp_ab := Exponential( a, b );;
gap> exp_cd := Exponential( c, d );;

#
gap> alpha := MapOfFinSets( a, [ [ 1, 3 ], [ 2, 3 ] ], b );;
gap> beta := MapOfFinSets( c, [ [ 6, 12 ], [ 7, 13 ] ], d );;
gap> gamma := UniversalMorphismIntoTerminalObject( a_product_b );;
gap> delta := UniversalMorphismIntoTerminalObject( c_product_d );;
gap> epsilon := MapOfFinSets( t, [ [ t[1], exp_ab[1] ] ], exp_ab );;
gap> zeta := MapOfFinSets( t, [ [ t[1], exp_cd[2] ] ], exp_cd );;

#
gap> CartesianClosedCategoriesTest( finsets, opposite, a, b, c, d, alpha, beta, gamma, delta, epsilon, zeta );;
gap> CartesianClosedCategoriesTest( finsets, opposite_primitive, a, b, c, d, alpha, beta, gamma, delta, epsilon, zeta );;

#
gap> i := InitialObject( finsets );;

#
gap> i_product_a := DirectProduct( i, a );;
gap> a_product_t := DirectProduct( a, t );;

#
gap> exp_ia := Exponential( i, a );;
gap> exp_at := Exponential( a, t );;

#
gap> alpha := UniversalMorphismFromInitialObject( a );;
gap> beta := UniversalMorphismIntoTerminalObject( a );;
gap> gamma := UniversalMorphismIntoTerminalObject( i_product_a );;
gap> delta := UniversalMorphismIntoTerminalObject( a_product_t );;
gap> epsilon := MapOfFinSets( t, [ [ t[1], exp_ia[1] ] ], exp_ia );;
gap> zeta := MapOfFinSets( t, [ [ t[1], exp_at[1] ] ], exp_at );;

#
gap> CartesianClosedCategoriesTest( finsets, opposite, i, a, a, t, alpha, beta, gamma, delta, epsilon, zeta );;
gap> CartesianClosedCategoriesTest( finsets, opposite_primitive, i, a, a, t, alpha, beta, gamma, delta, epsilon, zeta );;

#
##############################################
#
gap> STOP_TEST( "CartesianClosedOpposite" );
