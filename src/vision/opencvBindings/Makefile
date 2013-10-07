mainmake: main.adb coreada_hpp.ads
	gnatmake -m64 -gnat05 -gnato -gnatwa -fstack-check -o main main.adb -largs ./coreAda.o -lstdc++ `pkg-config opencv --cflags --libs`
