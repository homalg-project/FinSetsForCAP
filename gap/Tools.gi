# SPDX-License-Identifier: GPL-2.0-or-later
# FinSetsForCAP: The elementary topos of (skeletal) finite sets
#
# Implementations
#

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
