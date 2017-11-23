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
    local
        SkeletalGSets,
        k,
        IntZeroVector,
        RepresentativeOfSubgroupsUpToConjugation,
        PositionOfSubgroup,
        IsEqualModSubgroup,
        OrbitsOfActionOnCartesianProduct,
        ProjectionOfASingleBinaryProduct,
        ProjectionInFactorOfBinaryDirectProduct,
        OffsetInCartesianProduct,
        UniversalMorphismIntoBinaryDirectProductWithGivenDirectProduct,
        AsASet,
        ExplicitCoequalizer,
        CoequalizerOfAConnectedComponent;
    
    SkeletalGSets := CreateCapCategory( "Skeletal Category of G-Sets" );  # TODO
    
    SkeletalGSets!.group_for_category := group;
    
    k := Length( MatTom( TableOfMarks( group ) ) );
    
    IntZeroVector := function( i )
        
        return ListWithIdenticalEntries( i, 0 );
        
    end;
    
    RepresentativeOfSubgroupsUpToConjugation := function( i ) 
        
        return RepresentativeTom( TableOfMarks( group ), i ) ;
        
    end;
    
    PositionOfSubgroup := function( U )
        local i;

        for i in [ 1..k ] do
            if U in ConjugateSubgroups( group, RepresentativeOfSubgroupsUpToConjugation( i ) ) then
                return i;
            fi;
        od;
         
    end;
    
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
        local S, T, img, tom, s, t, U_i, U_j, u;
        
        S := Source( mor );
        
        T := Range( mor );
        
        if not (group = UnderlyingGroup( S ) and group = UnderlyingGroup( T )) then
            return false;
        fi;
        
        img := AsList( mor );
        
        if not Length( img ) = k then
            return Error( "The length of the list of relations is wrong.\n");
        fi;
        
        tom := MatTom( TableOfMarks( group ) );
        
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
                                
                                # j has to be the index of a subgroup of group, i.e. an integer between 1 and k
                                # r has to be the index of a copy of U_j
                                # g has to be an element of group
                                # U_i has to be a subgroup of U_j up to conjugation, which can be read off the table of marks
                                
                                if not ( IsPosInt( j ) and j <= k and IsPosInt( r ) and r <= t[j] and g in group and tom[j][i] > 0 ) then
                                    return Error( "3\n" );
                                fi;
                                
                                U_i := RepresentativeOfSubgroupsUpToConjugation( i );
                                U_j := RepresentativeOfSubgroupsUpToConjugation( j );
                                if not IsSubset( U_j, ConjugateSubgroup( U_i, Inverse(g) ) ) then
                                    return Error( "4\n" );
                                fi;
                                
                                return true;
                            end
                  )
                     ) then
            return Error( "5\n" );
        fi;
        
        return true;
        
    end );

    ##
    InstallMethod( CallFuncList,
            "for a CAP map of skeletal G-sets and a list",
        [ IsSkeletalGSetMapRep, IsList ],
            
      function( phi, L )
        local y, l, g, i;
        
        l := L[ 1 ][ 1 ];
        g := L[ 1 ][ 2 ];
        i := L[ 1 ][ 3 ];
        
        y := AsList( phi )[ i ][ l ];
        
        if IsWellDefined( phi ) then 
            if not ( i in [ 1 .. k ] and l <= AsList( Source( phi ) )[ i ] ) then
                Error( "the element ", [ l, g, i ], " is not in the source of the map\n" );
            fi;
        else
            Error( "please check if the map is well-defined\n" );
        fi;
        
        return  [ y[ 1 ], y[ 2 ] * g, y[ 3 ] ];
        
    end );
    
    IsEqualModSubgroup := function( g1, g2, U )
        
        return g1 * Inverse( g2 ) in U;
        
    end;

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
    AddPreCompose( SkeletalGSets,
      function( map_pre, map_post )
        local cmp, S, M, i, C, l;
        
        if IsWellDefined( map_pre ) = false or IsWellDefined( map_post ) = false then
            Error( "Check if the maps are well defined\n" );
        fi;
        
        cmp := [];
        
        S := Source( map_pre );
        
        M := AsList( S );  
        
        for i in [ 1 .. k ] do 
            C := [];
            for l in [ 1 .. M[ i ] ] do
                Add( C, map_post( map_pre( [ l, Identity( group ), i ] ) ) );
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
        
        L := IntZeroVector( k );
        
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
    
    OrbitsOfActionOnCartesianProduct := function( L )
        local LoS, LoF, C, e, o; 
        
        # ListOfSubgroups
        LoS := List( L, i -> RepresentativeOfSubgroupsUpToConjugation( i ) );
        
        # ListOfFactorgroups
        LoF := List( LoS, U -> RightCosets( group, U ) );
        
        C := Cartesian( LoF );
        
        #Action of G on C by rightmultiplication 
        e := ExternalSet( group, C, OnRight );
        
        o := Orbits( e );
        
        return o;
        
    end;

    ProjectionOfASingleBinaryProduct := function( i, j, pos, copy_number, target )
        local o, RoO, imgs, r, s, a, found_g, U_a, g, G_i, G_j, P, pi, l, img, target_index;
        
        o := OrbitsOfActionOnCartesianProduct( [ i, j ] );
        
        # Representatives Of Orbits
        RoO := List( o, x -> x[ 1 ] );
        
        imgs := List( [ 1 .. k ], x -> [] );
        
        for r in RoO do
            s := Stabilizer( group, r, OnRight );
            
            found_g := false;
            for a in [ 1 .. k ] do
                U_a := RepresentativeOfSubgroupsUpToConjugation( a );
                for g in group do
                    if ConjugateSubgroup( s, Inverse( g ) ) = U_a then # TODO: g oder Inverse( g )?
                        found_g := true;
                        break;
                    fi;
                od;
                if found_g then
                    break;
                fi;
            od;
            
            Add( imgs[ a ], r * Inverse( g ) );
        od;
        
        # G/U_i
        G_i := IntZeroVector( k );
        G_i[ i ] := 1;
        # G/U_j
        G_j := IntZeroVector( k );
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
        
    end;

    ProjectionInFactorOfBinaryDirectProduct := function( L, pos )
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
        
    end;

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
     
    OffsetInCartesianProduct := function( M, N, given_i, given_j, given_m, given_n  )
        local result, i, j, m, n, pi;
        
        result := IntZeroVector( k );
        
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
        
    end;

    UniversalMorphismIntoBinaryDirectProductWithGivenDirectProduct := function( D, tau, T ) # TODO: Frage: was ist D resp. wofür braucht man es??????
        local S, M, N, imgs, i, l, r_1, r_2, g_1, g_2, j_1, j_2, Offset, Orbits, RoO, SRO, U_j_1, U_j_2, img, o, g, s, j, Internaloffset, p, j_p, r, U_j, conj, found_conj;
        
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
                
                # image in the Cartesian product
                img := [ RightCoset( U_j_1, g_1 ), RightCoset( U_j_2, g_2 ) ]; 
                
                # find the orbit containing img
                for o in [ 1 .. Length( Orbits ) ] do
                    if img in Orbits[ o ] then
                        break;
                    fi;
                od;
                 
                # find an element of g which maps the representative of o to img
                for g in group do
                    if RoO[ o ] * g = img then
                        break;
                    fi;
                od;
                
                s := Stabilizer( group, RoO[ o ], OnRight ); # = SRO[ o ]? TODO
                
                found_conj := false;
                for j in [ 1 .. k ] do
                    U_j := RepresentativeOfSubgroupsUpToConjugation( j );
                    for conj in group do
                        if ConjugateSubgroup( s, Inverse( conj ) ) = U_j then # TODO: g oder Inverse( g )?
                            found_conj := true;
                            break;
                        fi;
                    od;
                    if found_conj then
                        break;
                    fi;
                od;
                 
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
                Add( imgs[i], [ r, conj * g, j ] );
            od;
        od;
        
        return MapOfGSets( S, imgs, T );
        
    end;

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
        
        return GSet( group, IntZeroVector( k ) );
        
    end );

    ##
    AddUniversalMorphismFromInitialObject( SkeletalGSets,
      function( Omega )    
        
        return MapOfGSets( GSet( group, IntZeroVector( k ) ), List( AsList( Omega ), x -> [] ), Omega );
        
    end );

    ##
    AddCoproduct( SkeletalGSets,
      function( L )
        local sum, l;
        
        sum := IntZeroVector( k );
        
        for l in L do
            sum := sum + AsList(l);
        od;
        
        return GSet( group, sum );
        
    end );

    ##
    AddInjectionOfCofactorOfCoproduct( SkeletalGSets,
      function( L, pos )
        local S, M, T, sum, j, imgs, i, C, l;
        
        S := L[ pos ];
        
        M := AsList( S );
        
        T := Coproduct( L );
        
        sum := IntZeroVector( k );
        
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
        local T, M, imgs, i, C, j;
        
        T := Range( tau[1] );
        
        M := AsList( S );
        
        imgs := [];
        
        for i in [ 1 .. k ] do 
            C := [];
            for j in [ 1 .. Length(tau) ] do
                C := Concatenation( C, AsList(tau[ j ])[ i ] );
            od;
            Add( imgs, C );
        od;
        
        return MapOfGSets( S, imgs, T );
        
    end );

    AsASet := function( M ) #TODO: AsSet?, eigener Typ um Gleichheit mod U_i direkt zu prüfen
        local set, i, U, l, g;
        
        set := [];
        for i in [ 1 .. k ] do
            U := RepresentativeOfSubgroupsUpToConjugation( i );
            for l in [ 1 .. M[ i ] ] do
                set := Union2( set, List( RightTransversal( group, U ), g -> [ l, g, i ] ) );
            od;
        od;
        return set;
        
    end;

    ##
    ExplicitCoequalizer :=  function( D )
        local A, B, ASet, BSet, AreEquivalent, equivalence_classes, b, first_equivalence_class, i, class, j, element, OurAction, external_set, orbits, RoO, Cq, r, s;
        
        A := Source( D[ 1 ] );
        B := Range( D[ 1 ] );
        ASet := AsASet( AsList( A ) );
        BSet := AsASet( AsList( B ) );
        
        AreEquivalent := function(e, b)
            local a, imgs, found_e, found_b, img, U;
            if e = b then
                Error( "this should not happen" );
            fi;
            
            for a in ASet do
                imgs := List( D, f -> f( a ) );
                found_e := false;
                found_b := false;
                for img in imgs do
                    U := RepresentativeOfSubgroupsUpToConjugation( img[ 3 ] );
                    if e[ 3 ] = img[ 3 ] and e[ 1 ] = img[ 1 ] and IsEqualModSubgroup( e[ 2 ], img[ 2 ], U ) then
                        found_e := true;
                    fi;
                    if b[ 3 ] = img[ 3 ] and b[ 1 ] = img[ 1 ] and IsEqualModSubgroup( b[ 2 ], img[ 2 ], U ) then
                        found_b := true;
                    fi;
                    if found_e and found_b then
                        return true;
                    fi;
                od;
            od;
            
            return false;
        end;
        
        Display( ASet );
        Display( Length( ASet));
        Display( BSet );
        Display( Length( BSet));
        
        equivalence_classes := [];
        for b in BSet do
            first_equivalence_class := 0;
            for i in [ 1 .. Length( equivalence_classes ) ] do
                class := equivalence_classes[ i ];
                for j in [ 1 .. Length( class ) ] do
                    element := class[ j ];
                    # prüfe ob element ~ b
                    if AreEquivalent( element, b) then
                        if first_equivalence_class > 0 then
                            # merge class and first_equivalence_class
                            Display( "classes are merged" );
                            equivalence_classes[ first_equivalence_class ] := Union2( equivalence_classes[ first_equivalence_class ], class );
                            equivalence_classes[ i ] := [];
                        else
                            Add( equivalence_classes[ i ], b);
                            first_equivalence_class := i;
                        fi;
                        break;
                    fi;
                od;
            od;
            if first_equivalence_class = 0 then
                Add(equivalence_classes, [ b ]);
            fi;
        od;
        equivalence_classes := Filtered( equivalence_classes, x -> Length( x ) > 0 );
        
        Display( Size( equivalence_classes ) );
        
        OurAction := function( pnt, g )
            local representative, l_r, g_r, i_r, result, class, element, U;
            
            representative := pnt[ 1 ];
            
            l_r := representative[ 1 ];
            g_r := representative[ 2 ];
            i_r := representative[ 3 ];
            
            result := [ l_r, g_r * g, i_r ];
            for class in equivalence_classes do
                for element in class do
                    
                    U := RepresentativeOfSubgroupsUpToConjugation( result[ 3 ] );
                    
                    if result[ 3 ] = element[ 3 ] and result[ 1 ] = element[ 1 ] and IsEqualModSubgroup( result[ 2 ], element[ 2 ], U ) then
                        return class;
                    fi;
                od;
            od;
        end;

        external_set := ExternalSet( group, equivalence_classes, OurAction );

        
        orbits := Orbits( external_set );
        
        # Representatives Of Orbits
        RoO := List( orbits, x -> x[ 1 ] );
        
        Cq := IntZeroVector( k );
        for r in RoO do
            s := Stabilizer( group, r, OurAction );
            i := PositionOfSubgroup( s );
            Cq[ i ] := Cq[ i ] + 1;
        od;
        
        return GSet( group, Cq );
    end;

    ##
    CoequalizerOfAConnectedComponent := function( D, SourcePositions, RangePositions )
      local A, B, M, N, Equations, Solutions, a, b, s, i, l, f_a, f_b, img_a, img_b, r_a, r_b, g_a, g_b, j_a, j_b, p, r, j, h, e, v, U_j, h_a, h_b, V, U_i, g;
        
        A := Source( D[ 1 ] );
        B := Range( D[ 1 ] );

        M := AsList( A );
        N := AsList( B );
        
        Equations := [];
        
        Solutions := List( [ 1 .. k ], j -> ListWithIdenticalEntries( N[ j ], false ) );
        
        for a in [ 1 .. Length( D ) ] do
            for b in [ (a + 1) .. Length( D ) ] do
                for s in SourcePositions do
                    i := s[ 2 ];
                    l := s[ 1 ];
                    f_a := D[ a ];  
                    f_b := D[ b ];
                    img_a := AsList( f_a )[ i ][ l ];  
                    img_b := AsList( f_b )[ i ][ l ];
                    r_a := img_a[ 1 ];
                    r_b := img_b[ 1 ];
                    g_a := img_a[ 2 ];
                    g_b := img_b[ 2 ];
                    j_a := img_a[ 3 ];
                    j_b := img_b[ 3 ];
                    
                    Add( Equations, [ g_a, r_a, j_a, g_b, r_b, j_b ] ); 
                od;  
            od;
        od;

        Solutions[ RangePositions[ 1 ][ 2 ] ] [ RangePositions[ 1 ][ 1 ] ] := Identity( group );
        
        repeat 
            # search for new solutions
            for p in RangePositions do
                r := p[ 1 ];
                j := p[ 2 ];
                for e in Equations do
                    r_a := e[ 2 ];
                    r_b := e[ 5 ];
                    g_a := e[ 1 ];
                    g_b := e[ 4 ];
                    j_a := e[ 3 ];
                    j_b := e[ 6 ];
                    
                    if [ r_a, j_a ] = [ r, j ] then
                        if Solutions[ j ][ r ] = false and Solutions[ j_b ][ r_b ] <> false then
                            Solutions[ j ][ r ] := Solutions[ j_b ][ r_b ]* g_b * Inverse( g_a );
                        fi;
                        if Solutions[ j ][ r ] <> false and Solutions[ j_b ][ r_b ] = false then
                            Solutions[ j_b ][ r_b ] := Solutions[ j ][ r ]* g_a * Inverse( g_b );
                        fi;
                    
                    elif [ r_b, j_b ] = [ r, j ] then
                        if Solutions[ j ][ r ] = false and Solutions[ j_a ][ r_a ] <> false then
                            Solutions[ j ][ r ] := Solutions[ j_a ][ r_a ]* g_a * Inverse( g_b );
                        fi;
                        if Solutions[ j ][ r ] <> false and Solutions[ j_a ][ r_a ] = false then
                            Solutions[ j_a ][ r_a ] := Solutions[ j ][ r ]* g_b * Inverse( g_a );
                        fi;  
                    fi;
                od;
            od;
            
        until ForAll( RangePositions, p -> Solutions[ p[ 2 ] ][ p[ 1 ]] <> false );
        
        v := [];
        
        for p in RangePositions do
            j := p[ 2 ];
            r := p[ 1 ];
            U_j := RepresentativeOfSubgroupsUpToConjugation( j );
            h := Solutions[ j ][ r ];
            v := Union2( v, GeneratorsOfGroup( ConjugateSubgroup( U_j, Inverse( h ) ) ) );
        od;
        
        for e in Equations do
            r_a := e[ 2 ];
            r_b := e[ 5 ];
            g_a := e[ 1 ];
            g_b := e[ 4 ];
            j_a := e[ 3 ];
            j_b := e[ 6 ];
            h_a := Solutions[ j_a ][ r_a ];
            h_b := Solutions[ j_b ][ r_b ];
            Add( v , h_b * g_b * Inverse( g_a ) * Inverse( h_a ) );
        od;

        V := Subgroup( group, v );

        for i in [ 1 .. k ] do
            U_i := RepresentativeOfSubgroupsUpToConjugation( i );
            for g in group do
                if ConjugateSubgroup( V, Inverse( g ) ) = U_i then # TODO: g oder Inverse( g )?
                    for p in RangePositions do
                        r := p[ 1 ];
                        j := p[ 2 ];
                        Solutions[ j ][ r ] := g * Solutions[ j ][ r ]; 
                    od;
                    return [ i, Solutions, g ];
                fi;
            od;
        od;
        
    end;

    ##
    AddProjectionOntoCoequalizer( SkeletalGSets,
      function( D )
        local A, B, M, N, Cq, ProcessedImagePositions, imgs, j, r, PreimagePositions, f, i, l, ImagePositions, p, img, temp, pos, Solutions;
        
        A := Source( D[ 1 ] );
        B := Range( D[ 1 ] );

        M := AsList( A );
        N := AsList( B );
        
        Cq := IntZeroVector( k );
        
        ProcessedImagePositions := [];
        
        imgs := List( [ 1 .. k ], x -> [] );
        
        for j in [ 1 .. k ] do
            for r in [ 1 .. N[ j ] ] do 
                if [ r, j ] in ProcessedImagePositions then
                    continue;
                fi;
                
                PreimagePositions := [];
                
                for f in D do
                    for i in [ 1 .. k ] do
                        for l in [ 1 .. M[ i ] ] do
                            if AsList( f )[ i ][ l ][ 1 ] = r and AsList( f )[ i ][ l ][ 3 ] = j then
                                Add( PreimagePositions, [ l, i ] );
                            fi;
                        od; 
                    od;
                
                od;
                
                PreimagePositions := Set( PreimagePositions );
                
                ImagePositions := [ [ r, j ] ];
                
                for p in PreimagePositions do
                    for f in D do
                        img := AsList( f )[ p[ 2 ] ][ p[ 1 ] ];
                        Add( ImagePositions, [ img[ 1 ], img[ 3 ] ] );
                    od;
                od;
                
                ImagePositions := Set( ImagePositions );
                
                temp := CoequalizerOfAConnectedComponent( D, PreimagePositions, ImagePositions );
                
                pos := temp[ 1 ];
                Solutions := temp[ 2 ];
                
                Cq[ pos ] := Cq[ pos ] + 1;
                
                for p in ImagePositions do
                    imgs[ p[ 2 ] ][ p[ 1 ] ] := [ Cq[ pos ], Solutions[ p[ 2 ] ][ p[ 1 ] ] , pos ]; 
                od;
                
                ProcessedImagePositions := Union2( ProcessedImagePositions, ImagePositions );
            od;
        od; 
        
        return MapOfGSets( Range( D[ 1 ] ), imgs , Cq );
        
    end );

    ##
    AddUniversalMorphismFromCoequalizer( SkeletalGSets,
      function( D, tau )
        local T, A, B, M, N, Cq, ProcessedImagePositions, imgs, j, r, PreimagePositions, f, i, l, ImagePositions, p, img, temp, pos, Solutions, first_image_position, g;
        
        T := Range( tau );
        
        A := Source( D[ 1 ] );
        B := Range( D[ 1 ] );

        M := AsList( A );
        N := AsList( B );
        
        Cq := IntZeroVector( k );
        
        ProcessedImagePositions := [];
        
        imgs := List( [ 1 .. k ], x -> [] );
        
        for j in [ 1 .. k ] do
            for r in [ 1 .. N[ j ] ] do 
                if [ r, j ] in ProcessedImagePositions then
                    continue;
                fi;
                
                PreimagePositions := [];
                
                for f in D do  
                    for i in [ 1 .. k ] do
                        for l in [ 1 .. M[ i ] ] do
                            if AsList( f )[ i ][ l ][ 1 ] = r and AsList( f )[ i ][ l ][ 3 ] = j then
                                Add( PreimagePositions, [ l, i ] );
                            fi;
                        od; 
                    od;
                
                od;
                
                PreimagePositions := Set( PreimagePositions );
                
                ImagePositions := [ [ r, j ] ];
                
                for p in PreimagePositions do
                    for f in D do
                        img := AsList( f )[ p[ 2 ] ][ p[ 1 ] ];
                        Add( ImagePositions, [ img[ 1 ], img[ 3 ] ] );
                    od;
                od;
                
                ImagePositions := Set( ImagePositions );
                
                temp := CoequalizerOfAConnectedComponent( D, PreimagePositions, ImagePositions );
                
                pos := temp[ 1 ];
                Solutions := temp[ 2 ];
                g := temp[ 3 ];
                
                Cq[ pos ] := Cq[ pos ] + 1;
                
                first_image_position := ImagePositions[ 1 ];
                img := AsList(tau)[ first_image_position[ 2 ] ][ first_image_position[ 1 ] ];
                
                Add( imgs[ pos ], [ img[ 1 ], img[ 2 ] * Inverse( g ), img [ 3 ] ] );
                
                ProcessedImagePositions := Union2( ProcessedImagePositions, ImagePositions );
            od;
        od;
        
        return MapOfGSets( Cq, imgs, Range( tau ) );
        
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
