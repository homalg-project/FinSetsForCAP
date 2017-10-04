##
AddIsWellDefinedForObjects( SkeletalGSets,
  function( N )
    local ToM, V, B, C;

    ToM:= TableOfMarks( UnderlyingGroup( N ) );

    ToM:= MatTom( ToM );

    V := VectorSpace( Rationals, ToM );

    B := Basis( V, ToM );

    C := Coefficients( B, AsList( N ) );

    return ForAll( C, a -> a >= 0 and IsInt( a ) );

end );

AddIsWellDefinedForMorphisms( SkeletalGSets,
  function( mor )
    local S, T, rel;

    S := Source( mor );

    T := Range( mor );

    if not UnderlyingGroup( S ) = UnderlyingGroup( T ) then 
	return false;
    fi;
    
    rel := AsList( mor );
    
    if not AsList( S )[ 1 ] = Length( rel ) then
	return false;
    fi;
     
    if not ForAll( rel, a -> a <= AsList( T )[ 1 ] and IsPosInt( a ) ) then
	return false;
    fi;

    if not ForAll( UnderlyingGroup( S ), g -> ForAll( Set( S ), x -> [ Set( x[ 1 ] * g ), x[ 2 ] ]  in Set( S ) ) ) then
	return false;
    fi;

    if not ForAll( Set( S ), x -> ForAll( UnderlyingGroup( S ), g -> mor( Position( Set( S ), [ Set( x[ 1 ] * g ), x[ 2 ] ] ) ) = [ Set( mor( Position( Set( S ), x ) )[ 1 ] * g ), x[ 2 ] ] ) ) then
	return false;
    fi;

    return true;
    
end );
