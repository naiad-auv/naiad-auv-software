##Shared-Part linked Makefile
##Version 0.03&½

#Root Directory
ROOT_DIRECTORY = ./

#Auto-generate directories
DIRS := ${sort ${dir ${wildcard ${ROOT_DIRECTORY}/*/${ROOT_DIRECTORY}/*/*/}}}


#OpenCV object
OCVOB = visionBindings/visionBindings

#Package List
CSC_LIST = image imagepreprocessing imageprocessing mission

#Main program
MAIN = src/main

#source objects
IMAGEMAIN = image/src/vision-image
PREPROMAIN = imagepreprocessing/src/vision-image_preprocessing

#additional source directories - use only with gnatmake
VISIONSRCDIR = src/
VISIONBINDINGSDIR = visionBindings/
IMAGESRCDIR = image/src/
IMAGEPREPROCESSINGSRCDIR = imagepreprocessing/src/
IMAGEPROCESSINGSRCDIR = imageprocessing/src/

#additional object directories - use only with gnatbind
VISIONOBJDIR = obj/
IMAGEOBJDIR = image/obj/
IMAGEPREPROCESSINGOBJDIR = imagepreprocessing/obj/
IMAGEPROCESSINGOBJDIR = imageprocessing/obj/

#additional ob
ADDOBJ1 = visionBindings/visionBindings.o

#additional ob
#ADDOBJ2 = visionBindings/visionbindings_hpp.o

#-fPIC, not needed
NEED_FPIC = -fPIC

#g++ directory
GPLUS = /usr/bin/g++-4.6

#path for gnatlib.so , through 'gnatls -v'
GLIB = /usr/gnat/lib/gcc/x86_64-pc-linux-gnu/4.7.4/adalib/

#Library directories
#Expanded from Package List
LIB_DIR = ${foreach dir,${CSC_LIST},${dir}/lib/lib${dir}.so}

${MAIN} : objects imageobject preproobject ${LIB_DIR}
	gnatbind -aO${VISIONBINDINGSDIR} -aO${IMAGEOBJDIR} -aO${IMAGEPREPROCESSINGOBJDIR} -aO${IMAGEPROCESSINGOBJDIR} ${MAIN} ${CSC_LIST :%=-a0%/lib } -shared #--LINK=${GPLUS}
	gnatlink -f ${MAIN} ${CSC_LIST :%= -l%} ${ADDOBJ1} --LINK=g++ -lstdc++ `pkg-config opencv --cflags --libs`  #${GPLUS}

objects : 
	#recompile the sources
	gnatmake -aI${VISIONBINDINGSDIR} -aI${IMAGESRCDIR} -aI${IMAGEPREPROCESSINGSRCDIR} -aI${IMAGEPROCESSINGSRCDIR} -c -d -i -m64 -gnat05 -gnato -gnatwa -fstack-check -o ${MAIN} ${MAIN}.adb ${NEED_FPIC} ${CSC_LIST :%= -I%} -largs ${OCVOB}.o -lstdc++ `pkg-config opencv --cflags --libs`

imageobject :
	gnatmake -aI${VISIONBINDINGSDIR} -aI${IMAGESRCDIR} -aI${VISIONSRCDIR} -aO${VISIONBINDINGSDIR} -aO${IMAGEOBJDIR} -aO${VISIONOBJDIR} -c -d -i -m64 -gnat05 -gnato -gnatwa -fstack-check -o ${IMAGEMAIN} ${IMAGEMAIN}.adb ${NEED_FPIC} ${CSC_LIST :%= -I%} -largs ${OCVOB}.o -lstdc++ `pkg-config opencv --cflags --libs`

preproobject :
	gnatmake -aI${VISIONBINDINGSDIR} -aI${IMAGEPREPROCESSINGSRCDIR} -aI${VISIONSRCDIR} -aO${VISIONBINDINGSDIR} -aO${IMAGEPREPROCESSINGOBJDIR} -aO${VISIONOBJDIR} -c -d -i -m64 -gnat05 -gnato -gnatwa -fstack-check -o ${PREPROMAIN} ${PREPROMAIN}.adb ${NEED_FPIC} ${CSC_LIST :%= -I%} -largs ${OCVOB}.o -lstdc++ `pkg-config opencv --cflags --libs`

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
