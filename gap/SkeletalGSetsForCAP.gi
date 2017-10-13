#
# SkeletalGSetsForCAP: The skeletal category of G sets
#
# Implementations
#



#! BindGlobal( "SkeletalGSets", CreateCapCategory( "SkeletalGSets" ) );

##
InstallMethod( GSet,
        "for a nonnegative integer",
        [ IsGroup, IsList ],
        
  function( G, L )
    local Omega;
    
    Omega := rec( );
    
    ObjectifyWithAttributes( Omega, TheTypeOfSkeletalGSets,
            AsList,  L, 
            UnderlyingGroup, G );
    
    Add( SkeletalGSets( G ), Omega );
    
    return Omega;
    
end );

##
InstallMethod( SkeletalGSets,
               [ IsGroup ],
               
  function( group )
    local SkeletalGSets, k;
    
    SkeletalGSets := CreateCapCategory( "Skeletal Category of -Sets" );  #! TODOOOOO
    
    SkeletalGSets!.group_for_category := group;
    
    k := Size( MatTom( TableOfMarks( group ) ) );


##
InstallMethod( TableOfMarks,
        "for a finite skeletal G-set",
        [ IsSkeletalGSetRep ],
        
  function( Omega )
    
    return TableOfMarks( UnderlyingGroup( Omega ) );
    
end );

##
InstallMethod( NrConjugacyClassesOfSubgroups,
        "for a finite skeletal G-set",
        [ IsSkeletalGSetRep ],
        
  function( Omega )
    
    return Length( MatTom( TableOfMarks( Omega ) ) );
    
end );

##
AddIsWellDefinedForObjects( SkeletalGSets,
  function( Omega )
    local L;
    
    L := AsList( Omega );
    
    if not Length( L ) = NrConjugacyClassesOfSubgroups( Omega ) then
        return false;
    fi;
    
    if not ForAll( L, a -> IsInt( a ) and a >= 0 ) then
        return false;
    fi;
    
    return true;
    
end );

##
AddIsEqualForObjects( SkeletalGSets,
  function( Omega1, Omega2 )
    
    return UnderlyingGroup( Omega1 ) = UnderlyingGroup( Omega2 ) and AsList( Omega1 ) = AsList( Omega2 );
    
end );


## Morphisms

##
InstallMethod( MapOfGSets,
        "for two CAP skeletal G sets and a list",
        [ IsSkeletalGSetRep, IsList, IsSkeletalGSetRep ],
        
  function( S, I, T )
    local map;
    
    map := rec( );
    
    ObjectifyWithAttributes( map, TheTypeOfMapsOfSkeletalGSets,
        AsList, I,
        Source, S,
        Range, T 
    );
    
    Add( SkeletalGSets, map );
     
    return map;
    
end );

##
AddIsWellDefinedForMorphisms( SkeletalGSets,
  function( mor )
    local S, T, G, img, tom, k, s, t;

    S := Source( mor );

    T := Range( mor );

    G := UnderlyingGroup( S );
    
    if not G = UnderlyingGroup( T ) then 
        return false;
    fi;
    
    img := AsList( mor );
    
    k := NrConjugacyClassesOfSubgroups( S );
    
    if not Length( img ) = k then
        return Error( "1\n");
    fi;
    
    tom := MatTom( TableOfMarks( G ) );
    
    s := AsList( S );
    t := AsList( T );

    if not ForAll( [ 1 .. k ], i -> IsList( img[i] ) and Length( img[i] ) = s[i] and
        ForAll( img[i], function( e )
                            local r, g, j;
                            
                            if not ( IsList( e ) and Length( e ) = 3 ) then
                                return Error( "2\n" );
                            fi;
                            
                            r := e[1];
                            g := e[2];
                            j := e[3];
                            
                            # j has to be the index of a subgroup of G, i.e. an integer between 1 and k
                            # r has to be the index of a copy of U_j
                            # g has to be an element of G
                            # U_i has to be a subgroup of U_j up to conjugation, which can be read off the table of marks
                            
                            if not ( IsPosInt( j ) and j <= k and IsPosInt( r ) and r <= t[j] and g in G and tom[j][i] > 0 ) then
                                return Error( "3\n");
                            fi;
                            return true;
                        end
              )
                 ) then
        return Error( "4\n" );
    fi;
    
    return true;
    
end );

##
InstallMethod( CallFuncList,
        "for a CAP map of skeletal G-sets and a list",
    [ IsSkeletalGSetMapRep, IsList ],
        
  function( phi, L )
    local x;
    
    x := L[ 1 ];
    
    if x = fail then
        if HasIsWellDefined( phi ) then
            if IsWellDefined( phi ) then
                Error( "the element ", x, " is not in the source of the map\n" );
            else
                if not x in Source( phi ) then
                    Error( "the element ", x, " is not in the source of the map\n" );
                else
                    Error( "the element ", x, " is in the source of the map, however, the map is not well-defined\n" );
                fi;
            fi;
        else
            Error( "please check if the map is well-defined\n" );
        fi;
    fi;
    
    return AsList( phi )[ x ];
    
end );


##
AddIsEqualForMorphisms( SkeletalGSets,
  function( mor1, mor2 )
    
    return AsList( mor1 ) = AsList( mor2 );
    
end );

##
AddIdentityMorphism( SkeletalGSets,
  function( Omega )
    local L, M, G, k, i, C, l;

    L := [];

    M := AsList( Omega );  
    G := UnderlyingGroup( Omega );

    k := Length( M );

    for i in [ 1 .. k ] do 
        C := [];
        for l in [ 1 .. M[ i ] ] do
            Add( C, [ l, Identity( G ), i ] );
        od;
        Add( L, C );
    od;

    return MapOfGSets( Omega, L, Omega );
    
end );

##
AddPreCompose( SkeletalGSets,
  function( map_pre, map_post )
    local cmp, S, M, L_pre, L_post, k, i, C, l, r, img_pre, g, j, img_post;

    if IsWellDefined( map_pre ) = false or IsWellDefined( map_post ) = false then
        Error( "Check if the maps are well defined\n" );
    fi;

    cmp := [];

    S := Source( map_pre );

    M := AsList( S );  

    L_pre := AsList( map_pre );
    L_post := AsList( map_post );

    k := Length( M );

    for i in [ 1 .. k ] do 
        C := [];
        for l in [ 1 .. M[ i ] ] do
            img_pre := L_pre[ i ][ l ];
            r := img_pre[ 1 ];
            g := img_pre[ 2 ];
            j := img_pre[ 3 ];
            img_post := L_post[ j ][ r ];
            Add( C, [ img_post[ 1 ], img_post[ 2 ] * g , img_post[ 3 ] ] );
        od;
        Add( cmp, C );
    od;

    return MapOfGSets( S, cmp, Range( map_post ) );
    
end );

## Limits
##
AddTerminalObject( SkeletalGSets,
  function( arg )
    local G, k, L;

    G := group;

    k := Length( MatTom( TableOfMarks( G ) ) );

    L := List( [ 1 .. k ], x -> 0 );

    L[ k ] := 1;
    
    return GSet( G, L );
    
end );

##
AddUniversalMorphismIntoTerminalObjectWithGivenTerminalObject( SkeletalGSets,
  function( Omega, T ) 
    local L, M, G, k, i, C, l;

    L := [];

    M := AsList( Omega );  
    G := UnderlyingGroup( Omega );

    k := Length( M );

    for i in [ 1 .. k ] do 
        C := [];
        for l in [ 1 .. M[ i ] ] do
            Add( C, [ 1, Identity( G ), k ] );
        od;
        Add( L, C );
    od;    
    
    return MapOfGSets( Omega, L, T );
    
end );

##
AddDirectProduct( SkeletalGSets,
  function( L )
    local ToM, k, prod, l, M_l, i, V, B, C;
    
    ToM := TableOfMarks( group );

    ToM := MatTom( ToM );
    
    k := Length(ToM);
    
    prod := List( [ 1 .. k ], x -> 1 );
    
    for l in L do
        M_l := AsList(l) * ToM;

        for i in [ 1 .. k ] do
            prod[i] := prod[i] * M_l[i];
        od;
    od;

    V := VectorSpace( Rationals, ToM );

    B := Basis( V, ToM );

    C := Coefficients( B, prod );

    return GSet(group, C);
    
end );

##
AddProjectionInFactorOfDirectProduct( SkeletalGSets,
  function( L, i )
    local S, T;
    
    S := DirectProduct( L );
    
    T := L[i];
    
    return MapOfGSets( S, List( S, x -> [ x, x[i] ] ), T );
    
end );

##
AddUniversalMorphismIntoDirectProductWithGivenDirectProduct( SkeletalGSets,
  function( D, tau, T )
    local S;
    
    S := Source( tau[1] );
    
    return MapOfGSets( S, List( S, x -> List( tau, f -> f(x) ) ), T );
    
end );

## Colimits

##
AddInitialObject( SkeletalGSets,
  function( arg )
    local k, L, G;

    G := group;

    k := Length( MatTom( TableOfMarks( G ) ) );

    L := List( [ 1 .. k ], x -> 0 );
    
    return GSet( G, L );
    
end );

##
AddUniversalMorphismFromInitialObjectWithGivenInitialObject( SkeletalGSets,
  function( Omega, I )    
    
    if not ForAll( AsList( I ), a -> a = 0 ) then
        Error( "the second argument is not an initial object" );
    fi;
    
    return MapOfGSets( I, List( AsList( Omega ), x -> [] ), Omega );
    
end );

##
AddCoproduct( SkeletalGSets,
  function( L )
    local k, sum, l;
    
    k := Size( MatTom( TableOfMarks( group ) ) );
    
    sum := List( [ 1 .. k ], x -> 0 );
    
    for l in L do
        sum := sum + AsList(l);
    od;
    
    return GSet( group, sum );
    
end );

##
AddInjectionOfCofactorOfCoproduct( SkeletalGSets,
  function( L, pos )
    local S, M, T, k, sum, j, imgs, i, C, l;
    
    S := L[ pos ];
    
    M := AsList( S );
    
    T := Coproduct( L );
    
    k := Size( MatTom( TableOfMarks( group ) ) );
    
    sum := List( [ 1 .. k ], x -> 0 );
    
    for j in [ 1 .. (pos - 1) ] do
        sum := sum + AsList( L[ j ] );
    od;
    
    imgs := [];
    
    for i in [ 1 .. k ] do 
        C := [];
        for l in [ 1 .. M[ i ] ] do
            Add( C, [ sum[i] + l, Identity( group ), i ] );
        od;
        Add( imgs, C );
    od;
    
    return MapOfGSets( S, imgs, T );
    
end );

##
AddUniversalMorphismFromCoproductWithGivenCoproduct( SkeletalGSets,
  function( D, tau, S )
    local T, M, k, imgs, i, C, l, sum, sum_pre, j;
    
    T := Range( tau[1] );
    
    M := AsList( S );
    
    k := Size( MatTom( TableOfMarks( group ) ) );
    
    imgs := [];
    
    for i in [ 1 .. k ] do 
        C := [];
        for l in [ 1 .. M[ i ] ] do
            sum := 0;
            sum_pre := 0;
            for j in [ 1 .. Length(D) ] do
                    sum := sum + AsList(D[j])[i];
                    if sum >= l then
                        break;
                    fi;
                    sum_pre := sum;
            od;
            Add( C, AsList(tau[ j ])[ i ][ l - sum_pre] );
        od;
        Add( imgs, C );
    od;
    
    return MapOfGSets( S, imgs, T );
    
end );

##
AddImageObject( SkeletalGSets,
  function( phi )
    local S, M, imgs, L, i, l, r, j;
    
    S := Source( phi );
    
    M := AsList( S );
    
    imgs := AsList(phi);
    
    L := [];
    
    for i in [ 1 .. k ] do
        L[i] := [];
    od;
    
    for i in [ 1 .. k ] do
        for l in [ 1 .. M[ i ] ] do
            r := imgs[i][l][1];
            j := imgs[i][l][3];
            
            Add(L[j], r);
        od;
    od;
    
    return GSet( group, List( L, x -> Length( Set ( x ) ) ) );
    
end );

##
AddIsEpimorphism( SkeletalGSets,
  function( phi )
    
    return ImageObject( phi ) = Range( phi );
    
end );

##
AddIsMonomorphism( SkeletalGSets,
  function( phi )
    
    # Assume phi is a monomorphism mapping a generator of G/U_i to an element of G/U_j. Since phi is well-defined we have that U_i is contained in U_j up to conjugation. Since phi is injective we must have |U_j| <= |U_i|.
    # Thus, U_i and U_j are equal up to conjugation and since the U_i are representatives of conjugacy classes of subgroups of G, we get i = j. Additionally, the multiplicity of G/U_i in the source must be the same as in the image, since otherwise phi cannot be injective.
    # Conversely, if a morphism phi maps the generator of any G/U_i to an element of G/U_i and the multiplicity of any G/U_i in the source is the same as its multiplicity in the image, then phi is monomorphism.
    # Conclusion: we only have to compare the multiplicities of the G/U_i in the source and the image.
    
    return AsList( ImageObject( phi ) ) = AsList( Source( phi ) );
    
end );

##
AddImageEmbedding( SkeletalGSets,
  function( phi )
    local I, M, imgs, L, i, l, r, j, D, C;
    
    I := ImageObject( phi );
    
    M := AsList( I );
    
    imgs := AsList(phi);
    
    L := [];
    
    for i in [ 1 .. k ] do
        L[i] := [];
    od;
    
    for i in [ 1 .. k ] do
        for l in [ 1 .. M[ i ] ] do
            r := imgs[i][l][1];
            j := imgs[i][l][3];
            
            Add(L[j], r);
        od;
    od;
    
    D := [];
    
    for i in [ 1 .. k ] do 
        C := [];
        for l in [ 1 .. M[ i ] ] do
            Add( C, [ Set( L[ i ] )[ l ], Identity( group ), i ] );
        od;
        Add( D, C );
    od;

    return MapOfGSets( I, D, Range( phi ) );
    
end );

##
AddCoastrictionToImage( SkeletalGSets,
  function( phi )
    local M, I, imgs, L, i, l, r, j, D, C, g, pi;
    
    M := AsList( Source( phi ) );
    
    I := ImageObject( phi );
    
    imgs := AsList(phi);
    
    L := [];
    
    for i in [ 1 .. k ] do
        L[i] := [];
    od;
    
    for i in [ 1 .. k ] do
        for l in [ 1 .. M[ i ] ] do
            r := imgs[ i ][ l ][ 1 ];
            j := imgs[ i ][ l ][ 3 ];
            
            Add(L[j], r);
        od;
    od;
    
    D := [];
    
    for i in [ 1 .. k ] do 
        C := [];
        for l in [ 1 .. M[ i ] ] do
            r := imgs[ i ][ l ][ 1 ];
            g := imgs[ i ][ l ][ 2 ];
            j := imgs[ i ][ l ][ 3 ];
            
            Add( C, [ Position( Set( L[ j ] ), r ), g, j ] );
        od;
        Add( D, C );
    od;
    
    pi := MapOfGSets( Source( phi ), D, I );
    
    Assert( 3, IsEpimorphism( pi ) );
    
    SetIsEpimorphism( pi, true );
    
    return pi;
    
end );

Finalize( SkeletalGSets );

##
InstallMethod( Display,
        "for a CAP skeletal G set",
        [ IsSkeletalGSetRep ],
        
  function( N )
    Display( [ UnderlyingGroup( N ), AsList( N ) ] );
end );

return SkeletalGSets;
    
end );
