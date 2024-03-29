##################################################################################
# Compare FinSets and SkeletalFinSets
##################################################################################

gap> START_TEST( "compare" );

#
gap> LoadPackage( "FinSets", false );
true

#
gap> T := TerminalObject( SkeletalFinSets );;
gap> M := FinSet( [ 0 .. 1 ] );;
gap> N := FinSet( [ 0 .. 2 ] );;
gap> K := FinSet( [ 0 .. 3 ] );;

#
gap> t := TerminalObject( SkeletalFinSets );;
gap> m := FinSet( 2 );;
gap> n := FinSet( 3 );;
gap> k := FinSet( 4 );;

#
gap> Display( List( AsList( ProjectionInFactorOfDirectProduct( [ M, N, K ], 1 ) ), i -> i[2] ) );
[ 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1 ]

#
gap> Display( AsList( ProjectionInFactorOfDirectProduct( [ m, n, k ], 1 ) ) );
[ 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1 ]

#
gap> Display( List( AsList( ProjectionInFactorOfDirectProduct( [ M, N, K ], 2 ) ), i -> i[2] ) );
[ 0, 0, 1, 1, 2, 2, 0, 0, 1, 1, 2, 2, 0, 0, 1, 1, 2, 2, 0, 0, 1, 1, 2, 2 ]

#
gap> Display( AsList( ProjectionInFactorOfDirectProduct( [ m, n, k ], 2 ) ) );
[ 0, 0, 1, 1, 2, 2, 0, 0, 1, 1, 2, 2, 0, 0, 1, 1, 2, 2, 0, 0, 1, 1, 2, 2 ]

#
gap> Display( List( AsList( ProjectionInFactorOfDirectProduct( [ M, N, K ], 3 ) ), i -> i[2] ) );
[ 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3 ]

#
gap> Display( AsList( ProjectionInFactorOfDirectProduct( [ m, n, k ], 3 ) ) );
[ 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3 ]

#
gap> Ev := List( AsList( CartesianLeftEvaluationMorphism( N, K ) ), i -> i[2] );;
gap> Display( Ev );
[ 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3,\
 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3,\
 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3,\
 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3,\
 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3,\
 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3,\
 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3,\
 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3,\
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,\
 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,\
 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,\
 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3 ]

#
gap> ev := AsList( CartesianLeftEvaluationMorphism( n, k ) );;

#
gap> ev = Ev;
true

#
gap> Coev_set := CartesianLeftCoevaluationMorphism( N, M );; ## K, M
gap> Coev := List( AsList( Coev_set ), i -> -1 + Position( AsList( Range( Coev_set ) ), i[2] ) );;
gap> Display( Coev );
[ 156, 199 ]

#
gap> coev := AsList( CartesianLeftCoevaluationMorphism( n, m ) );; ## k, m
gap> Display( coev );
[ 156, 199 ]

#
gap> STOP_TEST( "compare" );
