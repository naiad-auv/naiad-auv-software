#include <stdlib.h>
#include <stdio.h>
#include <string>

void appendImg_Wrap(char * src);

void cvtColor_Wrap(int src, int dst, int filter);

void Canny_Wrap(int src, int dst, int lThresh, int hThresh, int kernelSize);

void imshow_Wrap(char * name, int src);

void waitKey_Wrap(void);

void imread_Wrap(char * name);

int imwrite_Wrap(char * name, int src);

int size_Wrap(void);
