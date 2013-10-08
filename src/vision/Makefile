##Shared-Part linked Makefile
##Version 0.02&½

#Root Directory
ROOT_DIRECTORY = ./

#Auto-generate directories
DIRS := ${sort ${dir ${wildcard ${ROOT_DIRECTORY}/*/${ROOT_DIRECTORY}/*/*/}}}


#OpenCV object
OCVOB = opencvBindings/coreAda

#Package List
CSC_LIST = image imagepreprocessing imageprocessing mission 

#Main program
MAIN = src/vision

#-fPIC, not needed
NEED_FPIC = -fPIC

#path for gnatlib.so , through 'gnatls -v'
GLIB = /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/adalib/

#Library directories
#Expanded from Package List
LIB_DIR = ${foreach dir,${CSC_LIST},${dir}/lib/lib${dir}.so}

${MAIN} : objects ${LIB_DIR}
	gnatbind ${MAIN} ${CSC_LIST :%=-a0%/lib } -shared
	gnatlink ${MAIN} ${CSC_LIST :%= -l%}

objects : 
	#recompile the sources
	gnatmake -c -d -i -m64 -gnat05 -gnato -gnatwa -fstack-check -o ${MAIN} ${MAIN}.adb ${NEED_FPIC} ${CSC_LIST :%= -I%} -largs ${OCVOB}.o -lstdc++ `pkg-config opencv --cflags --libs`

#checkout 'gnatmlib' ??
# THIS SECTION STILL NEEDS MASSIVE EDITS TO SUIT OUR REQUIREMENTS - consult Gerard
#
${LIB_DIR} : 
	mkdir -p ${dir $@}
	cd ${dir $@} && gcc -shared -o ${notdir $} ../obj/*.o -L${GLIB}	-lgnat
	cd ${dir $@} && cp -f ../obj/*.ali .

#Dependencies for the modules
image/lib/libimageimage.so : image/obj/*.o
image/lib/libmission.so : mission/obj/*.o
imagepreprocessing/lib/libimagepreprocessing.so : imagepreprocessing/obj/*.o

run ::
	LD_LIBRARY_PATH = `pwd`/image/lib:`pwd`/imagepreprocessing/lib:`pwd`/mission/lib ./${MAIN} 

clean :: 
	${RM} -rf ${CSC_LIST :%=%/lib}
	${RM} ${CSC_LIST :%=%/*.ali}
	${RM} ${CSC_LIST :%=%/*.o}
	${RM} *.o *.ali ${MAIN} 
