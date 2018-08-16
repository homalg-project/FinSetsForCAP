all: doc test

doc: doc/manual.six

doc/manual.six: makedoc.g \
		PackageInfo.g \
		doc/Doc.autodoc \
		gap/*.gd gap/*.gi examples/*.g examples/doc/*.g
			gap makedoc.g

clean:
	(cd doc ; ./clean)

test: doc
	gap maketest.g

test-tabs:
	! grep -RP "\t" examples/ gap/

test-overfull-hboxes:
	gap makedoc_with_overfull_box_warnings.g | perl -pe 'END { exit $$status } $$status=1 if /Overfull \\hbox/;'

test-with-coverage: doc
	gap --cover stats maketest.g | perl -pe 'END { exit $$status } $$status=1 if /Expected output/;'
	echo 'LoadPackage("profiling"); OutputJsonCoverage("stats", "coverage.json");' | gap

ci-test: test-tabs test-overfull-hboxes test-with-coverage
