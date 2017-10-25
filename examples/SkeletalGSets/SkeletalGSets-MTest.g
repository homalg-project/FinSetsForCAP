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


#! IdentityMorphism

s3:=SymmetricGroup( 3 );
#! Sym( [ 1 .. 3 ] )
M := GSet( s3, [1, 2, 1, 2]);
#! <An object in SkeletalGSets>
iota := IdentityMorphism( M );
#! <An identity morphism in SkeletalGSets>
IsWellDefined( iota );
#! true
AsList( iota );
#! [ [ [ 1, (), 1 ] ], [ [ 1, (), 2 ], [ 2, (), 2 ] ], [ [ 1, (), 3 ] ], [ [ 1, (), 4 ], [ 2, (), 4 ] ] ]

#! PreCompose

S3:=SymmetricGroup( 3 );
#! Sym( [ 1 .. 3 ] )
S := GSet( S3, [ 1, 0, 0, 0 ] );
#! <An object in SkeletalGSets>
R := GSet( S3, [ 1, 0, 0, 0 ] );
#! <An object in SkeletalGSets>
T := GSet( S3, [ 1, 0, 0, 0 ] );
#! <An object in SkeletalGSets>
psi1 := MapOfGSets( S, [ [ [ 1, (1, 2), 1 ] ], [], [], [] ], R );
#! <A morphism in SkeletalGSets>
IsWellDefined( psi1);
#! true
psi2  := MapOfGSets( R, [ [ [ 1, (1, 2, 3), 1 ] ] , [], [], [] ] ,T );
#! <A morphism in SkeletalGSets>
IsWellDefined( psi2);
#! true
PreCompose(psi1, psi2);
#! <A morphism in SkeletalGSets>
phi := PreCompose(psi1, psi2);
#! <A morphism in SkeletalGSets>
IsWellDefined( phi);
#! true
AsList( phi);
#! [ [ [ 1, (2,3), 1 ] ], [  ], [  ], [  ] ]

#! TerminalObject

S3:=SymmetricGroup( 3 );
#! Sym( [ 1 .. 3 ] )
S := GSet( S3, [ 2, 2, 0, 0 ] );
#! <An object in SkeletalGSets>
u := UniversalMorphismIntoTerminalObject( S );
#! <A morphism in Skeletal Category of -Sets>
IsWellDefined( u );

#! PreCompose

S3:=SymmetricGroup( 3 );
#! Sym( [ 1 .. 3 ] )
S := GSet( S3, [ 2, 2, 0, 0 ] );
#! <An object in SkeletalGSets>
R := GSet( S3, [ 2, 1, 0, 0 ] );
#! <An object in SkeletalGSets>
T := GSet( S3,  [ 2, 1, 1, 0 ] );
#! <An object in SkeletalGSets>
psi1 := MapOfGSets( S, [ [ [ 2, (1,2), 1 ], [ 1, (1,2,3), 2 ] ], [ [ 1, (), 2 ], [ 1, (1,2,3), 2 ] ], [], [] ], R );
#! <A morphism in SkeletalGSets>
IsWellDefined( psi1 );
#! true
psi2 := MapOfGSets( R, [ [ [ 1, (1,3), 1 ], [ 1, (1,2,3), 3 ] ], [ [ 1, (1,2), 2 ] ], [], [] ], T );
#! <A morphism in SkeletalGSets>
IsWellDefined( psi2 );
#! true
pi := PreCompose( psi1, psi2 );
#! <A morphism in SkeletalGSets>
AsList( pi);
#! [ [ [ 1, (2,3), 3 ], [ 1, (1,3), 2 ] ], [ [ 1, (1,2), 2 ], [ 1, (1,3), 2 ] ], [  ], [  ] ]

#! Equalizer

S3:= SymmetricGroup( 3 );
#! Sym( [ 1 .. 3 ] )
s := GSet( S3, [1, 0, 2, 0]);
#! <An object in Skeletal Category of -Sets>
r := GSet(S3, [1, 2, 1, 0]);
#! <An object in Skeletal Category of -Sets>
psi1:=MapOfGSets(s, [ [ [1, (1, 2), 1] ], [], [ [1, (), 3], [1, (1, 2, 3), 3] ], [] ], r);
#! <A morphism in Skeletal Category of -Sets>
IsWellDefined( psi1);
#! true
psi2:=MapOfGSets(s, [ [[1, (1, 2), 3]], [], [[1, (), 3], [1, (), 3]], [] ], r);
#! <A morphism in Skeletal Category of -Sets>
IsWellDefined( psi2);
#! true
Eq := Equalizer( [ psi1, psi2 ] );
#! <An object in Skeletal Category of -Sets>
AsList( Eq );
#! [ 0, 0, 1, 0 ]

#! @EndExample