#! @System SkeletalGSets

LoadPackage( "FinSets" );

#! @Example
S3 := SymmetricGroup( 3 );
#! Sym( [ 1 .. 3 ] )
M1 := GSet( S3, [ 2, 1, 0, 0 ]);
#! <An object in Skeletal Category of -Sets>
M2 := GSet( S3, [1,1,0,0]);
#! <An object in Skeletal Category of -Sets>
M3 := GSet( S3, [2,1,0,0]);
#! <An object in Skeletal Category of -Sets>
M4 := GSet( S3, [2,0,0,0]);
#! <An object in Skeletal Category of -Sets>
C := Coproduct([M1,M2,M3,M4]);
#! <An object in Skeletal Category of -Sets>
tau1 := InjectionOfCofactorOfCoproduct([M1,M2,M3,M4], 1);
#! <A morphism in Skeletal Category of -Sets>
tau2 := InjectionOfCofactorOfCoproduct([M1,M2,M3,M4], 2);
#! <A morphism in Skeletal Category of -Sets>
tau3 := InjectionOfCofactorOfCoproduct([M1,M2,M3,M4], 3);
#! <A morphism in Skeletal Category of -Sets>
tau4 := InjectionOfCofactorOfCoproduct([M1,M2,M3,M4], 4);
#! <A morphism in Skeletal Category of -Sets>
tau := [ tau1, tau2, tau3, tau4 ];
#! [ <A morphism in Skeletal Category of -Sets>, <A morphism in Skeletal Category of -Sets>, <A morphism in Skeletal Category of -Sets>, <A morphism in Skeletal Category of -Sets> ]
D := [M1, M2, M3, M4];
#! [ <An object in Skeletal Category of -Sets>, <An object in Skeletal Category of -Sets>, <An object in Skeletal Category of -Sets>, <An object in Skeletal Category of -Sets> ]
id_to_be := UniversalMorphismFromCoproduct(D, tau);
#! <A morphism in Skeletal Category of -Sets>
id := IdentityMorphism(C);
#! <An identity morphism in Skeletal Category of -Sets>
id_to_be = id;
#! true

T := TerminalObject( M1 );
#! <An object in Skeletal Category of -Sets>
pi1 := UniversalMorphismIntoTerminalObject( M1 );
#! <A morphism in Skeletal Category of -Sets>
pi2 := UniversalMorphismIntoTerminalObject( M2 );
#! <A morphism in Skeletal Category of -Sets>
pi3 := UniversalMorphismIntoTerminalObject( M3 );
#! <A morphism in Skeletal Category of -Sets>
pi4 := UniversalMorphismIntoTerminalObject( M4 );
#! <A morphism in Skeletal Category of -Sets>
pi := [ pi1, pi2, pi3, pi4 ];
#! [ <A morphism in Skeletal Category of -Sets>, <A morphism in Skeletal Category of -Sets>, <A morphism in Skeletal Category of -Sets>, <A morphism in Skeletal Category of -Sets> ]
universal_morphism_into_terminal_object_to_be := UniversalMorphismFromCoproduct(D, pi);
#! <A morphism in Skeletal Category of -Sets>
universal_morphism_into_terminal_object_to_be = UniversalMorphismIntoTerminalObject( C );
#! true

phi := MapOfGSets( M1, [ [ [ 1, (), 2 ], [ 1, (), 2 ] ], [ [ 1, (), 2 ] ], [], [] ], M1 );
#! <A morphism in Skeletal Category of -Sets>
IsWellDefined(phi);
#! true
I := ImageObject(phi);
#! <An object in Skeletal Category of -Sets>
IsEpimorphism( phi );
#! false
IsEpimorphism( id );
#! true
IsEpimorphism( universal_morphism_into_terminal_object_to_be );
#! true

psi := ImageEmbedding( phi );
#! <A monomorphism in Skeletal Category of -Sets>
phi_res := CoastrictionToImage( phi );
#! <An epimorphism in Skeletal Category of -Sets>
phi = PreCompose( phi_res, psi );
#! true

A := GSet( S3, [0, 1, 0, 0] );
#! <An object in Skeletal Category of -Sets>
B := GSet( S3, [0, 1, 0, 0] );
#! <An object in Skeletal Category of -Sets>
pi1 := ProjectionInFactorOfDirectProduct( [ A, B ], 1 );
#! <A morphism in Skeletal Category of -Sets>
pi2 := ProjectionInFactorOfDirectProduct( [ A, B ], 2 );
#! <A morphism in Skeletal Category of -Sets>
AsList(pi1);
#! [ [ [ 1, RightCoset(Group([ (2,3) ]),()), 2 ] ], 
#!  [ [ 1, RightCoset(Group([ (2,3) ]),()), 2 ] ], [  ], [  ] ]
AsList(pi2);
#! [ [ [ 1, RightCoset(Group([ (2,3) ]),(1,3)), 2 ] ], 
#!  [ [ 1, RightCoset(Group([ (2,3) ]),()), 2 ] ], [  ], [  ] ]

#! @EndExample
