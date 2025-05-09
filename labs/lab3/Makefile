
MYDIR = .
index.md: $(MYDIR)/*
	echo -n "# " >$@
	basename `pwd` >>$@
	for file in $^ ; do \
	  [ "$${file}" == "Makefile" ] && continue; \
	  echo "* ["$${file}"](./"$$file")" >>$@; \
	done 
	git add $@
	git commit -m "Autogenereted index"
