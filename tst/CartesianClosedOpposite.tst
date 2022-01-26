##################################################################################
# Test the correspondences between the cartesian closed structure of the category
# of finite sets and the cocartesian coclosed structure of its opposite.
##################################################################################

gap> START_TEST("CartesianClosedOpposite.tst");

gap> LoadPackage("FinSets", false);
true

##############################################################
# (Co)Product, Exp and Coexp on objects
##############################################################

# Products and exponential objects for finsets

gap> a_fs := FinSet( [ 1 .. 2 ] );;
gap> b_fs := FinSet( [ 3 .. 5 ] );;
gap> c_fs := FinSet( [ 6 .. 8 ] );;   # [ 6 .. 11 ] 
gap> d_fs := FinSet( [ 12 .. 13 ] );; # [ 12 .. 15 ]

gap> finsets := CapCategory( a_fs );;
gap> finsets_op := Opposite( finsets );;

gap> i_fs := InitialObject( finsets );;
gap> t_fs := TerminalObject( finsets );;

gap> a_product_b_fs := DirectProduct( a_fs, b_fs );;
gap> b_product_a_fs := DirectProduct( b_fs, a_fs );;
gap> c_product_d_fs := DirectProduct( c_fs, d_fs );;
gap> d_product_c_fs := DirectProduct( d_fs, c_fs );;

gap> i_product_a_fs := DirectProduct( i_fs, a_fs );;
gap> a_product_i_fs := DirectProduct( a_fs, i_fs );;

gap> t_product_a_fs := DirectProduct( t_fs, a_fs );;
gap> a_product_t_fs := DirectProduct( a_fs, t_fs );;

gap> exp_ab_fs := ExponentialOnObjects( a_fs, b_fs );;
gap> exp_ba_fs := ExponentialOnObjects( b_fs, a_fs );;
gap> exp_cd_fs := ExponentialOnObjects( c_fs, d_fs );;
gap> exp_dc_fs := ExponentialOnObjects( d_fs, c_fs );;

gap> exp_ia_fs := ExponentialOnObjects( i_fs, a_fs );;
gap> exp_ai_fs := ExponentialOnObjects( a_fs, i_fs );;
gap> exp_ta_fs := ExponentialOnObjects( t_fs, a_fs );;
gap> exp_at_fs := ExponentialOnObjects( a_fs, t_fs );;

# Coproducts and coexponentials for opposite

gap> a_fsop := Opposite( a_fs );;
gap> b_fsop := Opposite( b_fs );;
gap> c_fsop := Opposite( c_fs );;
gap> d_fsop := Opposite( d_fs );;

gap> i_fsop := InitialObject( finsets_op );;
gap> t_fsop := TerminalObject( finsets_op );;

gap> a_coproduct_b_fsop := Coproduct( a_fsop, b_fsop );;
gap> b_coproduct_a_fsop := Coproduct( b_fsop, a_fsop );;
gap> c_coproduct_d_fsop := Coproduct( c_fsop, d_fsop );;
gap> d_coproduct_c_fsop := Coproduct( d_fsop, c_fsop );;

gap> i_coproduct_a_fsop := Coproduct( i_fsop, a_fsop );;
gap> a_coproduct_i_fsop := Coproduct( a_fsop, i_fsop );;

gap> t_coproduct_a_fsop := Coproduct( t_fsop, a_fsop );;
gap> a_coproduct_t_fsop := Coproduct( a_fsop, t_fsop );;

gap> coexp_ab_fsop := CoexponentialOnObjects( a_fsop, b_fsop );;
gap> coexp_ba_fsop := CoexponentialOnObjects( b_fsop, a_fsop );;
gap> coexp_cd_fsop := CoexponentialOnObjects( c_fsop, d_fsop );;
gap> coexp_dc_fsop := CoexponentialOnObjects( d_fsop, c_fsop );;

gap> coexp_ia_fsop := CoexponentialOnObjects( i_fsop, a_fsop );;
gap> coexp_ai_fsop := CoexponentialOnObjects( a_fsop, i_fsop );;
gap> coexp_ta_fsop := CoexponentialOnObjects( t_fsop, a_fsop );;
gap> coexp_at_fsop := CoexponentialOnObjects( a_fsop, t_fsop );;

# Opposite correspondence on product objects

gap> i_fsop = Opposite( t_fs );
true
gap> t_fsop = Opposite( i_fs );
true

gap> a_coproduct_b_fsop = Opposite( a_product_b_fs );
true
gap> b_coproduct_a_fsop = Opposite( b_product_a_fs );
true
gap> c_coproduct_d_fsop = Opposite( c_product_d_fs );
true
gap> d_coproduct_c_fsop = Opposite( d_product_c_fs );
true

gap> i_coproduct_a_fsop = Opposite( t_product_a_fs );
true
gap> a_coproduct_i_fsop = Opposite( a_product_t_fs );
true

gap> t_coproduct_a_fsop = Opposite( i_product_a_fs );
true
gap> a_coproduct_t_fsop = Opposite( a_product_i_fs );
true

gap> b_coproduct_a_fsop = Opposite( c_product_d_fs );
false
gap> b_coproduct_a_fsop = Opposite( d_product_c_fs );
false
gap> c_coproduct_d_fsop = Opposite( a_product_b_fs );
false
gap> c_coproduct_d_fsop = Opposite( b_product_a_fs );
false

# Opposite correspondence on (co)exps

gap> coexp_ab_fsop = Opposite( exp_ba_fs );
true
gap> coexp_ba_fsop = Opposite( exp_ab_fs );
true
gap> coexp_cd_fsop = Opposite( exp_dc_fs );
true
gap> coexp_dc_fsop = Opposite( exp_cd_fs );
true

gap> coexp_ia_fsop = Opposite( exp_at_fs );
true
gap> coexp_ai_fsop = Opposite( exp_ta_fs );
true

gap> coexp_ta_fsop = Opposite( exp_ai_fs );
true
gap> coexp_at_fsop = Opposite( exp_ia_fs );
true

gap> coexp_cd_fsop = Opposite( exp_ab_fs );
false
gap> coexp_cd_fsop = Opposite( exp_ba_fs );
false
gap> coexp_dc_fsop = Opposite( exp_ab_fs );
false
gap> coexp_dc_fsop = Opposite( exp_ba_fs );
false

# Opposite must be self-inverse

gap> exp_ab_fs = Opposite( coexp_ba_fsop );
true
gap> exp_ba_fs = Opposite( coexp_ab_fsop );
true
gap> exp_cd_fs = Opposite( coexp_dc_fsop );
true
gap> exp_dc_fs = Opposite( coexp_cd_fsop );
true

# Convenience methods

gap> exp_ab_fs = Exponential( a_fs, b_fs );
true
gap> exp_ba_fs = Exponential( b_fs, a_fs );
true
gap> exp_cd_fs = Exponential( c_fs, d_fs );
true
gap> exp_dc_fs = Exponential( d_fs, c_fs );
true

gap> exp_ia_fs = Exponential( i_fs, a_fs );
true
gap> exp_ai_fs = Exponential( a_fs, i_fs );
true
gap> exp_ta_fs = Exponential( t_fs, a_fs );
true
gap> exp_at_fs = Exponential( a_fs, t_fs );
true

gap> coexp_ab_fsop = Coexponential( a_fsop, b_fsop );
true
gap> coexp_ba_fsop = Coexponential( b_fsop, a_fsop );
true
gap> coexp_cd_fsop = Coexponential( c_fsop, d_fsop );
true
gap> coexp_dc_fsop = Coexponential( d_fsop, c_fsop );
true

gap> coexp_ia_fsop = Coexponential( i_fsop, a_fsop );
true
gap> coexp_ai_fsop = Coexponential( a_fsop, i_fsop );
true
gap> coexp_ta_fsop = Coexponential( t_fsop, a_fsop );
true
gap> coexp_at_fsop = Coexponential( a_fsop, t_fsop );
true

################################################################
# (Co)Product, Hom and CoHom on morphisms
################################################################

# Morphisms for finsets

gap> id_a_fs := IdentityMorphism( a_fs );;
gap> id_b_fs := IdentityMorphism( b_fs );;

gap> g_ab := [ [ 1, 3 ], [ 2, 5 ] ];;
gap> g_bc := [ [ 3, 8 ], [ 4, 6 ], [ 5, 7 ] ];;     # [ [ 3, 8 ], [ 4, 11 ], [ 5, 9 ] ];; 
gap> g_cd := [ [ 6, 12 ], [ 7, 12 ], [ 8, 12 ] ];;  # [ [ 6, 12 ], [ 7, 15 ], [ 8, 14 ], [ 9, 14 ], [ 10, 13 ], [11, 12 ] ] 

gap> alpha_fs := MapOfFinSets( a_fs, g_ab, b_fs );;
gap> beta_fs := MapOfFinSets( c_fs, g_cd, d_fs );;
gap> gamma_fs := MapOfFinSets( b_fs, g_bc, c_fs );;

gap> alpha_gamma_fs := PreCompose( alpha_fs, gamma_fs );;
gap> gamma_beta_fs := PreCompose( gamma_fs, beta_fs );;
gap> alpha_gamma_beta_fs := PreCompose( [ alpha_fs, gamma_fs, beta_fs ] );;

gap> alpha_product_beta_fs := DirectProductOnMorphisms( alpha_fs, beta_fs );;
gap> beta_product_alpha_fs := DirectProductOnMorphisms( beta_fs, alpha_fs );;

gap> exp_alpha_id_a_fs := ExponentialOnMorphisms( alpha_fs, id_a_fs );;
gap> exp_alpha_id_b_fs := ExponentialOnMorphisms( alpha_fs, id_b_fs );;
gap> exp_id_a_alpha_fs := ExponentialOnMorphisms( id_a_fs, alpha_fs );;
gap> exp_id_b_alpha_fs := ExponentialOnMorphisms( id_b_fs, alpha_fs );;

gap> exp_alpha_beta_fs := ExponentialOnMorphisms( alpha_fs, beta_fs );;
gap> exp_beta_alpha_fs := ExponentialOnMorphisms( beta_fs, alpha_fs );;

# Morphisms for opposite of finsets

gap> id_a_fsop := IdentityMorphism( a_fsop );;
gap> id_b_fsop := IdentityMorphism( b_fsop );;

gap> alpha_fsop := Opposite( alpha_fs );;
gap> beta_fsop := Opposite( beta_fs );;
gap> gamma_fsop := Opposite( gamma_fs );;

gap> alpha_gamma_fsop := PostCompose( alpha_fsop, gamma_fsop );;
gap> gamma_beta_fsop := PostCompose( gamma_fsop, beta_fsop );;
gap> alpha_gamma_beta_fsop := PostCompose( [ alpha_fsop, gamma_fsop, beta_fsop ] );;

gap> alpha_coproduct_beta_fsop := CoproductOnMorphisms( alpha_fsop, beta_fsop );;
gap> beta_coproduct_alpha_fsop := CoproductOnMorphisms( beta_fsop, alpha_fsop );;

gap> coexp_alpha_id_a_fsop := CoexponentialOnMorphisms( alpha_fsop, id_a_fsop );;
gap> coexp_alpha_id_b_fsop := CoexponentialOnMorphisms( alpha_fsop, id_b_fsop );;
gap> coexp_id_a_alpha_fsop := CoexponentialOnMorphisms( id_a_fsop, alpha_fsop );;
gap> coexp_id_b_alpha_fsop := CoexponentialOnMorphisms( id_b_fsop, alpha_fsop );;

gap> coexp_alpha_beta_fsop := CoexponentialOnMorphisms( alpha_fsop, beta_fsop );;
gap> coexp_beta_alpha_fsop := CoexponentialOnMorphisms( beta_fsop, alpha_fsop );;

# Check if morphisms are well-defined

gap> IsWellDefined( alpha_fs );
true
gap> IsWellDefined( beta_fs );
true
gap> IsWellDefined( gamma_fs );
true

gap> IsWellDefined( alpha_fsop );
true
gap> IsWellDefined( beta_fsop );
true
gap> IsWellDefined( gamma_fsop );
true

# Opposite correspondence on products of morphisms

gap> alpha_coproduct_beta_fsop = Opposite( alpha_product_beta_fs );
true
gap> beta_coproduct_alpha_fsop = Opposite( beta_product_alpha_fs );
true

# Opposite correspondence on (co)exps

gap> coexp_alpha_beta_fsop = Opposite( exp_beta_alpha_fs );
true
gap> coexp_beta_alpha_fsop = Opposite( exp_alpha_beta_fs );
true

gap> coexp_alpha_beta_fsop = Opposite( exp_alpha_beta_fs );
false
gap> coexp_beta_alpha_fsop = Opposite( exp_beta_alpha_fs );
false

# Opposite correspondence on compositions of morphisms

gap> alpha_gamma_fsop = Opposite( alpha_gamma_fs );
true
gap> gamma_beta_fsop = Opposite( gamma_beta_fs );
true
gap> alpha_gamma_beta_fsop = Opposite( alpha_gamma_beta_fs );
true

gap> alpha_gamma_fsop = Opposite( gamma_beta_fs );
false
gap> alpha_gamma_fsop = Opposite( alpha_gamma_beta_fs );
false
gap> gamma_beta_fsop = Opposite( alpha_gamma_fs );
false
gap> gamma_beta_fsop = Opposite( alpha_gamma_beta_fs );
false
gap> alpha_gamma_beta_fsop = Opposite( alpha_gamma_fs );
false
gap> alpha_gamma_beta_fsop = Opposite( gamma_beta_fs );
false

# Opposite must be self-inverse

gap> exp_alpha_beta_fs = Opposite( coexp_beta_alpha_fsop );
true
gap> exp_beta_alpha_fs = Opposite( coexp_alpha_beta_fsop );
true

# Convenience methods in the opposite category

gap> exp_alpha_beta_fs = Exponential( alpha_fs, beta_fs );
true
gap> exp_beta_alpha_fs = Exponential( beta_fs, alpha_fs );
true

gap> coexp_alpha_beta_fsop = Coexponential( alpha_fsop, beta_fsop );
true
gap> coexp_beta_alpha_fsop = Coexponential( beta_fsop, alpha_fsop );
true

gap> coexp_alpha_id_a_fsop = Coexponential( alpha_fsop, a_fsop );
true
gap> coexp_alpha_id_b_fsop = Coexponential( alpha_fsop, b_fsop );
true
gap> coexp_id_a_alpha_fsop = Coexponential( a_fsop, alpha_fsop );
true
gap> coexp_id_b_alpha_fsop = Coexponential( b_fsop, alpha_fsop );
true

######################################################
# Unitors
######################################################

# Cartesian unitors

gap> cart_left_unitor_a_fs := CartesianLeftUnitor( a_fs );;
gap> cart_left_unitor_b_fs := CartesianLeftUnitor( b_fs );;
gap> cart_left_unitor_c_fs := CartesianLeftUnitor( c_fs );;
gap> cart_left_unitor_d_fs := CartesianLeftUnitor( d_fs );;
gap> cart_left_unitor_i_fs := CartesianLeftUnitor( i_fs );;
gap> cart_left_unitor_t_fs := CartesianLeftUnitor( t_fs );;

gap> cart_left_unitor_a_fsop := CartesianLeftUnitor( a_fsop );;
gap> cart_left_unitor_b_fsop := CartesianLeftUnitor( b_fsop );;
gap> cart_left_unitor_c_fsop := CartesianLeftUnitor( c_fsop );;
gap> cart_left_unitor_d_fsop := CartesianLeftUnitor( d_fsop );;
gap> cart_left_unitor_i_fsop := CartesianLeftUnitor( i_fsop );;
gap> cart_left_unitor_t_fsop := CartesianLeftUnitor( t_fsop );;

gap> cart_right_unitor_a_fs := CartesianRightUnitor( a_fs );;
gap> cart_right_unitor_b_fs := CartesianRightUnitor( b_fs );;
gap> cart_right_unitor_c_fs := CartesianRightUnitor( c_fs );;
gap> cart_right_unitor_d_fs := CartesianRightUnitor( d_fs );;
gap> cart_right_unitor_i_fs := CartesianRightUnitor( i_fs );;
gap> cart_right_unitor_t_fs := CartesianRightUnitor( t_fs );;

gap> cart_right_unitor_a_fsop := CartesianRightUnitor( a_fsop );;
gap> cart_right_unitor_b_fsop := CartesianRightUnitor( b_fsop );;
gap> cart_right_unitor_c_fsop := CartesianRightUnitor( c_fsop );;
gap> cart_right_unitor_d_fsop := CartesianRightUnitor( d_fsop );;
gap> cart_right_unitor_i_fsop := CartesianRightUnitor( i_fsop );;
gap> cart_right_unitor_t_fsop := CartesianRightUnitor( t_fsop );;

# Cocartesian unitors

gap> cocart_left_unitor_a_fs := CocartesianLeftUnitor( a_fs );;
gap> cocart_left_unitor_b_fs := CocartesianLeftUnitor( b_fs );;
gap> cocart_left_unitor_c_fs := CocartesianLeftUnitor( c_fs );;
gap> cocart_left_unitor_d_fs := CocartesianLeftUnitor( d_fs );;
gap> cocart_left_unitor_i_fs := CocartesianLeftUnitor( i_fs );;
gap> cocart_left_unitor_t_fs := CocartesianLeftUnitor( t_fs );;

gap> cocart_left_unitor_a_fsop := CocartesianLeftUnitor( a_fsop );;
gap> cocart_left_unitor_b_fsop := CocartesianLeftUnitor( b_fsop );;
gap> cocart_left_unitor_c_fsop := CocartesianLeftUnitor( c_fsop );;
gap> cocart_left_unitor_d_fsop := CocartesianLeftUnitor( d_fsop );;
gap> cocart_left_unitor_i_fsop := CocartesianLeftUnitor( i_fsop );;
gap> cocart_left_unitor_t_fsop := CocartesianLeftUnitor( t_fsop );;

gap> cocart_right_unitor_a_fs := CocartesianRightUnitor( a_fs );;
gap> cocart_right_unitor_b_fs := CocartesianRightUnitor( b_fs );;
gap> cocart_right_unitor_c_fs := CocartesianRightUnitor( c_fs );;
gap> cocart_right_unitor_d_fs := CocartesianRightUnitor( d_fs );;
gap> cocart_right_unitor_i_fs := CocartesianRightUnitor( i_fs );;
gap> cocart_right_unitor_t_fs := CocartesianRightUnitor( t_fs );;

gap> cocart_right_unitor_a_fsop := CocartesianRightUnitor( a_fsop );;
gap> cocart_right_unitor_b_fsop := CocartesianRightUnitor( b_fsop );;
gap> cocart_right_unitor_c_fsop := CocartesianRightUnitor( c_fsop );;
gap> cocart_right_unitor_d_fsop := CocartesianRightUnitor( d_fsop );;
gap> cocart_right_unitor_i_fsop := CocartesianRightUnitor( i_fsop );;
gap> cocart_right_unitor_t_fsop := CocartesianRightUnitor( t_fsop );;

# Inverse cartesian unitors

gap> cart_left_unitor_inverse_a_fs := CartesianLeftUnitorInverse( a_fs );;
gap> cart_left_unitor_inverse_b_fs := CartesianLeftUnitorInverse( b_fs );;
gap> cart_left_unitor_inverse_c_fs := CartesianLeftUnitorInverse( c_fs );;
gap> cart_left_unitor_inverse_d_fs := CartesianLeftUnitorInverse( d_fs );;
gap> cart_left_unitor_inverse_i_fs := CartesianLeftUnitorInverse( i_fs );;
gap> cart_left_unitor_inverse_t_fs := CartesianLeftUnitorInverse( t_fs );;

gap> cart_left_unitor_inverse_a_fsop := CartesianLeftUnitorInverse( a_fsop );;
gap> cart_left_unitor_inverse_b_fsop := CartesianLeftUnitorInverse( b_fsop );;
gap> cart_left_unitor_inverse_c_fsop := CartesianLeftUnitorInverse( c_fsop );;
gap> cart_left_unitor_inverse_d_fsop := CartesianLeftUnitorInverse( d_fsop );;
gap> cart_left_unitor_inverse_i_fsop := CartesianLeftUnitorInverse( i_fsop );;
gap> cart_left_unitor_inverse_t_fsop := CartesianLeftUnitorInverse( t_fsop );;

gap> cart_right_unitor_inverse_a_fs := CartesianRightUnitorInverse( a_fs );;
gap> cart_right_unitor_inverse_b_fs := CartesianRightUnitorInverse( b_fs );;
gap> cart_right_unitor_inverse_c_fs := CartesianRightUnitorInverse( c_fs );;
gap> cart_right_unitor_inverse_d_fs := CartesianRightUnitorInverse( d_fs );;
gap> cart_right_unitor_inverse_i_fs := CartesianRightUnitorInverse( i_fs );;
gap> cart_right_unitor_inverse_t_fs := CartesianRightUnitorInverse( t_fs );;

gap> cart_right_unitor_inverse_a_fsop := CartesianRightUnitorInverse( a_fsop );;
gap> cart_right_unitor_inverse_b_fsop := CartesianRightUnitorInverse( b_fsop );;
gap> cart_right_unitor_inverse_c_fsop := CartesianRightUnitorInverse( c_fsop );;
gap> cart_right_unitor_inverse_d_fsop := CartesianRightUnitorInverse( d_fsop );;
gap> cart_right_unitor_inverse_i_fsop := CartesianRightUnitorInverse( i_fsop );;
gap> cart_right_unitor_inverse_t_fsop := CartesianRightUnitorInverse( t_fsop );;

# Inverse cocartesian unitors

gap> cocart_left_unitor_inverse_a_fs := CocartesianLeftUnitorInverse( a_fs );;
gap> cocart_left_unitor_inverse_b_fs := CocartesianLeftUnitorInverse( b_fs );;
gap> cocart_left_unitor_inverse_c_fs := CocartesianLeftUnitorInverse( c_fs );;
gap> cocart_left_unitor_inverse_d_fs := CocartesianLeftUnitorInverse( d_fs );;
gap> cocart_left_unitor_inverse_i_fs := CocartesianLeftUnitorInverse( i_fs );;
gap> cocart_left_unitor_inverse_t_fs := CocartesianLeftUnitorInverse( t_fs );;

gap> cocart_left_unitor_inverse_a_fsop := CocartesianLeftUnitorInverse( a_fsop );;
gap> cocart_left_unitor_inverse_b_fsop := CocartesianLeftUnitorInverse( b_fsop );;
gap> cocart_left_unitor_inverse_c_fsop := CocartesianLeftUnitorInverse( c_fsop );;
gap> cocart_left_unitor_inverse_d_fsop := CocartesianLeftUnitorInverse( d_fsop );;
gap> cocart_left_unitor_inverse_i_fsop := CocartesianLeftUnitorInverse( i_fsop );;
gap> cocart_left_unitor_inverse_t_fsop := CocartesianLeftUnitorInverse( t_fsop );;

gap> cocart_right_unitor_inverse_a_fs := CocartesianRightUnitorInverse( a_fs );;
gap> cocart_right_unitor_inverse_b_fs := CocartesianRightUnitorInverse( b_fs );;
gap> cocart_right_unitor_inverse_c_fs := CocartesianRightUnitorInverse( c_fs );;
gap> cocart_right_unitor_inverse_d_fs := CocartesianRightUnitorInverse( d_fs );;
gap> cocart_right_unitor_inverse_i_fs := CocartesianRightUnitorInverse( i_fs );;
gap> cocart_right_unitor_inverse_t_fs := CocartesianRightUnitorInverse( t_fs );;

gap> cocart_right_unitor_inverse_a_fsop := CocartesianRightUnitorInverse( a_fsop );;
gap> cocart_right_unitor_inverse_b_fsop := CocartesianRightUnitorInverse( b_fsop );;
gap> cocart_right_unitor_inverse_c_fsop := CocartesianRightUnitorInverse( c_fsop );;
gap> cocart_right_unitor_inverse_d_fsop := CocartesianRightUnitorInverse( d_fsop );;
gap> cocart_right_unitor_inverse_i_fsop := CocartesianRightUnitorInverse( i_fsop );;
gap> cocart_right_unitor_inverse_t_fsop := CocartesianRightUnitorInverse( t_fsop );;

# Opposite correspondence

# Left unitors

gap> cart_left_unitor_a_fsop = Opposite( cocart_left_unitor_inverse_a_fs );
true
gap> cart_left_unitor_b_fsop = Opposite( cocart_left_unitor_inverse_b_fs );
true
gap> cart_left_unitor_c_fsop = Opposite( cocart_left_unitor_inverse_c_fs );
true
gap> cart_left_unitor_d_fsop = Opposite( cocart_left_unitor_inverse_d_fs );
true
gap> cart_left_unitor_i_fsop = Opposite( cocart_left_unitor_inverse_t_fs );
true
gap> cart_left_unitor_t_fsop = Opposite( cocart_left_unitor_inverse_i_fs );
true

gap> cocart_left_unitor_a_fsop = Opposite( cart_left_unitor_inverse_a_fs );
true
gap> cocart_left_unitor_b_fsop = Opposite( cart_left_unitor_inverse_b_fs );
true
gap> cocart_left_unitor_c_fsop = Opposite( cart_left_unitor_inverse_c_fs );
true
gap> cocart_left_unitor_d_fsop = Opposite( cart_left_unitor_inverse_d_fs );
true
gap> cocart_left_unitor_i_fsop = Opposite( cart_left_unitor_inverse_t_fs );
true
gap> cocart_left_unitor_t_fsop = Opposite( cart_left_unitor_inverse_i_fs );
true

# Left unitor inverses

gap> cart_left_unitor_inverse_a_fsop = Opposite( cocart_left_unitor_a_fs );
true
gap> cart_left_unitor_inverse_b_fsop = Opposite( cocart_left_unitor_b_fs );
true
gap> cart_left_unitor_inverse_c_fsop = Opposite( cocart_left_unitor_c_fs );
true
gap> cart_left_unitor_inverse_d_fsop = Opposite( cocart_left_unitor_d_fs );
true
gap> cart_left_unitor_inverse_i_fsop = Opposite( cocart_left_unitor_t_fs );
true
gap> cart_left_unitor_inverse_t_fsop = Opposite( cocart_left_unitor_i_fs );
true

gap> cocart_left_unitor_inverse_a_fsop = Opposite( cart_left_unitor_a_fs );
true
gap> cocart_left_unitor_inverse_b_fsop = Opposite( cart_left_unitor_b_fs );
true
gap> cocart_left_unitor_inverse_c_fsop = Opposite( cart_left_unitor_c_fs );
true
gap> cocart_left_unitor_inverse_d_fsop = Opposite( cart_left_unitor_d_fs );
true
gap> cocart_left_unitor_inverse_i_fsop = Opposite( cart_left_unitor_t_fs );
true
gap> cocart_left_unitor_inverse_t_fsop = Opposite( cart_left_unitor_i_fs );
true

# Right unitors

gap> cart_right_unitor_a_fsop = Opposite( cocart_right_unitor_inverse_a_fs );
true
gap> cart_right_unitor_b_fsop = Opposite( cocart_right_unitor_inverse_b_fs );
true
gap> cart_right_unitor_c_fsop = Opposite( cocart_right_unitor_inverse_c_fs );
true
gap> cart_right_unitor_d_fsop = Opposite( cocart_right_unitor_inverse_d_fs );
true
gap> cart_right_unitor_i_fsop = Opposite( cocart_right_unitor_inverse_t_fs );
true
gap> cart_right_unitor_t_fsop = Opposite( cocart_right_unitor_inverse_i_fs );
true

gap> cocart_right_unitor_a_fsop = Opposite( cart_right_unitor_inverse_a_fs );
true
gap> cocart_right_unitor_b_fsop = Opposite( cart_right_unitor_inverse_b_fs );
true
gap> cocart_right_unitor_c_fsop = Opposite( cart_right_unitor_inverse_c_fs );
true
gap> cocart_right_unitor_d_fsop = Opposite( cart_right_unitor_inverse_d_fs );
true
gap> cocart_right_unitor_i_fsop = Opposite( cart_right_unitor_inverse_t_fs );
true
gap> cocart_right_unitor_t_fsop = Opposite( cart_right_unitor_inverse_i_fs );
true

# Right unitor inverses

gap> cart_right_unitor_inverse_a_fsop = Opposite( cocart_right_unitor_a_fs );
true
gap> cart_right_unitor_inverse_b_fsop = Opposite( cocart_right_unitor_b_fs );
true
gap> cart_right_unitor_inverse_c_fsop = Opposite( cocart_right_unitor_c_fs );
true
gap> cart_right_unitor_inverse_d_fsop = Opposite( cocart_right_unitor_d_fs );
true
gap> cart_right_unitor_inverse_i_fsop = Opposite( cocart_right_unitor_t_fs );
true
gap> cart_right_unitor_inverse_t_fsop = Opposite( cocart_right_unitor_i_fs );
true

gap> cocart_right_unitor_inverse_a_fsop = Opposite( cart_right_unitor_a_fs );
true
gap> cocart_right_unitor_inverse_b_fsop = Opposite( cart_right_unitor_b_fs );
true
gap> cocart_right_unitor_inverse_c_fsop = Opposite( cart_right_unitor_c_fs );
true
gap> cocart_right_unitor_inverse_d_fsop = Opposite( cart_right_unitor_d_fs );
true
gap> cocart_right_unitor_inverse_i_fsop = Opposite( cart_right_unitor_t_fs );
true
gap> cocart_right_unitor_inverse_t_fsop = Opposite( cart_right_unitor_i_fs );
true

# False tests

# Left unitors

gap> cart_left_unitor_b_fsop = Opposite( cocart_left_unitor_inverse_a_fs );
false
gap> cart_left_unitor_b_fsop = Opposite( cocart_left_unitor_inverse_c_fs );
false
gap> cart_left_unitor_b_fsop = Opposite( cocart_left_unitor_inverse_d_fs );
false
gap> cart_left_unitor_b_fsop = Opposite( cart_left_unitor_inverse_b_fs );
false
gap> cart_left_unitor_b_fsop = Opposite( cart_left_unitor_b_fs );
false

gap> cocart_left_unitor_b_fsop = Opposite( cart_left_unitor_inverse_a_fs );
false
gap> cocart_left_unitor_b_fsop = Opposite( cart_left_unitor_inverse_c_fs );
false
gap> cocart_left_unitor_b_fsop = Opposite( cart_left_unitor_inverse_d_fs );
false
gap> cocart_left_unitor_b_fsop = Opposite( cocart_left_unitor_inverse_b_fs );
false
gap> cocart_left_unitor_b_fsop = Opposite( cocart_left_unitor_b_fs );
false

# Left unitor inverses

gap> cart_left_unitor_inverse_c_fsop = Opposite( cocart_left_unitor_a_fs );
false
gap> cart_left_unitor_inverse_c_fsop = Opposite( cocart_left_unitor_b_fs );
false
gap> cart_left_unitor_inverse_c_fsop = Opposite( cocart_left_unitor_d_fs );
false
gap> cart_left_unitor_inverse_c_fsop = Opposite( cart_left_unitor_d_fs );
false
gap> cart_left_unitor_inverse_c_fsop = Opposite( cart_left_unitor_inverse_c_fs );
false

gap> cocart_left_unitor_inverse_c_fsop = Opposite( cart_left_unitor_a_fs );
false
gap> cocart_left_unitor_inverse_c_fsop = Opposite( cart_left_unitor_b_fs );
false
gap> cocart_left_unitor_inverse_c_fsop = Opposite( cart_left_unitor_d_fs );
false
gap> cocart_left_unitor_inverse_c_fsop = Opposite( cocart_left_unitor_c_fs );
false
gap> cocart_left_unitor_inverse_c_fsop = Opposite( cocart_left_unitor_inverse_c_fs );
false

# Right unitors

gap> cart_right_unitor_a_fsop = Opposite( cocart_right_unitor_inverse_b_fs );
false
gap> cart_right_unitor_a_fsop = Opposite( cocart_right_unitor_inverse_c_fs );
false
gap> cart_right_unitor_a_fsop = Opposite( cocart_right_unitor_inverse_d_fs );
false
gap> cart_right_unitor_a_fsop = Opposite( cart_right_unitor_inverse_a_fs );
false
gap> cart_right_unitor_a_fsop = Opposite( cart_right_unitor_a_fs );
false

gap> cocart_right_unitor_a_fsop = Opposite( cart_right_unitor_inverse_b_fs );
false
gap> cocart_right_unitor_a_fsop = Opposite( cart_right_unitor_inverse_c_fs );
false
gap> cocart_right_unitor_a_fsop = Opposite( cart_right_unitor_inverse_d_fs );
false
gap> cocart_right_unitor_a_fsop = Opposite( cocart_right_unitor_inverse_a_fs );
false
gap> cocart_right_unitor_a_fsop = Opposite( cocart_right_unitor_a_fs );
false

# Right unitor inverses

gap> cart_right_unitor_inverse_d_fsop = Opposite( cocart_right_unitor_a_fs );
false
gap> cart_right_unitor_inverse_d_fsop = Opposite( cocart_right_unitor_b_fs );
false
gap> cart_right_unitor_inverse_d_fsop = Opposite( cocart_right_unitor_c_fs );
false
gap> cart_right_unitor_inverse_d_fsop = Opposite( cart_right_unitor_d_fs );
false
gap> cart_right_unitor_inverse_d_fsop = Opposite( cart_right_unitor_inverse_d_fs );
false

gap> cocart_right_unitor_inverse_d_fsop = Opposite( cart_right_unitor_a_fs );
false
gap> cocart_right_unitor_inverse_d_fsop = Opposite( cart_right_unitor_b_fs );
false
gap> cocart_right_unitor_inverse_d_fsop = Opposite( cart_right_unitor_c_fs );
false
gap> cocart_right_unitor_inverse_d_fsop = Opposite( cocart_right_unitor_d_fs );
false
gap> cocart_right_unitor_inverse_d_fsop = Opposite( cocart_right_unitor_inverse_d_fs );
false

######################################################
# Associators
######################################################

# Cartesian associators

gap> cart_associator_left_to_right_abc_fs := CartesianAssociatorLeftToRight( a_fs, b_fs, c_fs );;
gap> cart_associator_left_to_right_bcd_fs := CartesianAssociatorLeftToRight( b_fs, c_fs, d_fs );;
gap> cart_associator_left_to_right_acd_fs := CartesianAssociatorLeftToRight( a_fs, c_fs, d_fs );;
gap> cart_associator_left_to_right_cba_fs := CartesianAssociatorLeftToRight( c_fs, b_fs, a_fs );;
gap> cart_associator_left_to_right_dcb_fs := CartesianAssociatorLeftToRight( d_fs, c_fs, b_fs );;
gap> cart_associator_left_to_right_dib_fs := CartesianAssociatorLeftToRight( d_fs, i_fs, b_fs );;
gap> cart_associator_left_to_right_dtb_fs := CartesianAssociatorLeftToRight( d_fs, t_fs, b_fs );;

gap> cart_associator_left_to_right_abc_fsop := CartesianAssociatorLeftToRight( a_fsop, b_fsop, c_fsop );;
gap> cart_associator_left_to_right_bcd_fsop := CartesianAssociatorLeftToRight( b_fsop, c_fsop, d_fsop );;
gap> cart_associator_left_to_right_acd_fsop := CartesianAssociatorLeftToRight( a_fsop, c_fsop, d_fsop );;
gap> cart_associator_left_to_right_cba_fsop := CartesianAssociatorLeftToRight( c_fsop, b_fsop, a_fsop );;
gap> cart_associator_left_to_right_dcb_fsop := CartesianAssociatorLeftToRight( d_fsop, c_fsop, b_fsop );;
gap> cart_associator_left_to_right_dib_fsop := CartesianAssociatorLeftToRight( d_fsop, i_fsop, b_fsop );;
gap> cart_associator_left_to_right_dtb_fsop := CartesianAssociatorLeftToRight( d_fsop, t_fsop, b_fsop );;

gap> cart_associator_right_to_left_abc_fs := CartesianAssociatorRightToLeft( a_fs, b_fs, c_fs );;
gap> cart_associator_right_to_left_bcd_fs := CartesianAssociatorRightToLeft( b_fs, c_fs, d_fs );;
gap> cart_associator_right_to_left_acd_fs := CartesianAssociatorRightToLeft( a_fs, c_fs, d_fs );;
gap> cart_associator_right_to_left_cba_fs := CartesianAssociatorRightToLeft( c_fs, b_fs, a_fs );;
gap> cart_associator_right_to_left_dcb_fs := CartesianAssociatorRightToLeft( d_fs, c_fs, b_fs );;
gap> cart_associator_right_to_left_dib_fs := CartesianAssociatorRightToLeft( d_fs, i_fs, b_fs );;
gap> cart_associator_right_to_left_dtb_fs := CartesianAssociatorRightToLeft( d_fs, t_fs, b_fs );;

gap> cart_associator_right_to_left_abc_fsop := CartesianAssociatorRightToLeft( a_fsop, b_fsop, c_fsop );;
gap> cart_associator_right_to_left_bcd_fsop := CartesianAssociatorRightToLeft( b_fsop, c_fsop, d_fsop );;
gap> cart_associator_right_to_left_acd_fsop := CartesianAssociatorRightToLeft( a_fsop, c_fsop, d_fsop );;
gap> cart_associator_right_to_left_cba_fsop := CartesianAssociatorRightToLeft( c_fsop, b_fsop, a_fsop );;
gap> cart_associator_right_to_left_dcb_fsop := CartesianAssociatorRightToLeft( d_fsop, c_fsop, b_fsop );;
gap> cart_associator_right_to_left_dib_fsop := CartesianAssociatorRightToLeft( d_fsop, i_fsop, b_fsop );;
gap> cart_associator_right_to_left_dtb_fsop := CartesianAssociatorRightToLeft( d_fsop, t_fsop, b_fsop );;

# Coartesian associators

gap> cocart_associator_left_to_right_abc_fs := CocartesianAssociatorLeftToRight( a_fs, b_fs, c_fs );;
gap> cocart_associator_left_to_right_bcd_fs := CocartesianAssociatorLeftToRight( b_fs, c_fs, d_fs );;
gap> cocart_associator_left_to_right_acd_fs := CocartesianAssociatorLeftToRight( a_fs, c_fs, d_fs );;
gap> cocart_associator_left_to_right_cba_fs := CocartesianAssociatorLeftToRight( c_fs, b_fs, a_fs );;
gap> cocart_associator_left_to_right_dcb_fs := CocartesianAssociatorLeftToRight( d_fs, c_fs, b_fs );;
gap> cocart_associator_left_to_right_dib_fs := CocartesianAssociatorLeftToRight( d_fs, i_fs, b_fs );;
gap> cocart_associator_left_to_right_dtb_fs := CocartesianAssociatorLeftToRight( d_fs, t_fs, b_fs );;

gap> cocart_associator_left_to_right_abc_fsop := CocartesianAssociatorLeftToRight( a_fsop, b_fsop, c_fsop );;
gap> cocart_associator_left_to_right_bcd_fsop := CocartesianAssociatorLeftToRight( b_fsop, c_fsop, d_fsop );;
gap> cocart_associator_left_to_right_acd_fsop := CocartesianAssociatorLeftToRight( a_fsop, c_fsop, d_fsop );;
gap> cocart_associator_left_to_right_cba_fsop := CocartesianAssociatorLeftToRight( c_fsop, b_fsop, a_fsop );;
gap> cocart_associator_left_to_right_dcb_fsop := CocartesianAssociatorLeftToRight( d_fsop, c_fsop, b_fsop );;
gap> cocart_associator_left_to_right_dib_fsop := CocartesianAssociatorLeftToRight( d_fsop, i_fsop, b_fsop );;
gap> cocart_associator_left_to_right_dtb_fsop := CocartesianAssociatorLeftToRight( d_fsop, t_fsop, b_fsop );;

gap> cocart_associator_right_to_left_abc_fs := CocartesianAssociatorRightToLeft( a_fs, b_fs, c_fs );;
gap> cocart_associator_right_to_left_bcd_fs := CocartesianAssociatorRightToLeft( b_fs, c_fs, d_fs );;
gap> cocart_associator_right_to_left_acd_fs := CocartesianAssociatorRightToLeft( a_fs, c_fs, d_fs );;
gap> cocart_associator_right_to_left_cba_fs := CocartesianAssociatorRightToLeft( c_fs, b_fs, a_fs );;
gap> cocart_associator_right_to_left_dcb_fs := CocartesianAssociatorRightToLeft( d_fs, c_fs, b_fs );;
gap> cocart_associator_right_to_left_dib_fs := CocartesianAssociatorRightToLeft( d_fs, i_fs, b_fs );;
gap> cocart_associator_right_to_left_dtb_fs := CocartesianAssociatorRightToLeft( d_fs, t_fs, b_fs );;

gap> cocart_associator_right_to_left_abc_fsop := CocartesianAssociatorRightToLeft( a_fsop, b_fsop, c_fsop );;
gap> cocart_associator_right_to_left_bcd_fsop := CocartesianAssociatorRightToLeft( b_fsop, c_fsop, d_fsop );;
gap> cocart_associator_right_to_left_acd_fsop := CocartesianAssociatorRightToLeft( a_fsop, c_fsop, d_fsop );;
gap> cocart_associator_right_to_left_cba_fsop := CocartesianAssociatorRightToLeft( c_fsop, b_fsop, a_fsop );;
gap> cocart_associator_right_to_left_dcb_fsop := CocartesianAssociatorRightToLeft( d_fsop, c_fsop, b_fsop );;
gap> cocart_associator_right_to_left_dib_fsop := CocartesianAssociatorRightToLeft( d_fsop, i_fsop, b_fsop );;
gap> cocart_associator_right_to_left_dtb_fsop := CocartesianAssociatorRightToLeft( d_fsop, t_fsop, b_fsop );;

# Opposite correspondence

gap> cart_associator_left_to_right_abc_fsop = Opposite( cocart_associator_right_to_left_abc_fs );
true
gap> cart_associator_left_to_right_bcd_fsop = Opposite( cocart_associator_right_to_left_bcd_fs );
true
gap> cart_associator_left_to_right_acd_fsop = Opposite( cocart_associator_right_to_left_acd_fs );
true
gap> cart_associator_left_to_right_cba_fsop = Opposite( cocart_associator_right_to_left_cba_fs );
true
gap> cart_associator_left_to_right_dcb_fsop = Opposite( cocart_associator_right_to_left_dcb_fs );
true
gap> cart_associator_left_to_right_dib_fsop = Opposite( cocart_associator_right_to_left_dtb_fs );
true
gap> cart_associator_left_to_right_dtb_fsop = Opposite( cocart_associator_right_to_left_dib_fs );
true

gap> cocart_associator_left_to_right_abc_fsop = Opposite( cart_associator_right_to_left_abc_fs );
true
gap> cocart_associator_left_to_right_bcd_fsop = Opposite( cart_associator_right_to_left_bcd_fs );
true
gap> cocart_associator_left_to_right_acd_fsop = Opposite( cart_associator_right_to_left_acd_fs );
true
gap> cocart_associator_left_to_right_cba_fsop = Opposite( cart_associator_right_to_left_cba_fs );
true
gap> cocart_associator_left_to_right_dcb_fsop = Opposite( cart_associator_right_to_left_dcb_fs );
true
gap> cocart_associator_left_to_right_dib_fsop = Opposite( cart_associator_right_to_left_dtb_fs );
true
gap> cocart_associator_left_to_right_dtb_fsop = Opposite( cart_associator_right_to_left_dib_fs );
true

gap> cart_associator_right_to_left_abc_fsop = Opposite( cocart_associator_left_to_right_abc_fs );
true
gap> cart_associator_right_to_left_bcd_fsop = Opposite( cocart_associator_left_to_right_bcd_fs );
true
gap> cart_associator_right_to_left_acd_fsop = Opposite( cocart_associator_left_to_right_acd_fs );
true
gap> cart_associator_right_to_left_cba_fsop = Opposite( cocart_associator_left_to_right_cba_fs );
true
gap> cart_associator_right_to_left_dcb_fsop = Opposite( cocart_associator_left_to_right_dcb_fs );
true
gap> cart_associator_right_to_left_dib_fsop = Opposite( cocart_associator_left_to_right_dtb_fs );
true
gap> cart_associator_right_to_left_dtb_fsop = Opposite( cocart_associator_left_to_right_dib_fs );
true

gap> cocart_associator_right_to_left_abc_fsop = Opposite( cart_associator_left_to_right_abc_fs );
true
gap> cocart_associator_right_to_left_bcd_fsop = Opposite( cart_associator_left_to_right_bcd_fs );
true
gap> cocart_associator_right_to_left_acd_fsop = Opposite( cart_associator_left_to_right_acd_fs );
true
gap> cocart_associator_right_to_left_cba_fsop = Opposite( cart_associator_left_to_right_cba_fs );
true
gap> cocart_associator_right_to_left_dcb_fsop = Opposite( cart_associator_left_to_right_dcb_fs );
true
gap> cart_associator_right_to_left_dib_fsop = Opposite( cocart_associator_left_to_right_dtb_fs );
true
gap> cart_associator_right_to_left_dtb_fsop = Opposite( cocart_associator_left_to_right_dib_fs );
true

# False Tests

gap> cart_associator_left_to_right_cba_fsop = Opposite( cocart_associator_right_to_left_bcd_fs );
false
gap> cart_associator_left_to_right_cba_fsop = Opposite( cocart_associator_right_to_left_acd_fs );
false
gap> cart_associator_left_to_right_cba_fsop = Opposite( cocart_associator_right_to_left_dcb_fs );
false

gap> cocart_associator_left_to_right_cba_fsop = Opposite( cart_associator_right_to_left_bcd_fs );
false
gap> cocart_associator_left_to_right_cba_fsop = Opposite( cart_associator_right_to_left_acd_fs );
false
gap> cocart_associator_left_to_right_cba_fsop = Opposite( cart_associator_right_to_left_dcb_fs );
false

gap> cart_associator_right_to_left_acd_fsop = Opposite( cocart_associator_left_to_right_abc_fs );
false
gap> cart_associator_right_to_left_acd_fsop = Opposite( cocart_associator_left_to_right_bcd_fs );
false
gap> cart_associator_right_to_left_acd_fsop = Opposite( cocart_associator_left_to_right_cba_fs );
false

gap> cocart_associator_right_to_left_acd_fsop = Opposite( cart_associator_left_to_right_abc_fs );
false
gap> cocart_associator_right_to_left_acd_fsop = Opposite( cart_associator_left_to_right_bcd_fs );
false
gap> cocart_associator_right_to_left_acd_fsop = Opposite( cart_associator_left_to_right_cba_fs );
false

# False tests with initial/terminal objects

gap> cart_associator_left_to_right_dib_fsop = Opposite( cocart_associator_right_to_left_dib_fs );
false
gap> cart_associator_left_to_right_dib_fsop = Opposite( cart_associator_right_to_left_dib_fs );
false
gap> cart_associator_left_to_right_dib_fsop = Opposite( cart_associator_right_to_left_dtb_fs );
false

gap> cart_associator_left_to_right_dtb_fsop = Opposite( cocart_associator_right_to_left_dtb_fs );
false
gap> cart_associator_left_to_right_dtb_fsop = Opposite( cart_associator_right_to_left_dtb_fs );
false
gap> cart_associator_left_to_right_dtb_fsop = Opposite( cart_associator_right_to_left_dib_fs );
false

gap> cocart_associator_left_to_right_dib_fsop = Opposite( cart_associator_right_to_left_dib_fs );
false
gap> cocart_associator_left_to_right_dib_fsop = Opposite( cocart_associator_right_to_left_dib_fs );
false
gap> cocart_associator_left_to_right_dib_fsop = Opposite( cocart_associator_right_to_left_dtb_fs );
false

gap> cocart_associator_left_to_right_dtb_fsop = Opposite( cart_associator_right_to_left_dtb_fs );
false
gap> cocart_associator_left_to_right_dtb_fsop = Opposite( cocart_associator_right_to_left_dtb_fs );
false
gap> cocart_associator_left_to_right_dtb_fsop = Opposite( cocart_associator_right_to_left_dib_fs );
false

gap> cart_associator_right_to_left_dib_fsop = Opposite( cocart_associator_left_to_right_dib_fs );
false
gap> cart_associator_right_to_left_dib_fsop = Opposite( cart_associator_left_to_right_dib_fs );
false
gap> cart_associator_right_to_left_dib_fsop = Opposite( cart_associator_left_to_right_dtb_fs );
false

gap> cart_associator_right_to_left_dtb_fsop = Opposite( cocart_associator_left_to_right_dtb_fs );
false
gap> cart_associator_right_to_left_dtb_fsop = Opposite( cart_associator_left_to_right_dtb_fs );
false
gap> cart_associator_right_to_left_dtb_fsop = Opposite( cart_associator_left_to_right_dib_fs );
false

gap> cocart_associator_right_to_left_dib_fsop = Opposite( cart_associator_left_to_right_dib_fs );
false
gap> cocart_associator_right_to_left_dib_fsop = Opposite( cocart_associator_left_to_right_dib_fs );
false
gap> cocart_associator_right_to_left_dib_fsop = Opposite( cocart_associator_left_to_right_dtb_fs );
false

gap> cocart_associator_right_to_left_dtb_fsop = Opposite( cart_associator_left_to_right_dtb_fs );
false
gap> cocart_associator_right_to_left_dtb_fsop = Opposite( cocart_associator_left_to_right_dtb_fs );
false
gap> cocart_associator_right_to_left_dtb_fsop = Opposite( cocart_associator_left_to_right_dib_fs );
false

######################################################
# Braiding
######################################################

gap> cartesian_braiding_a_b_fs := CartesianBraiding( a_fs, b_fs );;
gap> cartesian_braiding_b_a_fs := CartesianBraiding( b_fs, a_fs );;
gap> cartesian_braiding_c_d_fs := CartesianBraiding( c_fs, d_fs );;
gap> cartesian_braiding_d_c_fs := CartesianBraiding( d_fs, c_fs );;

gap> cartesian_braiding_i_a_fs := CartesianBraiding( i_fs, a_fs );;
gap> cartesian_braiding_a_i_fs := CartesianBraiding( a_fs, i_fs );;
gap> cartesian_braiding_t_a_fs := CartesianBraiding( t_fs, a_fs );;
gap> cartesian_braiding_a_t_fs := CartesianBraiding( a_fs, t_fs );;

# Add tests once these morphisms are available

# gap> cartesian_braiding_a_b_fsop := CartesianBraiding( a_fsop, b_fsop );;
# gap> cartesian_braiding_b_a_fsop := CartesianBraiding( b_fsop, a_fsop );;
# gap> cartesian_braiding_c_d_fsop := CartesianBraiding( c_fsop, d_fsop );;
# gap> cartesian_braiding_d_c_fsop := CartesianBraiding( d_fsop, c_fsop );;

# gap> cartesian_braiding_i_a_fsop := CartesianBraiding( i_fsop, a_fsop );;
# gap> cartesian_braiding_a_i_fsop := CartesianBraiding( a_fsop, i_fsop );;
# gap> cartesian_braiding_t_a_fsop := CartesianBraiding( t_fsop, a_fsop );;
# gap> cartesian_braiding_a_t_fsop := CartesianBraiding( a_fsop, t_fsop );;

# gap> cocartesian_braiding_a_b_fs := CocartesianBraiding( a_fs, b_fs );;
# gap> cocartesian_braiding_b_a_fs := CocartesianBraiding( b_fs, a_fs );;
# gap> cocartesian_braiding_c_d_fs := CocartesianBraiding( c_fs, d_fs );;
# gap> cocartesian_braiding_d_c_fs := CocartesianBraiding( d_fs, c_fs );;

# gap> cocartesian_braiding_i_a_fs := CocartesianBraiding( i_fs, a_fs );;
# gap> cocartesian_braiding_a_i_fs := CocartesianBraiding( a_fs, i_fs );;
# gap> cocartesian_braiding_t_a_fs := CocartesianBraiding( t_fs, a_fs );;
# gap> cocartesian_braiding_a_t_fs := CocartesianBraiding( a_fs, t_fs );;

gap> cocartesian_braiding_a_b_fsop := CocartesianBraiding( a_fsop, b_fsop );;
gap> cocartesian_braiding_b_a_fsop := CocartesianBraiding( b_fsop, a_fsop );;
gap> cocartesian_braiding_c_d_fsop := CocartesianBraiding( c_fsop, d_fsop );;
gap> cocartesian_braiding_d_c_fsop := CocartesianBraiding( d_fsop, c_fsop );;

gap> cocartesian_braiding_i_a_fsop := CocartesianBraiding( i_fsop, a_fsop );;
gap> cocartesian_braiding_a_i_fsop := CocartesianBraiding( a_fsop, i_fsop );;
gap> cocartesian_braiding_t_a_fsop := CocartesianBraiding( t_fsop, a_fsop );;
gap> cocartesian_braiding_a_t_fsop := CocartesianBraiding( a_fsop, t_fsop );;

gap> cartesian_braiding_inverse_a_b_fs := CartesianBraidingInverse( a_fs, b_fs );;
gap> cartesian_braiding_inverse_b_a_fs := CartesianBraidingInverse( b_fs, a_fs );;
gap> cartesian_braiding_inverse_c_d_fs := CartesianBraidingInverse( c_fs, d_fs );;
gap> cartesian_braiding_inverse_d_c_fs := CartesianBraidingInverse( d_fs, c_fs );;

gap> cartesian_braiding_inverse_i_a_fs := CartesianBraidingInverse( i_fs, a_fs );;
gap> cartesian_braiding_inverse_a_i_fs := CartesianBraidingInverse( a_fs, i_fs );;
gap> cartesian_braiding_inverse_t_a_fs := CartesianBraidingInverse( t_fs, a_fs );;
gap> cartesian_braiding_inverse_a_t_fs := CartesianBraidingInverse( a_fs, t_fs );;

# Add tests once these morphisms are available

# gap> cocartesian_braiding_inverse_a_b_fs := CocartesianBraidingInverse( a_fs, b_fs );;
# gap> cocartesian_braiding_inverse_b_a_fs := CocartesianBraidingInverse( b_fs, a_fs );;
# gap> cocartesian_braiding_inverse_c_d_fs := CocartesianBraidingInverse( c_fs, d_fs );;
# gap> cocartesian_braiding_inverse_d_c_fs := CocartesianBraidingInverse( d_fs, c_fs );;

# gap> cocartesian_braiding_inverse_i_a_fs := CocartesianBraidingInverse( i_fs, a_fs );;
# gap> cocartesian_braiding_inverse_a_i_fs := CocartesianBraidingInverse( a_fs, i_fs );;
# gap> cocartesian_braiding_inverse_t_a_fs := CocartesianBraidingInverse( t_fs, a_fs );;
# gap> cocartesian_braiding_inverse_a_t_fs := CocartesianBraidingInverse( a_fs, t_fs );;

# gap> cartesian_braiding_inverse_a_b_fsop := CartesianBraidingInverse( a_fsop, b_fsop );;
# gap> cartesian_braiding_inverse_b_a_fsop := CartesianBraidingInverse( b_fsop, a_fsop );;
# gap> cartesian_braiding_inverse_c_d_fsop := CartesianBraidingInverse( c_fsop, d_fsop );;
# gap> cartesian_braiding_inverse_d_c_fsop := CartesianBraidingInverse( d_fsop, c_fsop );;

# gap> cartesian_braiding_inverse_i_a_fsop := CartesianBraidingInverse( i_fsop, a_fsop );;
# gap> cartesian_braiding_inverse_a_i_fsop := CartesianBraidingInverse( a_fsop, i_fsop );;
# gap> cartesian_braiding_inverse_t_a_fsop := CartesianBraidingInverse( t_fsop, a_fsop );;
# gap> cartesian_braiding_inverse_a_t_fsop := CartesianBraidingInverse( a_fsop, t_fsop );;

gap> cocartesian_braiding_inverse_a_b_fsop := CocartesianBraidingInverse( a_fsop, b_fsop );;
gap> cocartesian_braiding_inverse_b_a_fsop := CocartesianBraidingInverse( b_fsop, a_fsop );;
gap> cocartesian_braiding_inverse_c_d_fsop := CocartesianBraidingInverse( c_fsop, d_fsop );;
gap> cocartesian_braiding_inverse_d_c_fsop := CocartesianBraidingInverse( d_fsop, c_fsop );;

gap> cocartesian_braiding_inverse_i_a_fsop := CocartesianBraidingInverse( i_fsop, a_fsop );;
gap> cocartesian_braiding_inverse_a_i_fsop := CocartesianBraidingInverse( a_fsop, i_fsop );;
gap> cocartesian_braiding_inverse_t_a_fsop := CocartesianBraidingInverse( t_fsop, a_fsop );;
gap> cocartesian_braiding_inverse_a_t_fsop := CocartesianBraidingInverse( a_fsop, t_fsop );;

# Opposite correspondence

gap> cocartesian_braiding_a_b_fsop = Opposite( cartesian_braiding_inverse_a_b_fs );
true
gap> cocartesian_braiding_b_a_fsop = Opposite( cartesian_braiding_inverse_b_a_fs );
true
gap> cocartesian_braiding_c_d_fsop = Opposite( cartesian_braiding_inverse_c_d_fs );
true
gap> cocartesian_braiding_d_c_fsop = Opposite( cartesian_braiding_inverse_d_c_fs );
true
gap> cocartesian_braiding_i_a_fsop = Opposite( cartesian_braiding_inverse_t_a_fs );
true
gap> cocartesian_braiding_a_i_fsop = Opposite( cartesian_braiding_inverse_a_t_fs );
true
gap> cocartesian_braiding_t_a_fsop = Opposite( cartesian_braiding_inverse_i_a_fs );
true
gap> cocartesian_braiding_a_t_fsop = Opposite( cartesian_braiding_inverse_a_i_fs );
true

gap> cocartesian_braiding_inverse_a_b_fsop = Opposite( cartesian_braiding_a_b_fs );
true
gap> cocartesian_braiding_inverse_b_a_fsop = Opposite( cartesian_braiding_b_a_fs );
true
gap> cocartesian_braiding_inverse_c_d_fsop = Opposite( cartesian_braiding_c_d_fs );
true
gap> cocartesian_braiding_inverse_d_c_fsop = Opposite( cartesian_braiding_d_c_fs );
true
gap> cocartesian_braiding_inverse_i_a_fsop = Opposite( cartesian_braiding_t_a_fs );
true
gap> cocartesian_braiding_inverse_a_i_fsop = Opposite( cartesian_braiding_a_t_fs );
true
gap> cocartesian_braiding_inverse_t_a_fsop = Opposite( cartesian_braiding_i_a_fs );
true
gap> cocartesian_braiding_inverse_a_t_fsop = Opposite( cartesian_braiding_a_i_fs );
true

gap> cocartesian_braiding_a_b_fsop = Opposite( cartesian_braiding_inverse_b_a_fs );
false
gap> cocartesian_braiding_a_b_fsop = Opposite( cartesian_braiding_inverse_c_d_fs );
false
gap> cocartesian_braiding_a_b_fsop = Opposite( cartesian_braiding_inverse_d_c_fs );
false
gap> cocartesian_braiding_i_a_fsop = Opposite( cartesian_braiding_inverse_a_t_fs );
false

gap> cocartesian_braiding_c_d_fsop = Opposite( cartesian_braiding_inverse_a_b_fs );
false
gap> cocartesian_braiding_c_d_fsop = Opposite( cartesian_braiding_inverse_b_a_fs );
false
gap> cocartesian_braiding_c_d_fsop = Opposite( cartesian_braiding_inverse_d_c_fs );
false
gap> cocartesian_braiding_a_t_fsop = Opposite( cartesian_braiding_inverse_t_a_fs );
false

gap> cocartesian_braiding_inverse_b_a_fsop = Opposite( cartesian_braiding_a_b_fs );
false
gap> cocartesian_braiding_inverse_b_a_fsop = Opposite( cartesian_braiding_c_d_fs );
false
gap> cocartesian_braiding_inverse_b_a_fsop = Opposite( cartesian_braiding_d_c_fs );
false
gap> cocartesian_braiding_inverse_a_i_fsop = Opposite( cartesian_braiding_t_a_fs );
false

gap> cocartesian_braiding_inverse_d_c_fsop = Opposite( cartesian_braiding_a_b_fs );
false
gap> cocartesian_braiding_inverse_d_c_fsop = Opposite( cartesian_braiding_b_a_fs );
false
gap> cocartesian_braiding_inverse_d_c_fsop = Opposite( cartesian_braiding_c_d_fs );
false
gap> cocartesian_braiding_inverse_t_a_fsop = Opposite( cartesian_braiding_t_a_fs );
false

######################################################
# Identity morphisms
######################################################

# Identities for (co)product objects

gap> id_a_product_b_fs := IdentityMorphism( a_product_b_fs );;
gap> id_b_product_a_fs := IdentityMorphism( b_product_a_fs );;
gap> id_c_product_d_fs := IdentityMorphism( c_product_d_fs );;
gap> id_d_product_c_fs := IdentityMorphism( d_product_c_fs );;

gap> id_i_product_a_fs := IdentityMorphism( i_product_a_fs );;
gap> id_a_product_i_fs := IdentityMorphism( a_product_i_fs );;
gap> id_t_product_a_fs := IdentityMorphism( t_product_a_fs );;
gap> id_a_product_t_fs := IdentityMorphism( a_product_t_fs );;

gap> id_a_coproduct_b_fsop := IdentityMorphism( a_coproduct_b_fsop );;
gap> id_b_coproduct_a_fsop := IdentityMorphism( b_coproduct_a_fsop );;
gap> id_c_coproduct_d_fsop := IdentityMorphism( c_coproduct_d_fsop );;
gap> id_d_coproduct_c_fsop := IdentityMorphism( d_coproduct_c_fsop );;

gap> id_i_coproduct_a_fsop := IdentityMorphism( i_coproduct_a_fsop );;
gap> id_a_coproduct_i_fsop := IdentityMorphism( a_coproduct_i_fsop );;
gap> id_t_coproduct_a_fsop := IdentityMorphism( t_coproduct_a_fsop );;
gap> id_a_coproduct_t_fsop := IdentityMorphism( a_coproduct_t_fsop );;

# Identities for (co)exps

gap> id_exp_ab_fs := IdentityMorphism( exp_ab_fs );;
gap> id_exp_ba_fs := IdentityMorphism (exp_ba_fs );;
gap> id_exp_cd_fs := IdentityMorphism( exp_cd_fs );;
gap> id_exp_dc_fs := IdentityMorphism( exp_dc_fs );;

gap> id_exp_ia_fs := IdentityMorphism( exp_ia_fs );;
gap> id_exp_ai_fs := IdentityMorphism( exp_ai_fs );;
gap> id_exp_ta_fs := IdentityMorphism( exp_ta_fs );;
gap> id_exp_at_fs := IdentityMorphism( exp_at_fs );;

gap> id_exp_ta_fs := IdentityMorphism( exp_ta_fs );;
gap> id_exp_at_fs := IdentityMorphism( exp_at_fs );;

gap> id_coexp_ab_fsop := IdentityMorphism( coexp_ab_fsop );;
gap> id_coexp_ba_fsop := IdentityMorphism( coexp_ba_fsop );;
gap> id_coexp_cd_fsop := IdentityMorphism( coexp_cd_fsop );;
gap> id_coexp_dc_fsop := IdentityMorphism( coexp_dc_fsop );;

gap> id_coexp_ia_fsop := IdentityMorphism( coexp_ia_fsop );;
gap> id_coexp_ai_fsop := IdentityMorphism( coexp_ai_fsop );;
gap> id_coexp_ta_fsop := IdentityMorphism( coexp_ta_fsop );;
gap> id_coexp_at_fsop := IdentityMorphism( coexp_at_fsop );;

# Opposite correspondence on identities of (co)products

gap> id_a_coproduct_b_fsop = Opposite( id_a_product_b_fs );
true
gap> id_b_coproduct_a_fsop = Opposite( id_b_product_a_fs );
true
gap> id_c_coproduct_d_fsop = Opposite( id_c_product_d_fs );
true
gap> id_d_coproduct_c_fsop = Opposite( id_d_product_c_fs );
true

gap> id_i_coproduct_a_fsop = Opposite( id_t_product_a_fs );
true
gap> id_a_coproduct_i_fsop = Opposite( id_a_product_t_fs );
true
gap> id_t_coproduct_a_fsop = Opposite( id_i_product_a_fs );
true
gap> id_a_coproduct_t_fsop = Opposite( id_a_product_i_fs );
true

gap> id_a_coproduct_b_fsop = Opposite( id_c_product_d_fs );
false
gap> id_a_coproduct_b_fsop = Opposite( id_d_product_c_fs );
false
gap> id_c_coproduct_d_fsop = Opposite( id_a_product_b_fs );
false
gap> id_c_coproduct_d_fsop = Opposite( id_b_product_a_fs );
false

# Opposite correspondence on identities of (co)exps

gap> id_coexp_ab_fsop = Opposite( id_exp_ba_fs );
true
gap> id_coexp_ba_fsop = Opposite( id_exp_ab_fs );
true
gap> id_coexp_cd_fsop = Opposite( id_exp_dc_fs );
true
gap> id_coexp_dc_fsop = Opposite( id_exp_cd_fs );
true

gap> id_coexp_ia_fsop = Opposite( id_exp_at_fs );
true
gap> id_coexp_ai_fsop = Opposite( id_exp_ta_fs );
true
gap> id_coexp_ta_fsop = Opposite( id_exp_ai_fs );
true
gap> id_coexp_at_fsop = Opposite( id_exp_ia_fs );
true

gap> id_coexp_ab_fsop = Opposite( id_exp_cd_fs );
false
gap> id_coexp_ab_fsop = Opposite( id_exp_dc_fs );
false
gap> id_coexp_ab_fsop = Opposite( id_exp_ia_fs );
false
gap> id_coexp_ab_fsop = Opposite( id_exp_ta_fs );
false

#####################################################
# Units and counits
#####################################################

# Units and counits for finsets

gap> cart_ev_ab_fs := CartesianEvaluationMorphism( a_fs, b_fs );;
gap> cart_ev_ba_fs := CartesianEvaluationMorphism( b_fs, a_fs );;
gap> cart_ev_cd_fs := CartesianEvaluationMorphism( c_fs, d_fs );;
gap> cart_ev_dc_fs := CartesianEvaluationMorphism( d_fs, c_fs );;

gap> cart_ev_ia_fs := CartesianEvaluationMorphism( i_fs, a_fs );;
gap> cart_ev_ai_fs := CartesianEvaluationMorphism( a_fs, i_fs );;
gap> cart_ev_ta_fs := CartesianEvaluationMorphism( t_fs, a_fs );;
gap> cart_ev_at_fs := CartesianEvaluationMorphism( a_fs, t_fs );;

gap> cart_coev_ab_fs := CartesianCoevaluationMorphism( a_fs, b_fs );;
gap> cart_coev_ba_fs := CartesianCoevaluationMorphism( b_fs, a_fs );;
gap> cart_coev_cd_fs := CartesianCoevaluationMorphism( c_fs, d_fs );;
gap> cart_coev_dc_fs := CartesianCoevaluationMorphism( d_fs, c_fs );;

gap> cart_coev_ia_fs := CartesianCoevaluationMorphism( i_fs, a_fs );;
gap> cart_coev_ai_fs := CartesianCoevaluationMorphism( a_fs, i_fs );;
gap> cart_coev_ta_fs := CartesianCoevaluationMorphism( t_fs, a_fs );;
gap> cart_coev_at_fs := CartesianCoevaluationMorphism( a_fs, t_fs );;

# Units and counits for opposite of finsets

gap> cocart_ev_ab_fsop := CocartesianEvaluationMorphism( a_fsop, b_fsop );;
gap> cocart_ev_ba_fsop := CocartesianEvaluationMorphism( b_fsop, a_fsop );;
gap> cocart_ev_cd_fsop := CocartesianEvaluationMorphism( c_fsop, d_fsop );;
gap> cocart_ev_dc_fsop := CocartesianEvaluationMorphism( d_fsop, c_fsop );;

gap> cocart_ev_ia_fsop := CocartesianEvaluationMorphism( i_fsop, a_fsop );;
gap> cocart_ev_ai_fsop := CocartesianEvaluationMorphism( a_fsop, i_fsop );;
gap> cocart_ev_ta_fsop := CocartesianEvaluationMorphism( t_fsop, a_fsop );;
gap> cocart_ev_at_fsop := CocartesianEvaluationMorphism( a_fsop, t_fsop );;

gap> cocart_coev_ab_fsop := CocartesianCoevaluationMorphism( a_fsop, b_fsop );;
gap> cocart_coev_ba_fsop := CocartesianCoevaluationMorphism( b_fsop, a_fsop );;
gap> cocart_coev_cd_fsop := CocartesianCoevaluationMorphism( c_fsop, d_fsop );;
gap> cocart_coev_dc_fsop := CocartesianCoevaluationMorphism( d_fsop, c_fsop );;

gap> cocart_coev_ia_fsop := CocartesianCoevaluationMorphism( i_fsop, a_fsop );;
gap> cocart_coev_ai_fsop := CocartesianCoevaluationMorphism( a_fsop, i_fsop );;
gap> cocart_coev_ta_fsop := CocartesianCoevaluationMorphism( t_fsop, a_fsop );;
gap> cocart_coev_at_fsop := CocartesianCoevaluationMorphism( a_fsop, t_fsop );;

# Opposite correspondence on units and counits

# Arguments must be reversed for evaluations
gap> cocart_ev_ab_fsop = Opposite( cart_ev_ba_fs );
true
gap> cocart_ev_ba_fsop = Opposite( cart_ev_ab_fs );
true
gap> cocart_ev_cd_fsop = Opposite( cart_ev_dc_fs );
true
gap> cocart_ev_dc_fsop = Opposite( cart_ev_cd_fs );
true

gap> cocart_ev_ia_fsop = Opposite( cart_ev_at_fs );
true
gap> cocart_ev_ai_fsop = Opposite( cart_ev_ta_fs );
true
gap> cocart_ev_ta_fsop = Opposite( cart_ev_ai_fs );
true
gap> cocart_ev_at_fsop = Opposite( cart_ev_ia_fs );
true

gap> cocart_coev_ab_fsop = Opposite( cart_coev_ab_fs );
true
gap> cocart_coev_ba_fsop = Opposite( cart_coev_ba_fs );
true
gap> cocart_coev_cd_fsop = Opposite( cart_coev_cd_fs );
true
gap> cocart_coev_dc_fsop = Opposite( cart_coev_dc_fs );
true

gap> cocart_coev_ia_fsop = Opposite( cart_coev_ta_fs );
true
gap> cocart_coev_ai_fsop = Opposite( cart_coev_at_fs );
true
gap> cocart_coev_ta_fsop = Opposite( cart_coev_ia_fs );
true
gap> cocart_coev_at_fsop = Opposite( cart_coev_ai_fs );
true

gap> cocart_ev_ba_fsop = Opposite( cart_ev_ba_fs );
false
gap> cocart_ev_ba_fsop = Opposite( cart_ev_cd_fs );
false
gap> cocart_ev_ba_fsop = Opposite( cart_ev_dc_fs );
false

gap> cocart_coev_dc_fsop = Opposite( cart_coev_cd_fs );
false
gap> cocart_coev_dc_fsop = Opposite( cart_coev_ab_fs );
false
gap> cocart_coev_dc_fsop = Opposite( cart_coev_ba_fs );
false

gap> cocart_ev_cd_fsop = Opposite( cart_ev_ab_fs );
false
gap> cocart_ev_cd_fsop = Opposite( cart_ev_ba_fs );
false
gap> cocart_ev_cd_fsop = Opposite( cart_ev_cd_fs );
false

gap> cocart_coev_ab_fsop = Opposite( cart_coev_ba_fs );
false
gap> cocart_coev_ab_fsop = Opposite( cart_coev_cd_fs );
false
gap> cocart_coev_ab_fsop = Opposite( cart_coev_dc_fs );
false

#####################################################
# Adjunction maps on identities
#####################################################

# Closed cartesian structure for finsets

gap> product_to_exp_adjunction_on_id_a_product_b_fs := DirectProductToExponentialAdjunctionMap( a_fs, b_fs, id_a_product_b_fs );;
gap> product_to_exp_adjunction_on_id_b_product_a_fs := DirectProductToExponentialAdjunctionMap( b_fs, a_fs, id_b_product_a_fs );;
gap> product_to_exp_adjunction_on_id_c_product_d_fs := DirectProductToExponentialAdjunctionMap( c_fs, d_fs, id_c_product_d_fs );;
gap> product_to_exp_adjunction_on_id_d_product_c_fs := DirectProductToExponentialAdjunctionMap( d_fs, c_fs, id_d_product_c_fs );;

gap> product_to_exp_adjunction_on_id_i_product_a_fs := DirectProductToExponentialAdjunctionMap( i_fs, a_fs, id_i_product_a_fs );;
gap> product_to_exp_adjunction_on_id_a_product_i_fs := DirectProductToExponentialAdjunctionMap( a_fs, i_fs, id_a_product_i_fs );;
gap> product_to_exp_adjunction_on_id_t_product_a_fs := DirectProductToExponentialAdjunctionMap( t_fs, a_fs, id_t_product_a_fs );;
gap> product_to_exp_adjunction_on_id_a_product_t_fs := DirectProductToExponentialAdjunctionMap( a_fs, t_fs, id_a_product_t_fs );;

gap> exp_to_product_adjunction_on_id_exp_ab_fs := ExponentialToDirectProductAdjunctionMap( a_fs, b_fs, id_exp_ab_fs );;
gap> exp_to_product_adjunction_on_id_exp_ba_fs := ExponentialToDirectProductAdjunctionMap( b_fs, a_fs, id_exp_ba_fs );;
gap> exp_to_product_adjunction_on_id_exp_cd_fs := ExponentialToDirectProductAdjunctionMap( c_fs, d_fs, id_exp_cd_fs );;
gap> exp_to_product_adjunction_on_id_exp_dc_fs := ExponentialToDirectProductAdjunctionMap( d_fs, c_fs, id_exp_dc_fs );;

gap> exp_to_product_adjunction_on_id_exp_ia_fs := ExponentialToDirectProductAdjunctionMap( i_fs, a_fs, id_exp_ia_fs );;
gap> exp_to_product_adjunction_on_id_exp_ai_fs := ExponentialToDirectProductAdjunctionMap( a_fs, i_fs, id_exp_ai_fs );;
gap> exp_to_product_adjunction_on_id_exp_ta_fs := ExponentialToDirectProductAdjunctionMap( t_fs, a_fs, id_exp_ta_fs );;
gap> exp_to_product_adjunction_on_id_exp_at_fs := ExponentialToDirectProductAdjunctionMap( a_fs, t_fs, id_exp_at_fs );;

# Coclosed cocartesian structure for opposite of finsets

gap> coproduct_to_coexp_adjunction_on_id_a_coproduct_b_fsop := CoproductToCoexponentialAdjunctionMap( a_fsop, b_fsop, id_a_coproduct_b_fsop );;
gap> coproduct_to_coexp_adjunction_on_id_b_coproduct_a_fsop := CoproductToCoexponentialAdjunctionMap( b_fsop, a_fsop, id_b_coproduct_a_fsop );;
gap> coproduct_to_coexp_adjunction_on_id_c_coproduct_d_fsop := CoproductToCoexponentialAdjunctionMap( c_fsop, d_fsop, id_c_coproduct_d_fsop );;
gap> coproduct_to_coexp_adjunction_on_id_d_coproduct_c_fsop := CoproductToCoexponentialAdjunctionMap( d_fsop, c_fsop, id_d_coproduct_c_fsop );;

gap> coproduct_to_coexp_adjunction_on_id_i_coproduct_a_fsop := CoproductToCoexponentialAdjunctionMap( i_fsop, a_fsop, id_i_coproduct_a_fsop );;
gap> coproduct_to_coexp_adjunction_on_id_a_coproduct_i_fsop := CoproductToCoexponentialAdjunctionMap( a_fsop, i_fsop, id_a_coproduct_i_fsop );;
gap> coproduct_to_coexp_adjunction_on_id_t_coproduct_a_fsop := CoproductToCoexponentialAdjunctionMap( t_fsop, a_fsop, id_t_coproduct_a_fsop );;
gap> coproduct_to_coexp_adjunction_on_id_a_coproduct_t_fsop := CoproductToCoexponentialAdjunctionMap( a_fsop, t_fsop, id_a_coproduct_t_fsop );;

gap> coexp_to_coproduct_adjunction_on_id_coexp_ab_fsop := CoexponentialToCoproductAdjunctionMap( a_fsop, b_fsop, id_coexp_ab_fsop );;
gap> coexp_to_coproduct_adjunction_on_id_coexp_ba_fsop := CoexponentialToCoproductAdjunctionMap( b_fsop, a_fsop, id_coexp_ba_fsop );;
gap> coexp_to_coproduct_adjunction_on_id_coexp_cd_fsop := CoexponentialToCoproductAdjunctionMap( c_fsop, d_fsop, id_coexp_cd_fsop );;
gap> coexp_to_coproduct_adjunction_on_id_coexp_dc_fsop := CoexponentialToCoproductAdjunctionMap( d_fsop, c_fsop, id_coexp_dc_fsop );;

gap> coexp_to_coproduct_adjunction_on_id_coexp_ia_fsop := CoexponentialToCoproductAdjunctionMap( i_fsop, a_fsop, id_coexp_ia_fsop );;
gap> coexp_to_coproduct_adjunction_on_id_coexp_ai_fsop := CoexponentialToCoproductAdjunctionMap( a_fsop, i_fsop, id_coexp_ai_fsop );;
gap> coexp_to_coproduct_adjunction_on_id_coexp_ta_fsop := CoexponentialToCoproductAdjunctionMap( t_fsop, a_fsop, id_coexp_ta_fsop );;
gap> coexp_to_coproduct_adjunction_on_id_coexp_at_fsop := CoexponentialToCoproductAdjunctionMap( a_fsop, t_fsop, id_coexp_at_fsop );;

# Opposite correspondence on adjunction maps

# coclev = op( ev ), arguments must be reversed for evaluations

gap> coexp_to_coproduct_adjunction_on_id_coexp_ab_fsop = Opposite( exp_to_product_adjunction_on_id_exp_ba_fs ); # a -> Coexp( a, b ) x b  ==  op( Exp( b, a ) x b -> a )
true
gap> coexp_to_coproduct_adjunction_on_id_coexp_ba_fsop = Opposite( exp_to_product_adjunction_on_id_exp_ab_fs ); # b -> Coexp( b, a ) x a  ==  op( Exp( a, b ) x a -> b )
true
gap> coexp_to_coproduct_adjunction_on_id_coexp_cd_fsop = Opposite( exp_to_product_adjunction_on_id_exp_dc_fs ); # c -> Coexp( c, d ) x d  ==  op( Exp( d, c ) x d -> c )
true
gap> coexp_to_coproduct_adjunction_on_id_coexp_dc_fsop = Opposite( exp_to_product_adjunction_on_id_exp_cd_fs ); # d -> Coexp( d, c ) x c  ==  op( Exp( c, d ) x c -> d )
true

gap> coexp_to_coproduct_adjunction_on_id_coexp_ia_fsop = Opposite( exp_to_product_adjunction_on_id_exp_at_fs ); # i -> Coexp( i, a ) x a  ==  op( Exp( a, t ) x a -> t )
true
gap> coexp_to_coproduct_adjunction_on_id_coexp_ai_fsop = Opposite( exp_to_product_adjunction_on_id_exp_ta_fs ); # a -> Coexp( a, i ) x i  ==  op( Exp( t, a ) x t -> a )
true
gap> coexp_to_coproduct_adjunction_on_id_coexp_ta_fsop = Opposite( exp_to_product_adjunction_on_id_exp_ai_fs ); # t -> Coexp( t, a ) x a  ==  op( Exp( a, i ) x a -> i )
true
gap> coexp_to_coproduct_adjunction_on_id_coexp_at_fsop = Opposite( exp_to_product_adjunction_on_id_exp_ia_fs ); # a -> Coexp( a, t ) x t  ==  op( Exp( i, a ) x i -> a )
true

gap> cocart_ev_ab_fsop = Opposite( exp_to_product_adjunction_on_id_exp_ba_fs );
true
gap> cocart_ev_ba_fsop = Opposite( exp_to_product_adjunction_on_id_exp_ab_fs );
true
gap> cocart_ev_cd_fsop = Opposite( exp_to_product_adjunction_on_id_exp_dc_fs );
true
gap> cocart_ev_dc_fsop = Opposite( exp_to_product_adjunction_on_id_exp_cd_fs );
true

gap> cocart_ev_ia_fsop = Opposite( exp_to_product_adjunction_on_id_exp_at_fs );
true
gap> cocart_ev_ai_fsop = Opposite( exp_to_product_adjunction_on_id_exp_ta_fs );
true
gap> cocart_ev_ta_fsop = Opposite( exp_to_product_adjunction_on_id_exp_ai_fs );
true
gap> cocart_ev_at_fsop = Opposite( exp_to_product_adjunction_on_id_exp_ia_fs );
true

# coclcoev = op( coev )

gap> coproduct_to_coexp_adjunction_on_id_a_coproduct_b_fsop = Opposite( product_to_exp_adjunction_on_id_a_product_b_fs ); # Coexp( a x b, b ) -> a  ==  op( a -> Exp( b, a x b ) )
true
gap> coproduct_to_coexp_adjunction_on_id_b_coproduct_a_fsop = Opposite( product_to_exp_adjunction_on_id_b_product_a_fs ); # Coexp( b x a, a ) -> b  ==  op( b -> Exp( a, b x a ) )
true
gap> coproduct_to_coexp_adjunction_on_id_c_coproduct_d_fsop = Opposite( product_to_exp_adjunction_on_id_c_product_d_fs ); # Coexp( c x d, d ) -> c  ==  op( c -> Exp( d, c x d ) )
true
gap> coproduct_to_coexp_adjunction_on_id_d_coproduct_c_fsop = Opposite( product_to_exp_adjunction_on_id_d_product_c_fs ); # Coexp( d x c, c ) -> d  ==  op( d -> Exp( c, d x c ) )
true

gap> coproduct_to_coexp_adjunction_on_id_i_coproduct_a_fsop = Opposite( product_to_exp_adjunction_on_id_t_product_a_fs ); # Coexp( i x a, a ) -> i  ==  op( t -> Exp( a, t x a ) )
true
gap> coproduct_to_coexp_adjunction_on_id_a_coproduct_i_fsop = Opposite( product_to_exp_adjunction_on_id_a_product_t_fs ); # Coexp( a x i, i ) -> a  ==  op( a -> Exp( t, a x t ) )
true
gap> coproduct_to_coexp_adjunction_on_id_t_coproduct_a_fsop = Opposite( product_to_exp_adjunction_on_id_i_product_a_fs ); # Coexp( t x a, a ) -> t  ==  op( i -> Exp( a, i x a ) )
true
gap> coproduct_to_coexp_adjunction_on_id_a_coproduct_t_fsop = Opposite( product_to_exp_adjunction_on_id_a_product_i_fs ); # Coexp( a x t, t ) -> a  ==  op( a -> Exp( i, a x i ) )
true

gap> cocart_coev_ab_fsop = Opposite( product_to_exp_adjunction_on_id_a_product_b_fs );
true
gap> cocart_coev_ba_fsop = Opposite( product_to_exp_adjunction_on_id_b_product_a_fs );
true
gap> cocart_coev_cd_fsop = Opposite( product_to_exp_adjunction_on_id_c_product_d_fs );
true
gap> cocart_coev_dc_fsop = Opposite( product_to_exp_adjunction_on_id_d_product_c_fs );
true

gap> cocart_coev_ia_fsop = Opposite( product_to_exp_adjunction_on_id_t_product_a_fs );
true
gap> cocart_coev_ai_fsop = Opposite( product_to_exp_adjunction_on_id_a_product_t_fs );
true
gap> cocart_coev_ta_fsop = Opposite( product_to_exp_adjunction_on_id_i_product_a_fs );
true
gap> cocart_coev_at_fsop = Opposite( product_to_exp_adjunction_on_id_a_product_i_fs );
true

#####################################################
# Adjunction maps on non-identities
#####################################################

# Adjunction maps on product morphisms

gap> product_to_exp_adjunction_on_alpha_product_beta_fs := DirectProductToExponentialAdjunctionMap( a_fs, c_fs, alpha_product_beta_fs );;
gap> product_to_exp_adjunction_on_beta_product_alpha_fs := DirectProductToExponentialAdjunctionMap( c_fs, a_fs, beta_product_alpha_fs );;

gap> coproduct_to_coexp_adjunction_on_alpha_coproduct_beta_fsop := CoproductToCoexponentialAdjunctionMap( a_fsop, c_fsop, alpha_coproduct_beta_fsop  );;
gap> coproduct_to_coexp_adjunction_on_beta_coproduct_alpha_fsop := CoproductToCoexponentialAdjunctionMap( c_fsop, a_fsop, beta_coproduct_alpha_fsop );;

# Adjunction maps on (co)exponential morphisms

gap> exp_to_product_adjunction_on_exp_alpha_beta_fs := ExponentialToDirectProductAdjunctionMap( a_fs, d_fs, exp_alpha_beta_fs );;
gap> exp_to_product_adjunction_on_exp_beta_alpha_fs := ExponentialToDirectProductAdjunctionMap( c_fs, b_fs, exp_beta_alpha_fs );;

gap> coexp_to_coproduct_adjunction_on_coexp_alpha_beta_fsop := CoexponentialToCoproductAdjunctionMap( b_fsop, c_fsop, coexp_alpha_beta_fsop );;
gap> coexp_to_coproduct_adjunction_on_coexp_beta_alpha_fsop := CoexponentialToCoproductAdjunctionMap( d_fsop, a_fsop, coexp_beta_alpha_fsop );;

# Opposite correspondence on adjunction maps on (co)products

##############################################
#                                            #
# alpha_fs: a -> b                           #
# beta_fs:  c -> d                           #
#                                            #
# alpha_product_beta_fs: a x c -> b x d      #
# beta_product_alpha_fs: c x a -> d x b      #
#                                            #
##############################################
#                                            #
# alpha_fsop: b -> a                         #
# beta_fsop:  d -> c                         #
#                                            #
# alpha_coproduct_beta_fsop : b x d -> a x c #
# beta_coproduct_alpha_fsop : d x b -> c x a #
#                                            #
##############################################

gap> coproduct_to_coexp_adjunction_on_alpha_coproduct_beta_fsop = Opposite( product_to_exp_adjunction_on_alpha_product_beta_fs ); # Coexp( b x d, c ) -> a  ==  op( a -> Exp( c, b x d ) )
true
gap> coproduct_to_coexp_adjunction_on_beta_coproduct_alpha_fsop = Opposite( product_to_exp_adjunction_on_beta_product_alpha_fs ); # Coexp( d x b, a ) -> c  ==  op( c -> Exp( a, d x b ) )
true

# Opposite correspondence on adjunction maps on (co)exps

#########################################################
#                                                       #
#   exp_alpha_beta_fs: Exp( b, c ) -> Exp( a, d )       #
#   exp_beta_alpha_fs: Exp( d, a ) -> Exp( c, b )       #
#                                                       #
#   exp_alpha_beta_fsop: Exp( a, d ) -> Exp( b, c )     #
#   exp_beta_alpha_fsop: Exp( c, b ) -> Exp( d, a )     #
#                                                       #
#########################################################
#                                                       #
# coexp_alpha_beta_fs: Coexp( a, d ) -> Coexp( b, c )   #
# coexp_beta_alpha_fs: Coexp( c, b ) -> Coexp( d, a )   #
#                                                       #
# coexp_alpha_beta_fsop: Coexp( b, c ) -> Coexp( a, d ) #
# coexp_beta_alpha_fsop: Coexp( d, a ) -> Coexp( c, b ) #
#                                                       #
#########################################################

gap> coexp_to_coproduct_adjunction_on_coexp_alpha_beta_fsop = Opposite( exp_to_product_adjunction_on_exp_beta_alpha_fs ); # b -> Coexp( a, d ) x c  ==  op( Exp( d, a ) x c -> b )
true
gap> coexp_to_coproduct_adjunction_on_coexp_beta_alpha_fsop = Opposite( exp_to_product_adjunction_on_exp_alpha_beta_fs ); # d -> Coexp( c, b ) x a  ==  op( Exp( b, c ) x a -> d )
true

#####################################################
# Pre and post (co)composition
#####################################################

gap> precompose_abc_fs := CartesianPreComposeMorphism( a_fs, b_fs, c_fs );;
gap> precompose_cba_fs := CartesianPreComposeMorphism( c_fs, b_fs, a_fs );;

gap> precocompose_abc_fsop := CocartesianPreCoComposeMorphism( a_fsop, b_fsop, c_fsop );;
gap> precocompose_cba_fsop := CocartesianPreCoComposeMorphism( c_fsop, b_fsop, a_fsop );;

gap> postcompose_abc_fs := CartesianPostComposeMorphism( a_fs, b_fs, c_fs );;
gap> postcompose_cba_fs := CartesianPostComposeMorphism( c_fs, b_fs, a_fs );;

gap> postcocompose_abc_fsop := CocartesianPostCoComposeMorphism( a_fsop, b_fsop, c_fsop );;
gap> postcocompose_cba_fsop := CocartesianPostCoComposeMorphism( c_fsop, b_fsop, a_fsop );;

# Opposite correspondence on compositions

gap> precocompose_abc_fsop = Opposite( precompose_cba_fs );
true
gap> precocompose_cba_fsop = Opposite( precompose_abc_fs );
true

gap> postcocompose_abc_fsop = Opposite( postcompose_cba_fs );
true
gap> postcocompose_cba_fsop = Opposite( postcompose_abc_fs );
true

#####################################################
# (Co)CartesianDuals
#####################################################

gap> a_dual_fs := CartesianDualOnObjects( a_fs );;
gap> b_dual_fs := CartesianDualOnObjects( b_fs );;

gap> a_codual_fsop := CocartesianDualOnObjects( a_fsop );;
gap> b_codual_fsop := CocartesianDualOnObjects( b_fsop );;

# CartesianDual on morphisms for finsets

gap> dual_id_a_product_b_fs := CartesianDualOnMorphisms( id_a_product_b_fs );;
gap> dual_id_b_product_a_fs := CartesianDualOnMorphisms( id_b_product_a_fs );;

gap> dual_exp_alpha_beta_fs := CartesianDualOnMorphisms( exp_alpha_beta_fs );;
gap> dual_exp_beta_alpha_fs := CartesianDualOnMorphisms( exp_beta_alpha_fs );;

gap> dual_cart_coev_ab_fs := CartesianDualOnMorphisms( cart_coev_ab_fs );;
gap> dual_cart_coev_ba_fs := CartesianDualOnMorphisms( cart_coev_ba_fs );;

# CocartesianDual on morphisms for opposite of finsets

gap> codual_id_a_coproduct_b_fsop := CocartesianDualOnMorphisms( id_a_coproduct_b_fsop );;
gap> codual_id_b_coproduct_a_fsop := CocartesianDualOnMorphisms( id_b_coproduct_a_fsop );;

gap> codual_coexp_alpha_beta_fsop := CocartesianDualOnMorphisms( coexp_alpha_beta_fsop );;
gap> codual_coexp_beta_alpha_fsop := CocartesianDualOnMorphisms( coexp_beta_alpha_fsop );;

gap> codual_cocart_coev_ab_fsop := CocartesianDualOnMorphisms( cocart_coev_ab_fsop );;
gap> codual_cocart_coev_ba_fsop := CocartesianDualOnMorphisms( cocart_coev_ba_fsop );;

# Opposite correspondence

gap> a_codual_fsop = Opposite( a_dual_fs );
true
gap> b_codual_fsop = Opposite( b_dual_fs );
true

gap> codual_id_a_coproduct_b_fsop = Opposite( dual_id_a_product_b_fs );
true
gap> codual_id_b_coproduct_a_fsop = Opposite( dual_id_b_product_a_fs );
true

gap> codual_coexp_alpha_beta_fsop = Opposite( dual_exp_beta_alpha_fs );
true
gap> codual_coexp_beta_alpha_fsop = Opposite( dual_exp_alpha_beta_fs );
true

gap> codual_cocart_coev_ab_fsop = Opposite( dual_cart_coev_ab_fs );
true
gap> codual_cocart_coev_ba_fsop = Opposite( dual_cart_coev_ba_fs );
true

#####################################################
# Evaluation for (co)dual
#####################################################

gap> cart_ev_for_dual_a_fs := CartesianEvaluationForCartesianDual( a_fs );;
gap> cart_ev_for_dual_b_fs := CartesianEvaluationForCartesianDual( b_fs );;
gap> cart_ev_for_dual_i_fs := CartesianEvaluationForCartesianDual( i_fs );;
gap> cart_ev_for_dual_t_fs := CartesianEvaluationForCartesianDual( t_fs );;

gap> cocart_ev_for_codual_a_fsop := CocartesianEvaluationForCocartesianDual( a_fsop );;
gap> cocart_ev_for_codual_b_fsop := CocartesianEvaluationForCocartesianDual( b_fsop );;
gap> cocart_ev_for_codual_i_fsop := CocartesianEvaluationForCocartesianDual( i_fsop );;
gap> cocart_ev_for_codual_t_fsop := CocartesianEvaluationForCocartesianDual( t_fsop );;

# Opposite correspondence

gap> cocart_ev_for_codual_a_fsop = Opposite( cart_ev_for_dual_a_fs );
true
gap> cocart_ev_for_codual_b_fsop = Opposite( cart_ev_for_dual_b_fs );
true
gap> cocart_ev_for_codual_i_fsop = Opposite( cart_ev_for_dual_t_fs );
true
gap> cocart_ev_for_codual_t_fsop = Opposite( cart_ev_for_dual_i_fs );
true

gap> cocart_ev_for_codual_a_fsop = Opposite( cart_ev_for_dual_b_fs );
false
gap> cocart_ev_for_codual_b_fsop = Opposite( cart_ev_for_dual_a_fs );
false
gap> cocart_ev_for_codual_i_fsop = Opposite( cart_ev_for_dual_i_fs );
false
gap> cocart_ev_for_codual_t_fsop = Opposite( cart_ev_for_dual_t_fs );
false

#####################################################
# (Co)CartesianBidual
#####################################################

gap> morphism_to_cart_bidual_c_fs := MorphismToCartesianBidual( c_fs );;
gap> morphism_to_cart_bidual_d_fs := MorphismToCartesianBidual( d_fs );;

gap> morphism_from_cocart_bidual_c_fsop := MorphismFromCocartesianBidual( c_fsop );;
gap> morphism_from_cocart_bidual_d_fsop := MorphismFromCocartesianBidual( d_fsop );;

# Opposite correspondence

gap> morphism_from_cocart_bidual_c_fsop = Opposite( morphism_to_cart_bidual_c_fs );
true
gap> morphism_from_cocart_bidual_d_fsop = Opposite( morphism_to_cart_bidual_d_fs );
true

gap> morphism_from_cocart_bidual_c_fsop = Opposite( morphism_to_cart_bidual_d_fs );
false
gap> morphism_from_cocart_bidual_d_fsop = Opposite( morphism_to_cart_bidual_c_fs );
false

#############################################################
# (Co)Product and (co)exp compatibility
#############################################################

gap> product_to_exp_compatibility_abcd_fs := DirectProductExponentialCompatibilityMorphism( [ a_fs, b_fs, c_fs, d_fs ] );; # Exp( a, b ) x Exp( c, d ) -> Exp( a x c, b x d )
gap> product_to_exp_compatibility_cadb_fs := DirectProductExponentialCompatibilityMorphism( [ c_fs, a_fs, d_fs, b_fs ] );; # Exp( c, a ) x Exp( d, b ) -> Exp( c x d, a x b )

gap> coexp_to_coproduct_compatibility_abcd_fsop := CoexponentialCoproductCompatibilityMorphism( [ a_fsop, b_fsop, c_fsop, d_fsop ] );; # Coexp( a x b, c x d ) -> Coexp( a, c ) x Coexp( b, d )
gap> coexp_to_coproduct_compatibility_bdac_fsop := CoexponentialCoproductCompatibilityMorphism( [ b_fsop, d_fsop, a_fsop, c_fsop ] );; # Coexp( b x d, a x c ) -> Coexp( b, a ) x Coexp( d, c )

# Opposite correspondence

gap> coexp_to_coproduct_compatibility_abcd_fsop = Opposite( product_to_exp_compatibility_cadb_fs ); # Coexp( a x b, c x d ) -> Coexp( a, c ) x Coexp( b, d )  ==  op( Exp( c, a ) x Exp( d, b ) -> Exp( c x d, a x b ) )
true
gap> coexp_to_coproduct_compatibility_bdac_fsop = Opposite( product_to_exp_compatibility_abcd_fs ); # Coexp( b x d, a x c ) -> Coexp( b, a ) x Coexp( d, c )  ==  op( Exp( a, b ) x Exp( c, d ) -> Exp( a x c, b x d ) )
true

gap> coexp_to_coproduct_compatibility_abcd_fsop = Opposite( product_to_exp_compatibility_abcd_fs ); # Coexp( a x b, c x d ) -> Coexp( a, c ) x Coexp( b, d )  =/=  op( Exp( a, b ) x Exp( c, d ) -> Exp( a x c, b x d ) )
false
gap> coexp_to_coproduct_compatibility_bdac_fsop = Opposite( product_to_exp_compatibility_cadb_fs ); # Coexp( b x d, a x c ) -> Coexp( b, a ) x Coexp( d, c )  =/=  op( Exp( c, a ) x Exp( d, b ) -> Exp( c x d, a x b ) )
false

#########################################################
# (Co)Cartesian compatibility
#########################################################

# (Co)CartesianDuality compatibility

gap> direct_product_cart_duality_compatibility_ab_fs := DirectProductCartesianDualityCompatibilityMorphism( a_fs, b_fs );; # a^v x b^v -> (a x b)^v
gap> direct_product_cart_duality_compatibility_ba_fs := DirectProductCartesianDualityCompatibilityMorphism( b_fs, a_fs );; # b^v x a^v -> (b x a)^v
gap> direct_product_cart_duality_compatibility_cd_fs := DirectProductCartesianDualityCompatibilityMorphism( c_fs, d_fs );; # c^v x d^v -> (c x d)^v
gap> direct_product_cart_duality_compatibility_dc_fs := DirectProductCartesianDualityCompatibilityMorphism( d_fs, c_fs );; # d^v x c^v -> (d x c)^v

gap> cocart_duality_coproduct_compatibility_ab_fsop := CocartesianDualityCoproductCompatibilityMorphism( a_fsop, b_fsop );; # (a x b)_v -> a_v x b_v
gap> cocart_duality_coproduct_compatibility_ba_fsop := CocartesianDualityCoproductCompatibilityMorphism( b_fsop, a_fsop );; # (b x a)_v -> b_v x a_v
gap> cocart_duality_coproduct_compatibility_cd_fsop := CocartesianDualityCoproductCompatibilityMorphism( c_fsop, d_fsop );; # (c x d)_v -> c_v x d_v
gap> cocart_duality_coproduct_compatibility_dc_fsop := CocartesianDualityCoproductCompatibilityMorphism( d_fsop, c_fsop );; # (d x c)_v -> d_v x c_v

# Opposite correspondence on (co)duality compatibility

gap> cocart_duality_coproduct_compatibility_ab_fsop = Opposite( direct_product_cart_duality_compatibility_ab_fs );
true
gap> cocart_duality_coproduct_compatibility_ba_fsop = Opposite( direct_product_cart_duality_compatibility_ba_fs );
true
gap> cocart_duality_coproduct_compatibility_cd_fsop = Opposite( direct_product_cart_duality_compatibility_cd_fs );
true
gap> cocart_duality_coproduct_compatibility_dc_fsop = Opposite( direct_product_cart_duality_compatibility_dc_fs );
true

gap> cocart_duality_coproduct_compatibility_ba_fsop = Opposite( direct_product_cart_duality_compatibility_cd_fs );
false
gap> cocart_duality_coproduct_compatibility_ba_fsop = Opposite( direct_product_cart_duality_compatibility_dc_fs );
false
gap> cocart_duality_coproduct_compatibility_dc_fsop = Opposite( direct_product_cart_duality_compatibility_ab_fs );
false
gap> cocart_duality_coproduct_compatibility_dc_fsop = Opposite( direct_product_cart_duality_compatibility_ba_fs );
false

#########################################################
# Morphism from direct product to exponential 
#########################################################

gap> morphism_from_direct_product_to_exp_ab_fs := MorphismFromDirectProductToExponential( a_fs, b_fs );;
gap> morphism_from_direct_product_to_exp_ba_fs := MorphismFromDirectProductToExponential( b_fs, a_fs );;
gap> morphism_from_direct_product_to_exp_cd_fs := MorphismFromDirectProductToExponential( c_fs, d_fs );;
gap> morphism_from_direct_product_to_exp_dc_fs := MorphismFromDirectProductToExponential( d_fs, c_fs );;

gap> morphism_from_coexp_to_coproduct_ab_fsop := MorphismFromCoexponentialToCoproduct( a_fsop, b_fsop );;
gap> morphism_from_coexp_to_coproduct_ba_fsop := MorphismFromCoexponentialToCoproduct( b_fsop, a_fsop );;
gap> morphism_from_coexp_to_coproduct_cd_fsop := MorphismFromCoexponentialToCoproduct( c_fsop, d_fsop );;
gap> morphism_from_coexp_to_coproduct_dc_fsop := MorphismFromCoexponentialToCoproduct( d_fsop, c_fsop );;

# Opposite correspondence

gap> morphism_from_coexp_to_coproduct_ab_fsop = Opposite( morphism_from_direct_product_to_exp_ba_fs );
true
gap> morphism_from_coexp_to_coproduct_ba_fsop = Opposite( morphism_from_direct_product_to_exp_ab_fs );
true
gap> morphism_from_coexp_to_coproduct_cd_fsop = Opposite( morphism_from_direct_product_to_exp_dc_fs );
true
gap> morphism_from_coexp_to_coproduct_dc_fsop = Opposite( morphism_from_direct_product_to_exp_cd_fs );
true

gap> morphism_from_coexp_to_coproduct_ab_fsop = Opposite( morphism_from_direct_product_to_exp_cd_fs );
false
gap> morphism_from_coexp_to_coproduct_ab_fsop = Opposite( morphism_from_direct_product_to_exp_dc_fs );
false

gap> morphism_from_coexp_to_coproduct_cd_fsop = Opposite( morphism_from_direct_product_to_exp_ab_fs );
false
gap> morphism_from_coexp_to_coproduct_cd_fsop = Opposite( morphism_from_direct_product_to_exp_ba_fs );
false

#########################################################
# Isomorphisms between dual and exp
#########################################################

gap> isomorphism_from_dual_to_exp_a_fs := IsomorphismFromCartesianDualToExponential( a_fs );;
gap> isomorphism_from_dual_to_exp_b_fs := IsomorphismFromCartesianDualToExponential( b_fs );;
gap> isomorphism_from_dual_to_exp_c_fs := IsomorphismFromCartesianDualToExponential( c_fs );;
gap> isomorphism_from_dual_to_exp_d_fs := IsomorphismFromCartesianDualToExponential( d_fs );;

gap> isomorphism_from_exp_to_dual_a_fs := IsomorphismFromExponentialToCartesianDual( a_fs );;
gap> isomorphism_from_exp_to_dual_b_fs := IsomorphismFromExponentialToCartesianDual( b_fs );;
gap> isomorphism_from_exp_to_dual_c_fs := IsomorphismFromExponentialToCartesianDual( c_fs );;
gap> isomorphism_from_exp_to_dual_d_fs := IsomorphismFromExponentialToCartesianDual( d_fs );;

gap> isomorphism_from_codual_to_coexp_a_fsop := IsomorphismFromCocartesianDualToCoexponential( a_fsop );;
gap> isomorphism_from_codual_to_coexp_b_fsop := IsomorphismFromCocartesianDualToCoexponential( b_fsop );;
gap> isomorphism_from_codual_to_coexp_c_fsop := IsomorphismFromCocartesianDualToCoexponential( c_fsop );;
gap> isomorphism_from_codual_to_coexp_d_fsop := IsomorphismFromCocartesianDualToCoexponential( d_fsop );;

gap> isomorphism_from_coexp_to_codual_a_fsop := IsomorphismFromCoexponentialToCocartesianDual( a_fsop );;
gap> isomorphism_from_coexp_to_codual_b_fsop := IsomorphismFromCoexponentialToCocartesianDual( b_fsop );;
gap> isomorphism_from_coexp_to_codual_c_fsop := IsomorphismFromCoexponentialToCocartesianDual( c_fsop );;
gap> isomorphism_from_coexp_to_codual_d_fsop := IsomorphismFromCoexponentialToCocartesianDual( d_fsop );;

# Opposite correspondence

gap> isomorphism_from_codual_to_coexp_a_fsop = Opposite( isomorphism_from_exp_to_dual_a_fs );
true
gap> isomorphism_from_codual_to_coexp_b_fsop = Opposite( isomorphism_from_exp_to_dual_b_fs );
true
gap> isomorphism_from_codual_to_coexp_c_fsop = Opposite( isomorphism_from_exp_to_dual_c_fs );
true
gap> isomorphism_from_codual_to_coexp_d_fsop = Opposite( isomorphism_from_exp_to_dual_d_fs );
true

gap> isomorphism_from_coexp_to_codual_a_fsop = Opposite( isomorphism_from_dual_to_exp_a_fs );
true
gap> isomorphism_from_coexp_to_codual_b_fsop = Opposite( isomorphism_from_dual_to_exp_b_fs );
true
gap> isomorphism_from_coexp_to_codual_c_fsop = Opposite( isomorphism_from_dual_to_exp_c_fs );
true
gap> isomorphism_from_coexp_to_codual_d_fsop = Opposite( isomorphism_from_dual_to_exp_d_fs );
true

gap> isomorphism_from_codual_to_coexp_c_fsop = Opposite( isomorphism_from_exp_to_dual_a_fs );
false
gap> isomorphism_from_codual_to_coexp_c_fsop = Opposite( isomorphism_from_exp_to_dual_b_fs );
false
gap> isomorphism_from_codual_to_coexp_c_fsop = Opposite( isomorphism_from_exp_to_dual_d_fs );
false

gap> isomorphism_from_coexp_to_codual_d_fsop = Opposite( isomorphism_from_dual_to_exp_a_fs );
false
gap> isomorphism_from_coexp_to_codual_d_fsop = Opposite( isomorphism_from_dual_to_exp_b_fs );
false
gap> isomorphism_from_coexp_to_codual_d_fsop = Opposite( isomorphism_from_dual_to_exp_c_fs );
false

#########################################################
# Universal property of dual
#########################################################

# Morphisms

gap> ab_to_t_fs := UniversalMorphismIntoTerminalObject( a_product_b_fs );;
gap> cd_to_t_fs := UniversalMorphismIntoTerminalObject( c_product_d_fs );;

gap> i_to_ab_fs := UniversalMorphismFromInitialObject( a_product_b_fs );;
gap> i_to_cd_fs := UniversalMorphismFromInitialObject( c_product_d_fs );;

gap> ab_to_t_fsop := UniversalMorphismIntoTerminalObject( a_coproduct_b_fsop );;
gap> cd_to_t_fsop := UniversalMorphismIntoTerminalObject( c_coproduct_d_fsop );;

gap> t_to_ab_fsop := UniversalMorphismFromInitialObject( a_coproduct_b_fsop );;
gap> t_to_cd_fsop := UniversalMorphismFromInitialObject( c_coproduct_d_fsop );;

# Universal property

gap> universal_property_of_cart_dual_ab_to_t_fs := UniversalPropertyOfCartesianDual( a_fs, b_fs, ab_to_t_fs );;
gap> universal_property_of_cart_dual_cd_to_t_fs := UniversalPropertyOfCartesianDual( c_fs, d_fs, cd_to_t_fs );;

gap> universal_property_of_cocart_dual_t_to_ab_fsop := UniversalPropertyOfCocartesianDual( a_fsop, b_fsop, t_to_ab_fsop );;
gap> universal_property_of_cocart_dual_t_to_cd_fsop := UniversalPropertyOfCocartesianDual( c_fsop, d_fsop, t_to_cd_fsop);;

# Opposite correspondence

gap> universal_property_of_cocart_dual_t_to_ab_fsop = Opposite( universal_property_of_cart_dual_ab_to_t_fs );
true
gap> universal_property_of_cocart_dual_t_to_cd_fsop = Opposite( universal_property_of_cart_dual_cd_to_t_fs );
true

gap> universal_property_of_cocart_dual_t_to_ab_fsop = Opposite( universal_property_of_cart_dual_cd_to_t_fs );
false
gap> universal_property_of_cocart_dual_t_to_cd_fsop = Opposite( universal_property_of_cart_dual_ab_to_t_fs );
false

#########################################################
# Lambdas
#########################################################

gap> cart_lambda_intro_a_to_b_fs := CartesianLambdaIntroduction( alpha_fs );;
gap> cart_lambda_intro_b_to_c_fs := CartesianLambdaIntroduction( gamma_fs );;
gap> cart_lambda_intro_c_to_d_fs := CartesianLambdaIntroduction( beta_fs );;

gap> cocart_lambda_intro_b_to_a_fsop := CocartesianLambdaIntroduction( alpha_fsop );;
gap> cocart_lambda_intro_c_to_b_fsop := CocartesianLambdaIntroduction( gamma_fsop );;
gap> cocart_lambda_intro_d_to_c_fsop := CocartesianLambdaIntroduction( beta_fsop );;

gap> cart_lambda_elim_t_to_exp_ab_fs := CartesianLambdaElimination( a_fs, b_fs, cart_lambda_intro_a_to_b_fs );;
gap> cart_lambda_elim_t_to_exp_bc_fs := CartesianLambdaElimination( b_fs, c_fs, cart_lambda_intro_b_to_c_fs );;
gap> cart_lambda_elim_t_to_exp_cd_fs := CartesianLambdaElimination( c_fs, d_fs, cart_lambda_intro_c_to_d_fs );;

gap> cocart_lambda_elim_coexp_ba_to_t_fsop := CocartesianLambdaElimination( b_fsop, a_fsop, cocart_lambda_intro_b_to_a_fsop );;
gap> cocart_lambda_elim_coexp_cb_to_t_fsop := CocartesianLambdaElimination( c_fsop, b_fsop, cocart_lambda_intro_c_to_b_fsop );;
gap> cocart_lambda_elim_coexp_dc_to_t_fsop := CocartesianLambdaElimination( d_fsop, c_fsop, cocart_lambda_intro_d_to_c_fsop );;

# Opposite correspondence

gap> cocart_lambda_intro_b_to_a_fsop = Opposite( cart_lambda_intro_a_to_b_fs );
true
gap> cocart_lambda_intro_c_to_b_fsop = Opposite( cart_lambda_intro_b_to_c_fs );
true
gap> cocart_lambda_intro_d_to_c_fsop = Opposite( cart_lambda_intro_c_to_d_fs );
true

gap> cocart_lambda_elim_coexp_ba_to_t_fsop = Opposite( cart_lambda_elim_t_to_exp_ab_fs );
true
gap> cocart_lambda_elim_coexp_cb_to_t_fsop = Opposite( cart_lambda_elim_t_to_exp_bc_fs );
true
gap> cocart_lambda_elim_coexp_dc_to_t_fsop = Opposite( cart_lambda_elim_t_to_exp_cd_fs );
true

gap> cocart_lambda_intro_d_to_c_fsop = Opposite( cart_lambda_intro_a_to_b_fs );
false
gap> cocart_lambda_intro_d_to_c_fsop = Opposite( cart_lambda_intro_b_to_c_fs );
false

gap> cocart_lambda_elim_coexp_dc_to_t_fsop = Opposite( cart_lambda_elim_t_to_exp_ab_fs );
false
gap> cocart_lambda_elim_coexp_dc_to_t_fsop = Opposite( cart_lambda_elim_t_to_exp_bc_fs );
false

#########################################################
# Isomorphisms between object and (co)exponential
#########################################################

gap> isomorphism_from_a_to_exp_fs := IsomorphismFromObjectToExponential( a_fs );;
gap> isomorphism_from_b_to_exp_fs := IsomorphismFromObjectToExponential( b_fs );;
gap> isomorphism_from_c_to_exp_fs := IsomorphismFromObjectToExponential( c_fs );;
gap> isomorphism_from_d_to_exp_fs := IsomorphismFromObjectToExponential( d_fs );;
gap> isomorphism_from_i_to_exp_fs := IsomorphismFromObjectToExponential( i_fs );;
gap> isomorphism_from_t_to_exp_fs := IsomorphismFromObjectToExponential( t_fs );;

gap> isomorphism_from_exp_to_a_fs := IsomorphismFromExponentialToObject( a_fs );;
gap> isomorphism_from_exp_to_b_fs := IsomorphismFromExponentialToObject( b_fs );;
gap> isomorphism_from_exp_to_c_fs := IsomorphismFromExponentialToObject( c_fs );;
gap> isomorphism_from_exp_to_d_fs := IsomorphismFromExponentialToObject( d_fs );;
gap> isomorphism_from_exp_to_i_fs := IsomorphismFromExponentialToObject( i_fs );;
gap> isomorphism_from_exp_to_t_fs := IsomorphismFromExponentialToObject( t_fs );;

gap> isomorphism_from_a_to_coexp_fsop := IsomorphismFromObjectToCoexponential( a_fsop );;
gap> isomorphism_from_b_to_coexp_fsop := IsomorphismFromObjectToCoexponential( b_fsop );;
gap> isomorphism_from_c_to_coexp_fsop := IsomorphismFromObjectToCoexponential( c_fsop );;
gap> isomorphism_from_d_to_coexp_fsop := IsomorphismFromObjectToCoexponential( d_fsop );;
gap> isomorphism_from_i_to_coexp_fsop := IsomorphismFromObjectToCoexponential( i_fsop );;
gap> isomorphism_from_t_to_coexp_fsop := IsomorphismFromObjectToCoexponential( t_fsop );;

gap> isomorphism_from_coexp_to_a_fsop := IsomorphismFromCoexponentialToObject( a_fsop );;
gap> isomorphism_from_coexp_to_b_fsop := IsomorphismFromCoexponentialToObject( b_fsop );;
gap> isomorphism_from_coexp_to_c_fsop := IsomorphismFromCoexponentialToObject( c_fsop) ;;
gap> isomorphism_from_coexp_to_d_fsop := IsomorphismFromCoexponentialToObject( d_fsop );;
gap> isomorphism_from_coexp_to_i_fsop := IsomorphismFromCoexponentialToObject( i_fsop );;
gap> isomorphism_from_coexp_to_t_fsop := IsomorphismFromCoexponentialToObject( t_fsop );;

# Opposite correspondence

gap> isomorphism_from_a_to_coexp_fsop = Opposite( isomorphism_from_exp_to_a_fs );
true
gap> isomorphism_from_b_to_coexp_fsop = Opposite( isomorphism_from_exp_to_b_fs );
true
gap> isomorphism_from_c_to_coexp_fsop = Opposite( isomorphism_from_exp_to_c_fs );
true
gap> isomorphism_from_d_to_coexp_fsop = Opposite( isomorphism_from_exp_to_d_fs );
true
gap> isomorphism_from_i_to_coexp_fsop = Opposite( isomorphism_from_exp_to_t_fs );
true
gap> isomorphism_from_t_to_coexp_fsop = Opposite( isomorphism_from_exp_to_i_fs );
true

gap> isomorphism_from_coexp_to_a_fsop = Opposite( isomorphism_from_a_to_exp_fs );
true
gap> isomorphism_from_coexp_to_b_fsop = Opposite( isomorphism_from_b_to_exp_fs );
true
gap> isomorphism_from_coexp_to_c_fsop = Opposite( isomorphism_from_c_to_exp_fs );
true
gap> isomorphism_from_coexp_to_d_fsop = Opposite( isomorphism_from_d_to_exp_fs );
true
gap> isomorphism_from_coexp_to_i_fsop = Opposite( isomorphism_from_t_to_exp_fs );
true
gap> isomorphism_from_coexp_to_t_fsop = Opposite( isomorphism_from_i_to_exp_fs );
true

gap> isomorphism_from_c_to_coexp_fsop = Opposite( isomorphism_from_exp_to_a_fs );
false
gap> isomorphism_from_c_to_coexp_fsop = Opposite( isomorphism_from_exp_to_b_fs );
false
gap> isomorphism_from_c_to_coexp_fsop = Opposite( isomorphism_from_exp_to_d_fs );
false
gap> isomorphism_from_c_to_coexp_fsop = Opposite( isomorphism_from_exp_to_i_fs );
false

gap> isomorphism_from_coexp_to_d_fsop = Opposite( isomorphism_from_a_to_exp_fs );
false
gap> isomorphism_from_coexp_to_d_fsop = Opposite( isomorphism_from_b_to_exp_fs );
false
gap> isomorphism_from_coexp_to_d_fsop = Opposite( isomorphism_from_c_to_exp_fs );
false
gap> isomorphism_from_coexp_to_d_fsop = Opposite( isomorphism_from_t_to_exp_fs );
false

gap> STOP_TEST("CartesianClosedOpposite.tst", 1);
