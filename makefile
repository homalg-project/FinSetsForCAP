all: doc test

doc: doc/manual.six

doc/manual.six: makedoc.g \
		PackageInfo.g \
		doc/Doc.autodoc \
		gap/*.gd gap/*.gi examples/*.g examples/doc/*.g
	        gap makedoc.g

doc_with_overfull_box_warnings: makedoc_with_overfull_box_warnings.g \
		PackageInfo.g \
		doc/Doc.autodoc \
		gap/*.gd gap/*.gi examples/*.g examples/doc/*.g
	        gap makedoc_with_overfull_box_warnings.g

clean:
	(cd doc ; ./clean)

test:	doc
	gap maketest.g

coverage:	doc
	gap --cover stats maketest.g
	echo 'LoadPackage("profiling"); OutputJsonCoverage("stats", "coverage.json");' | gap
