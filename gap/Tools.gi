# SPDX-License-Identifier: GPL-2.0-or-later
# FinSetsForCAP: The (skeletal) elementary topos of finite sets
#
# Implementations
#

#= comment for Julia

##
InstallMethod( BoolToBigInt,
        [ IsBool ],
        
  function ( b )
    
    if b = true then
        return BigInt( 1 );
    else
        return BigInt( 0 );
    fi;
    
end );

# =#

## Sum( [ 0 .. n - 1 ], i -> q^i );
InstallMethod( GeometricSum,
        [ IsBigInt, IsBigInt ],
  function ( q, n )
    
    if q = 1 then
        return n;
    fi;
    
    return QUO_INT( q ^ n - 1, q - 1 );
    
end );

## Sum( [ 1 .. n - 1 ], i -> i * q^(i-1) )
InstallMethod( GeometricSumDiff1,
        [ IsBigInt, IsBigInt ],
  function ( q, n )

    if n = 0 then
        return BigInt( 0 );
    elif q = 1 then
        return Binomial( n, 2 );
    fi;
    
    return QUO_INT( 1 + ((n - 1) * q - n) * q ^ (n - 1), (q - 1) ^ 2 );
    
end );

## ProjectionInFactorOfDirectProduct( [ a, b ], 1 )
InstallMethod( RemIntWithDomain,
        [ IsBigInt, IsObject, IsBigInt ],
        ## FIXME: replace IsObject -> IsBigInt
        ## The line Product( List( D{[ 1 .. k - 1 ]}, Length ) ) in AddProjectionInFactorOfDirectProductWithGivenDirectProduct
        ## produces during *runtime* an empty list and Product( [ ] ) in CAP.jl evaluates it to 1 and not BigInt( 1 )
        
  function ( number, a, ab )
    
    Assert( 0, number < ab );
    
    return RemInt( number, a );
    
end );

## ProjectionInFactorOfDirectProduct( [ a, b ], 2 )
InstallMethod( QuoIntWithDomain,
        [ IsBigInt, IsObject, IsBigInt ],
        ## FIXME: replace IsObject -> IsBigInt
        ## The line Product( List( D{[ 1 .. k - 1 ]}, Length ) ) in AddProjectionInFactorOfDirectProductWithGivenDirectProduct
        ## produces during *runtime* an empty list and Product( [ ] ) in CAP.jl evaluates it to 1 and not BigInt( 1 )
        
  function ( number, a, ab )
    
    Assert( 0, number < ab );
    
    return QuoInt( number, a );
    
end );

##
InstallMethod( DivIntWithGivenQuotient,
        [ IsBigInt, IsObject, IsBigInt ],
        ## FIXME: replace IsObject -> IsBigInt
        ## The line Product( List( D{[ 1 .. k - 1 ]}, Length ) ) in AddProjectionInFactorOfDirectProductWithGivenDirectProduct
        ## produces during *runtime* an empty list and Product( [ ] ) in CAP.jl evaluates it to 1 and not BigInt( 1 )
        
  function ( number, d, q )
    
    Assert( 0, d * q = number );
    
    return q;
    
end );

## CartesianLambdaElimination
InstallMethod( DigitInPositionalNotation,
        [ IsBigInt, IsBigInt, IsBigInt, IsBigInt ],
        
  function ( number, index, length, base )
    
    Assert( 0, index < length );
    
    return RemInt( QuoInt( number, base ^ index ), base );
    
end );
