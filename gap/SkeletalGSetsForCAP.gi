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
    
    SkeletalGSets := CreateCapCategory( "Skeletal Category of G-Sets" );  # TODO
    
    SkeletalGSets!.group_for_category := group;
    
    k := Length( MatTom( TableOfMarks( group ) ) );


##
InstallMethod( TableOfMarks,
        "for a finite skeletal G-set",
        [ IsSkeletalGSetRep ],
        
  function( Omega )
    
    return TableOfMarks( UnderlyingGroup( Omega ) );
    
end );

##
AddIsWellDefinedForObjects( SkeletalGSets,
  function( Omega )
    local L;
    
    L := AsList( Omega );
    
    if not Length( L ) = k then
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

    #! groups have to be the same, because G is fixed
    return AsList( Omega1 ) = AsList( Omega2 );
    
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
    local S, T, G, img, tom, s, t;

    S := Source( mor );

    T := Range( mor );

    G := UnderlyingGroup( S );
    
    if not G = UnderlyingGroup( T ) then
        return false;
    fi;
    
    img := AsList( mor );
    
    if not Length( img ) = k then
        return Error( "The length of the list of relations is wrong.\n");
    fi;
    
    tom := MatTom( TableOfMarks( G ) );
    
    s := AsList( S );
    t := AsList( T );
    
    if not ForAll( [ 1 .. k ], i -> IsList( img[i] ) and Length( img[i] ) = s[i] and
        ForAll( img[i], function( e )
                            local r, g, j;
                            
                            if not ( IsList( e ) and Length( e ) = 3 ) then
                                return Error( "The list of relations has a wrong syntax.\n" );
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
    local y, m, g, i;

    m := L[ 1 ];
    g := L[ 2 ];
    i := L[ 3 ];

    y := AsList( phi )[ i ][ m ];

    if IsWellDefined( phi ) then 
        if y = fail then                    #TODO fail???
            Error( "the element ", L, " is not in the source of the map\n" );
        else 
            
            if not ( i in [ 1 .. k ] and m <= AsList( Source( phi ) )[ i ] ) then
                Error( "the element ", [ m, i ], " is not in the source of the map\n" );
            fi;
        fi;
    else
        Error( "please check if the map is well-defined\n" );
    fi;

    return  [ AsList( phi )[ i ][ m ][ 1 ], AsList( phi )[ i ][ m ][ 2 ] * g, AsList( phi )[ i ][ m ][ 3 ] ];
    
end );

##
InstallMethod( IsEqualModSubgroup,
        "for two group elements and a Subgroup",
    [ IsObject, IsObject, IsObject ],                                                # TODO
        
  function( g1, g2, U )

    return g1 * Inverse( g2 ) in U;
    
end );

##
AddIsEqualForMorphisms( SkeletalGSets,
  function( mor1, mor2 )
    local M, i, l, img1, img2, j, U;
    
    M := AsList( Source( mor1 ) );
    
    for i in [ 1 .. k ] do 
        if not Length( AsList( mor1 )[ i ] ) = Length( AsList( mor2 )[ i ] ) then
            return false;
        fi;
         
        for l in [ 1 .. M[ i ] ] do   
            
            img1 := AsList( mor1 )[ i ][ l ];
            img2 := AsList( mor2 )[ i ][ l ];
            j := img1[ 3 ];
            U := RepresentativeOfSubgroupsUpToConjugation( j );
            
            if not ( img1[ 1 ] = img2[ 1 ] and IsEqualModSubgroup( img1[ 2 ], img2[ 2 ], U ) and img1[ 3 ] = img2[ 3 ] ) then 
                return false;
            fi;
        od;
    od;
     
    return true; 
    
end );

##
AddIdentityMorphism( SkeletalGSets,
  function( Omega )
    local L, M, i, C, l;
    
    L := [];
    M := AsList( Omega );  
    
    for i in [ 1 .. k ] do 
        C := [];
        for l in [ 1 .. M[ i ] ] do
            Add( C, [ l, Identity( group ), i ] );
        od;
        Add( L, C );
    od;
    
    return MapOfGSets( Omega, L, Omega );
    
end );

##
AddPreCompose( SkeletalGSets,                      # TODO rewrite with callfunclist
  function( map_pre, map_post )
    local cmp, S, M, L_pre, L_post, i, C, l, r, img_pre, g, j, img_post;

    if IsWellDefined( map_pre ) = false or IsWellDefined( map_post ) = false then
        Error( "Check if the maps are well defined\n" );
    fi;

    cmp := [];

    S := Source( map_pre );

    M := AsList( S );  

    L_pre := AsList( map_pre );
    L_post := AsList( map_post );

    for i in [ 1 .. k ] do 
        C := [];
        for l in [ 1 .. M[ i ] ] do
            img_pre := L_pre[ i ][ l ];
            r := img_pre[ 1 ];
            g := img_pre[ 2 ];
            j := img_pre[ 3 ];
            img_post := L_post[ j ][ r ];
            Add( C, [ img_post[ 1 ], g * img_post[ 2 ] , img_post[ 3 ] ] ); # TODO: g * oder * g?
        od;
        Add( cmp, C );
    od;

    return MapOfGSets( S, cmp, Range( map_post ) );
    
end );

## Limits

##
AddTerminalObject( SkeletalGSets,
  function( arg )
    local L;

    L := List( [ 1 .. k ], x -> 0 );

    L[ k ] := 1;
    
    return GSet( group, L );
    
end );

##
AddUniversalMorphismIntoTerminalObjectWithGivenTerminalObject( SkeletalGSets,
  function( Omega, T ) 
    local L, M, i, C, l;

    L := [];

    M := AsList( Omega );  

    for i in [ 1 .. k ] do 
        C := [];
        for l in [ 1 .. M[ i ] ] do
            Add( C, [ 1, Identity( group ), k ] );
        od;
        Add( L, C );
    od;    
    
    return MapOfGSets( Omega, L, T );
    
end );

##
AddDirectProduct( SkeletalGSets,
  function( L )
    local ToM, prod, l, M_l, i, V, B, C;
    
    ToM := TableOfMarks( group );
    
    ToM := MatTom( ToM );
    
    prod := List( [ 1 .. k ], x -> 1 );
     
    for l in L do
        M_l := AsList( l ) * ToM;
        for i in [ 1 .. k ] do
            prod[i] := prod[i] * M_l[i];
        od;
    od;
    
    V := VectorSpace( Rationals, ToM );
    
    B := Basis( V, ToM );
    
    C := Coefficients( B, prod );
    
    return GSet( group, C );  
    
end );

##
InstallMethod( PositionOfSubgroup,
        "for CAP",
        [ IsObject ], 

  function( U )
    local i;

    for i in [ 1..k ] do
        if U in ConjugateSubgroups( group, RepresentativeOfSubgroupsUpToConjugation( i ) ) then
            return i;
        fi;
    od;
     
end );

##
InstallMethod( RepresentativeOfSubgroupsUpToConjugation,
        "for CAP skeletal finite G - sets",
        [ IsInt ],
        
  function( i ) 
    
    return RepresentativeTom( TableOfMarks( group ), i ) ;
    
end );

##
InstallMethod( OrbitsOfActionOnCartesianProduct,
        "for CAP skeletal finite G - sets",
        [ IsList ],
        
  function( L )
    local LoS, LoF, C, e, o, RoO, SRO, imgs, r, s, i; 
    
    # ListOfSubgroups
    LoS := List( L, i -> RepresentativeOfSubgroupsUpToConjugation( i ) );
    
    # ListOfFactorgroups
    LoF := List( LoS, U -> RightCosets( group, U ) );
    
    C := Cartesian( LoF );
    
    #Action of G on C by rightmultiplication 
    e := ExternalSet( group, C, OnRight );
    
    o := Orbits( e );
   
    return o;
    
end );

##
InstallMethod( ToBeNamed,
        "for CAP skeletal finite G - sets",
        [ IsList ],
        
  function( L )
    local o, RoO, SRO, imgs, r, s, i; 
    
    o := OrbitsOfActionOnCartesianProduct( L );
    
    # Representatives Of Orbits
    RoO := List( o, x -> x[ 1 ] );
    
    # Stabilizers of Representatives of orbits
    SRO := List( RoO, r -> Stabilizer( group, r, OnRight ) );
    
    imgs := List( [ 1..k ], i -> [] );
    
    for r in RoO do
          s := Stabilizer( group, r, OnRight );
          i := PositionOfSubgroup( s );
          Add( imgs[ i ], r );
    od;
    
    return imgs;
    
end );

##
InstallMethod( IntZeroVector,
        "for CAP skeletal finite G - sets",
        [ IsInt ],
        
  function( i )
    return List( [ 1 .. i ], x -> 0 );
    
end );

##
InstallMethod( ProjectionOfASingleBinaryProduct,
        "for ... and a CAP skeletal finite G-Set",
        [ IsInt, IsInt, IsInt, IsInt, IsSkeletalGSetRep ],
        
  function( i, j, pos, copy_number, target )
    local imgs, G_i, G_j, P, pi, l, img, target_index;
    
    imgs := ToBeNamed( [ i, j ] );
    
    # G/U_i
    G_i := List( [ 1 .. k ], x -> 0 );
    G_i[ i ] := 1;
    # G/U_j
    G_j := List( [ 1 .. k ], x -> 0 );
    G_j[ j ] := 1;
    
    # take the direct product of G/U_i and G/U_j and construct the projection pi
    P := DirectProduct( [ GSet( group, G_i), GSet( group, G_j) ] );
    pi := [];
    for l in [ 1 .. k ] do
        pi [ l ] := [];
        for img in imgs[ l ] do
            if pos = 1 then
                target_index := i;
            else
                target_index := j;
            fi;
    
            Add( pi[ l ], [ copy_number, Representative( img[ pos ] ), target_index ] ); 
        od;
    od;
    
    return MapOfGSets( P, pi, target );
    
end );

##
InstallMethod( ProjectionInFactorOfBinaryDirectProduct,
        "for CAP skeletal finite G - sets",
        [ IsList, IsInt ],
        
  function( L, pos )
    local S, T, M, N, D, tau, i, j, l, imgs, img, m, n, target, copy_number, pi, P;
    
    # here: Size( L ) = 2
    
    S := DirectProduct( L );
    
    T := L[ pos ];
    
    M := AsList( L[1] );
    N := AsList( L[2] );
    
    D := [];
    tau := [];
    
    for i in [ 1 .. k ] do
        for j in [ 1 .. k ] do
            for m in [ 1 .. M[i] ] do
                for n in [ 1 .. N[j] ] do
                    if pos = 1 then
                        copy_number := m;
                    else
                        copy_number := n;
                    fi;
                    
                    pi := ProjectionOfASingleBinaryProduct( i, j, pos, copy_number, T );
                       
                    P := Source( pi );
                    
                    Add( D, P );
                    Add( tau, pi );
                od;
            od;
        od;
    od;
    
    return UniversalMorphismFromCoproduct( D, tau );
    
end );

##
AddProjectionInFactorOfDirectProduct( SkeletalGSets,
  function( L, pos )
    local P, pi1, pi2;
    
    if Length( L ) = 1 then
        return IdentityMorphism( L[ 1 ] );
    fi;
    
    P := DirectProduct( L{ [ 2 .. Length( L ) ] } );

    if pos = 1 then
        return ProjectionInFactorOfBinaryDirectProduct( [ L[ 1 ], P ], 1 );
    else
        pi1 := ProjectionInFactorOfBinaryDirectProduct( [ L[ 1 ], P ], 2 );
        pi2 := ProjectionInFactorOfDirectProduct( L{ [ 2 .. Length( L ) ] }, pos - 1 );
        return PreCompose( pi1, pi2 );
    fi;
    
end );
 
##
InstallMethod( OffsetInCartesianProduct,
        "for CAP ... ",
        [ IsList, IsList, IsInt, IsInt, IsInt, IsInt ],

  function( M, N, given_i, given_j, given_m, given_n  )
    local result, i, j, m, n, pi;
    
    result := List( [ 1 .. k ], x -> 0 );
    
    for i in [ 1 .. k ] do
        for j in [ 1 .. k ] do
            for m in [ 1 .. M[i] ] do
                for n in [ 1 .. N[j] ] do
                    if i = given_i and j = given_j and m = given_m and n = given_n then
                        return result;                    
                    fi;

                    # TODO replace dummy values 1, 1 and TerminalObject
                    pi := ProjectionOfASingleBinaryProduct( i, j, 1, 1, TerminalObject( GSet( group, M ) ) );
                                        
                    result := result + List( AsList( pi ), x -> Length( x ) );
                od;
            od;
        od;
    od;
        
end );

##
InstallMethod( UniversalMorphismIntoBinaryDirectProductWithGivenDirectProduct,
        "for CAP ... ",
        [ IsList, IsList, IsSkeletalGSetRep ],

  function( D, tau, T ) # TODO: Frage: was ist D resp. wofür braucht man es??????
    local S, M, N, imgs, i, l, r_1, r_2, g_1, g_2, j_1, j_2, Offset, Orbits, RoO, SRO, U_j_1, U_j_2, img, o, g, s, j, Internaloffset, p, j_p, r;

    # Assumption Length( D ) = 2
    
    S := Source( tau[ 1 ] ); 
    
    M := AsList( Range( tau[ 1 ] ) );
    N := AsList( Range( tau[ 2 ] ) );    

    imgs := [];

    for i in [ 1 .. k ] do
        imgs[ i ] := [];
        for l in [ 1.. AsList( S )[ i ] ] do
             r_1 := AsList( tau[ 1 ] )[ i ][ l ][ 1 ];
             r_2 := AsList( tau[ 2 ] )[ i ][ l ][ 1 ];
             g_1 := AsList( tau[ 1 ] )[ i ][ l ][ 2 ];
             g_2 := AsList( tau[ 2 ] )[ i ][ l ][ 2 ];
             j_1 := AsList( tau[ 1 ] )[ i ][ l ][ 3 ]; 
             j_2 := AsList( tau[ 2 ] )[ i ][ l ][ 3 ];
             
             Offset := OffsetInCartesianProduct( M, N, j_1, j_2, r_1, r_2 );
             
             Orbits := OrbitsOfActionOnCartesianProduct( [ j_1, j_2 ] ); 
                          
             # Representatives Of Orbits
             RoO := List( Orbits, x -> x[ 1 ] );
             
             # Stabilizers of Representatives of orbits
             SRO := List( RoO, r -> Stabilizer( group, r, OnRight ) );
             
             U_j_1 := RepresentativeOfSubgroupsUpToConjugation( j_1 );
             U_j_2 := RepresentativeOfSubgroupsUpToConjugation( j_2 );
             
             img := [ RightCoset( U_j_1, g_1 ), RightCoset( U_j_2, g_2 ) ]; 
             
             for o in [ 1.. Length( Orbits ) ] do
                 if img in Orbits[ o ] then
                     break;
                 fi;                           
             od;  
             
             for g in group do
                 if RoO[ o ] * g = img then
                     break;
                 fi;
             od;
             
             s := Stabilizer( group, RoO[ o ], OnRight );
             j := PositionOfSubgroup( s );
             
             Internaloffset := 0;
             
             for p in [ 1 .. Length( SRO )] do
                 j_p := PositionOfSubgroup( SRO[ p ] );
                 if j = j_p then
                     Internaloffset := Internaloffset + 1;
                     if p = o then
                         break;
                     fi;
                 fi; 
             od;
              
             r := Offset[ j ] + Internaloffset;
             Add( imgs[i], [ r, g, j ] );
        od;
    od;
    
    return MapOfGSets( S, imgs, T );
    
end );

##  
AddUniversalMorphismIntoDirectProductWithGivenDirectProduct( SkeletalGSets,
  function( D, tau, T ) # TODO: Frage: was ist D resp. wofür braucht man es??????
    local D2, tau2, sigma;
    
    if Length( D ) = 1 then
        return tau[ 1 ];
    fi;
    
    if Length( D ) = 2 then
        return UniversalMorphismIntoBinaryDirectProductWithGivenDirectProduct( D, tau, T );
    fi;
    
    D2 := D{ [ 2 .. Length( D ) ] };
    tau2 := tau{ [ 2 .. Length( tau ) ] };
    
    sigma := UniversalMorphismIntoDirectProduct( D2, tau2 );
    return UniversalMorphismIntoBinaryDirectProductWithGivenDirectProduct( [ D[ 1 ], DirectProduct( D2 ) ], [ tau[ 1 ], sigma ], T );
    
end );

##
AddEqualizer(SkeletalGSets,
  function( D )
    local f1, s, M, L, i, l;
    
    f1 := D[ 1 ];
    
    s := Source( f1 );
    
    D := D{ [ 2 .. Length( D ) ] };
    
    M := AsList( s );    

    L := [];
    
    for i in [ 1 .. k ] do
        L[i] := 0; 
        for l in [ 1 .. M[ i ] ] do
            if ForAll( D, fj -> AsList( f1 )[i][l][1] = AsList( fj )[i][l][1] and AsList( f1 )[i][l][3] = AsList( fj )[i][l][3] and IsEqualModSubgroup( AsList( f1 )[i][l][2], AsList( fj )[i][l][2], RepresentativeOfSubgroupsUpToConjugation( AsList( f1 )[i][l][3] ) ) ) then
                 L[i] := L[i] + 1;
            fi;    
        od;
    od;
    
    return GSet( group, L );
    
end);

##
AddEmbeddingOfEqualizerWithGivenEqualizer( SkeletalGSets,
  function( D, E )
    local f1, s, M, L, i, l;
    
    f1 := D[ 1 ];
    
    s := Source( f1 );
    
    D := D{ [ 2 .. Length( D ) ] };
    
    M := AsList( s );    

    L := [];
    
    for i in [ 1 .. k ] do
        L[i] := []; 
        for l in [ 1 .. M[ i ] ] do
            if ForAll( D, fj -> AsList( f1 )[i][l] = AsList( fj )[i][l] ) then
                 Add( L[i], [ l, Identity( group ), i ] );
            fi;    
        od;
    od;
    
    return MapOfGSets( E, L, s );
    
end );

##
AddUniversalMorphismIntoEqualizerWithGivenEqualizer( SkeletalGSets,
  function( D, tau, E )
    local f1, M, L, i, l, S, imgs;
    
    f1 := D[ 1 ];
   
    D := D{ [ 2 .. Length( D ) ] };
    
    M := AsList( Source( f1 ) );    
    
    L := [];
    
    for i in [ 1 .. k ] do
        L[i] := []; 
        for l in [ 1 .. M[ i ] ] do
            if ForAll( D, fj -> AsList( f1 )[i][l] = AsList( fj )[i][l] ) then
                 Add( L[i], l );
            fi;    
        od;
    od;
    
    S := Source( tau );

    imgs := [];

    for i in [ 1 .. k ] do
        imgs[i] := []; 
        for l in [ 1 .. M[ i ] ] do
            if ForAll( D, fj -> AsList( f1 )[i][l] = AsList( fj )[i][l] ) then
                 Add( imgs[i], [ Position( L[i], l ), AsList( tau )[i][l][2], i ]  );
            fi;    
        od;
    od;

    return MapOfGSets( S, imgs, E );
    
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
    local T, M, k, imgs, i, C, j;
    
    T := Range( tau[1] );
    
    M := AsList( S );
    
    k := Size( MatTom( TableOfMarks( group ) ) );
    
    imgs := [];
    
    for i in [ 1 .. k ] do 
        C := [];
        for j in [ 1 .. Length(tau) ] do
            C := Concatenation( C, AsList(tau[ j ])[ i ] );
        od;
        Add( imgs, C);
    od;
    
    return MapOfGSets( S, imgs, T );
    
end );

##
InstallMethod( PreimagePositions,
        "for a CAP map of skeletal G-Sets and a finite set",
        [ IsSkeletalGSetMapRep, IsList ],
        
  function( phi, L )
    local r, j, C, i, l;  
    
    r := L[ 1 ];
    j := L[ 2 ];
    
    C := []; 
    
    for i in [ 1 .. k ] do 
        for l in [ 1 .. AsList( Source( phi ) )[ i ] ] do
            if ( AsList( phi )[ i ][ l ][ 1 ] = r and AsList( phi )[ i ][ l ][ 3 ] = j ) then
                Add( C, [ i, l ] );
            fi;
        od;
    od; 
    
    return C;
    
end );

##
AddCoequalizer( SkeletalGSets,
  function( D )
    local T, L, j, r, pos, p, Cq, t;
    
    T := Range( D[ 1 ] );
    
    L := [ ];
    
    for j in [ 1 .. k ] do
        for r in [ 1 .. AsList( T )[ j ] ] do
            Add( L, [ r, j ] ); 
        od;
    od;
    
    for pos in L do
        for p in Preimage( D[ 1 ], pos ) do 
                
        od;
    od;
    
            t := [ t ];
            t := Union( List( D, f_j -> List( Union( List( D, f_i -> Preimage( f_i, t ) ) ), f_j  ) ) );
            t := Set( t );
            if not t = [ ] then
                Add( Cq, t );
                T:= Difference( T, t ); 
            fi;
    
    Append( Cq, List( T, t -> [ t ] )  );
    
    Cq := Set( Cq );
    
    return GSet( group, [] );
    
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
    
    # Assume phi is a monomorphism mapping a generator of G/U_i to an element of G/U_j. Since phi is well-defined we have that U_i is contained in U_j 
      # up to conjugation. Since phi is injective we must have |U_j| <= |U_i|.
    # Thus, U_i and U_j are equal up to conjugation and since the U_i are representatives of conjugacy classes of subgroups of G, we get i = j. 
      # Additionally, the multiplicity of G/U_i in the source must be the same as in the image, since otherwise phi cannot be injective.
    # Conversely, if a morphism phi maps the generator of any G/U_i to an element of G/U_i and the multiplicity of any G/U_i in the source is the 
      # same as its multiplicity in the image, then phi is monomorphism.
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

##
InstallMethod( Display,
        "for a CAP map of CAP skeletal G sets",
        [ IsSkeletalGSetMapRep ],
        
  function( mor )
    Display( [ Source( mor ) , AsList( mor ), Range( mor ) ] );
end );


return SkeletalGSets;
    
end );
