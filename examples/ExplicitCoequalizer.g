LoadPackage("FinSets");
S5 := SymmetricGroup( 5 );

U_2 := RepresentativeTom( TableOfMarks( S5 ), 2 );
U_4 := RepresentativeTom( TableOfMarks( S5 ), 4 );
U_9 := RepresentativeTom( TableOfMarks( S5 ), 9 );
U_11 := RepresentativeTom( TableOfMarks( S5 ), 11 );


g_1 := ();
g_2 := (1,2);
g_3 := (1,3);
g_4 := (1,3);

A := GSet( S5, [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ] );
B := GSet( S5, [ 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ] );
C := GSet( S5, [ 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ] );
Display( IsWellDefined( MapOfGSets(A, [ [ [ 1, g_1, 2 ] ], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [] ], B) ) );
Display( IsWellDefined( MapOfGSets(A, [ [ [ 1, g_2, 4 ] ], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [] ], C) ) );
Display( IsWellDefined( MapOfGSets(A, [ [ [ 1, g_3, 2 ] ], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [] ], B) ) );
Display( IsWellDefined( MapOfGSets(A, [ [ [ 1, g_4, 4 ] ], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [] ], C) ) );


S5 := SymmetricGroup( 5 );
g_1_1 := ();
g_1_2 := (1,2);
g_1_3 := (1,3);
g_1_4 := (1,4);

g_2_1 := ();
g_2_2 := (1,2);
g_2_3 := ();
g_2_4 := (1,2);

g_3_1 := ();
g_3_2 := (1,2);
g_3_3 := (1,3);
g_3_4 := (1,3);


A := GSet( S5, [ 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ] );
B := GSet( S5, [ 0, 3, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ] );
f_1 := MapOfGSets(A, [ [ [ 1, g_1_1, 2 ], [ 1, g_1_3, 2], [ 2, g_2_1, 2 ], [ 2, g_2_3, 2], [ 3, g_3_1, 2 ], [ 3, g_3_3, 2] ], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [] ], B);
f_2 := MapOfGSets(A, [ [ [ 1, g_1_2, 4 ], [ 1, g_1_4, 4], [ 2, g_2_2, 4 ], [ 2, g_2_4, 4], [ 3, g_3_2, 4 ], [ 3, g_3_4, 4] ], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [] ], B);
Display(IsWellDefined( f_1 ));
Display(IsWellDefined( f_2 ));
D := [ f_1, f_2 ];
Cq := Coequalizer( D );
Display( Cq );
pi := ProjectionOntoCoequalizer( D );
IsWellDefined( pi );

id_to_be := UniversalMorphismFromCoequalizer( D, pi );
id := IdentityMorphism( Cq );
Display(IsWellDefined( id_to_be ));
Display( id = id_to_be );

AreEquivalent := function(G, e, b)
	local g_e, U_e, g_b, U_b, g;
	g_e := e[1];
	U_e := e[2];
	g_b := b[1];
	U_b := b[2];
	if U_e = U_b then
		if U_e * g_e = U_b * g_b then
			Error( "this should not happen" );
		fi;
		return false;
	fi;
	for g in G do
		if (U_e * g_1 * g = U_e * g_e and U_b * g_2 * g = U_b * g_b) or (U_e * g_3 * g = U_e * g_e and U_b * g_4 * g = U_b * g_b) then
			return true;
		fi;
	od;
	return false;
end;


B := [];
for g in S5 do
	Add( B, [ CanonicalRightCosetElement( U_2, g) , U_2 ] );
	Add( B, [ CanonicalRightCosetElement( U_4, g) , U_4 ] );
od;
B := Set( B );

equivalence_classes := [];
for b in B do
	first_equivalence_class := 0;
	for i in [ 1 .. Length( equivalence_classes ) ] do
		class := equivalence_classes[ i ];
		for j in [ 1 .. Length( class ) ] do
			element := class[ j ];
			# prüfe ob element ~ b
			if AreEquivalent( S5, element, b) then
				if first_equivalence_class > 0 then
					# merge class und first_equivalence_class
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
Display(equivalence_classes);
Display(Size(equivalence_classes));

OurAction := function( pnt, g )
	local representative, g_r, U_r, result, class;
	
	representative := pnt[ 1 ];
	
	g_r := representative[ 1 ];
	U_r := representative[ 2 ];
	
	result := CanonicalRightCosetElement( U_r, g_r * g );
	for class in equivalence_classes do
		if [ result, U_r ] in class then
			return class;
		fi;
	od;
end;

external_set := ExternalSet( S5, equivalence_classes, OurAction );
stab := Stabilizer( S5, equivalence_classes, equivalence_classes[ 1 ], OurAction );
Display(stab);
OurPositionOfSubgroup := function( U )
    local i;

    for i in [ 1..19 ] do
        if U in ConjugateSubgroups( S5, RepresentativeTom( TableOfMarks( S5 ), i ) ) then
            return i;
        fi;
    od;
	Error( "this should not happen" );
end;
Display(OurPositionOfSubgroup( stab ));
