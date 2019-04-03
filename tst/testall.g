options := rec(
    exitGAP := true,
    testOptions := rec(
        compareFunction := "uptowhitespace"
    ),
);
TestDirectory( DirectoriesPackageLibrary( "FinSetsForCAP", "tst" ), options );
FORCE_QUIT_GAP( 1 );
