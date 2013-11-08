# pragma Profile(Ravenscar);
# pragma Profile(Restricted);

.PHONY: clean

ravenscar: clean
	echo "pragma Profile(Ravenscar);" > project_pragmas
	gnatmake -d -p -P example1.gpr

restricted: clean
	echo "pragma Profile(Restricted);" > project_pragmas
	gnatmake -d -p -P example1.gpr

all: clean
	echo "" > project_pragmas
	gnatmake -d -p -P example1.gpr

clean:
	rm -rf obj/*.o
	rm -rf obj/*.ali
	rm -rf obj/main

