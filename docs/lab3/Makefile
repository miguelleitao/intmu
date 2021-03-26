
MYDIR = .
index.md: $(MYDIR)/*
	echo -n "# " >$@
	basename `pwd` >>$@
	for file in $^ ; do \
          if [ "$file" -e "Makefile" ] continue; \
	  echo "* ["$${file}"](./"$$file")" >>$@; \
	done
	git add $@
	git commit -m "Autogenereted index"
