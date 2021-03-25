
MYDIR = .
index.md: $(MYDIR)/*
	echo -n "# " >$@
	basename `pwd` >>$@
	for file in $^ ; do \
	  echo "* ["$${file}"](./"$$file")" >>$@; \
	done
	git add $@
	git commit -m "Autogenereted index"
