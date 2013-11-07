#include "visionBindings.hpp"
#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include "opencv2/opencv.hpp"
#include <vector>
#include<iostream>
#include<vector>
#include<string>
#include<queue>
 
std::vector<cv::Mat> img(IMAGE_STORE_SIZE);
std::vector<cv::Vec3f> circles;
std::vector<cv::Vec2f> lines;

std::vector<cv::Mat> contours;
std::vector<cv::Mat> templeteContours;

std::vector<cv::Mat> particleContours;
cv::VideoCapture cap;
std::vector<cv::Mat> channels;
 
std::queue <cv::Mat> imageBuf; // Declare a queue
int imageName=0;
//int imageName=1;
 
cv::vector<cv::Mat> BGR;
cv::Mat blueHistVals;
cv::Mat greenHistVals;
cv::Mat redHistVals;
cv::MatND hist,prevHist,currentHist;
 
std::vector<cv::Point> circleCenters;
std::vector<cv::Point> rectangleCenters;
std::vector<cv::Point> triangleCenters;

std::vector<cv::Point2f> features_prev, features_next;
std::vector<cv::Point2f> particle_features_prev, particle_features_nxt;
 
std::vector<cv::Mat> templateStore;
 
/*********************************************************************************************************************
*               START CORE WRAP                                                                                        *
*********************************************************************************************************************/
//////////////////////////////////////    IMAGE BUFFER FUNC   ////////////////////////////////////////////////////////////////////////
//func that loads in images in buffer of size IMAGE_BUFFER_SIZE(uses queue func from c++, and creates a queue of IMAGE_BUFFER_SIZE
//It loads buffer and replaces the image at img.at(0)
//NB takes images from a folder at the minute, this will need to be changed when the real input method for the system
//becomes available.

void Core_Wrap::img_buffer()
{
    char strStorage[50]; // enough to hold all numbers up to 64-bits
    int bufSize=0;
  
    //std::string folderPath = "/home/vision/Documents/project/cdt508/Robosub2012_logging/Loggning/log 3/Bottom/";
    //std::string folderPath = "//home/bork/Data/cdt508/Robosub2012_logging/Loggning/log 3/Bottom/";
    //std::string folderPath = "/home/gerard/Documents/project/cdt508/Robosub2012_logging/Loggning/log 3/Bottom/";
    
    //std::string folderPath = "/home/gerard/Downloads/pix/";
	std::string folderPath = "/home/vision/Downloads/pix/";
    
    std::string result;
    std::string imageType = ".jpg";
  
    if (imageBuf.size()==0)//load image, then pop image and enter do loop
    {
        sprintf(strStorage, "%d", imageName);//imageName global, set to 1, and increases as prog scrolls through images in folder
        result = folderPath + strStorage + imageType;
        cv::Mat F=cv::imread(result,1);//<0 unchanged, 0 greyscale, >0 rgb
        imageBuf.push(F);
      
        //for tracking, need to store previous image somewhere
        imageName++;
        sprintf(strStorage, "%d", imageName);//imageName global, set to 1, and increases as prog scrolls through images in folder
        result = folderPath + strStorage + imageType;
        F=cv::imread(result,1);//<0 unchanged, 0 greyscale, >0 rgb
        imageBuf.push(F);
      
        img.at(0)=imageBuf.front();//get new current image for position 0
        imageBuf.pop();
     }
     img.at(1)=img.at(0).clone();//store previous image at position 1
     img.at(0)=imageBuf.front();//get new current image for position 0
     imageBuf.pop();
    
     //load buffer
     do
     {
        sprintf(strStorage, "%d", imageName);
        result = folderPath + strStorage + imageType;
        cv::Mat F=cv::imread(result,1);//<0 unchanged, 0 greyscale, >0 rgb
        imageBuf.push(F);
        imageName=imageName+1;
        bufSize=imageBuf.size();
     }while (bufSize<IMAGE_BUFFER_SIZE);
   
     std::cout<<"image "<<imageName;
}

 
///////////////////////////////////// PRINT INTERFACES.C.INT ////////////////////////////////////////////
 
void Core_Wrap::printNum(int num)
{
    std::cout<<"\n number entered is:\t"<<num;
}
 
 
///////////////////////////////////// ADD IMAGE TO VECTOR img ////////////////////////////////////////////
 
void Core_Wrap::push_back_templeteStore(char * src)
{
    templateStore.push_back(cv::imread(src));
}
 
 
///////////////////////////////////// READ IN IMAGE ////////////////////////////////////////////
 
void Core_Wrap::imread(char * name)
{
    cv::imread(name);
}
 
 
///////////////////////////////////// STORE IMAGE IN img AT src POSITION ////////////////////////////////////////////
 
void Core_Wrap::imstore(int src, char * name)
{
    img.at(src)=cv::imread(name);
}
 
 
///////////////////////////////////// WRITE IMAGE TO FILE ////////////////////////////////////////////
 
int Core_Wrap::imwrite(char * name, int src)
{
    if (cv::imwrite(name, img.at(src)))
        return 1;
    else
        return 0;
}
 
 
///////////////////////////////////// DISPLAY IMAGE ////////////////////////////////////////////
 
void Core_Wrap::imshow(char * name, int src)
{
    cv::imshow(name, img.at(src));
}
 
 
///////////////////////////////////// WAIT FOR KEY PRESS ////////////////////////////////////////////
 
void Core_Wrap::waitKey(int time)
{
    cv::waitKey(time);
}
 
 
///////////////////////////////////// FIND SIZE OF IMAGE AT img.at(src)  ////////////////////////////////////////////
 
int Core_Wrap::size(void)
{
    return img.size();
}
 
 
Core_Wrap::Core_Wrap(){}
/*********************************************************************************************************************
*               END CORE WRAP                                                                                        *
*********************************************************************************************************************/
 
 
/*********************************************************************************************************************
*               START PROCESSING WRAP                                                                                *
*********************************************************************************************************************/
 
////////////////////////////////////////  CONVERT FUNCTION /////////////////////////////////////////////////////
 
void Processing_Wrap::cvtColor(int src, int dst, int filter)
{
    cv::cvtColor(img.at(src), img.at(dst), filter);
}
 
 
//////////////////////////////////////// CANNY  /////////////////////////////////////////////////////
// NB Canny works on an input greyscale image
 
void Processing_Wrap::Canny(int src, int dst, int lThresh, int hThresh, int kernelSize)
{
    cv::Canny(img.at(src), img.at(dst), lThresh, hThresh, kernelSize);
}
 
 
//////////////////////////////////////HOUGH CIRCLES//////////////////////////////////////////////////////////////
// Takes in source image index, stores result in circles vector defined above
 
void Processing_Wrap::HoughCircles(int src,int inverseRatioOfResolution,int minDistBetweenCenters,int cannyUpThres, int centerDetectionThreshold, int minRadius,int maxRadius )
{
    cv::HoughCircles( img.at(src), circles, CV_HOUGH_GRADIENT, inverseRatioOfResolution, minDistBetweenCenters, cannyUpThres, centerDetectionThreshold, minRadius, maxRadius );
    std::cout<<"circles:\t\t"<<circles.size()<<std::endl;
}
 
 
///////////////////////////////DRAW CIRCLES ///////////////////////////////////////////////
// Draw the hough circles detected, Gets input from circles vector defined above,
// NB This function will be removed, only used for testing
 
void Processing_Wrap::DrawHoughCircles(int src)
{
    int i;
   
    img.at(24)=img.at(src).clone();
  
    for( size_t i = 0; i < circles.size(); i++ )
    {
        cv::Point center(cvRound(circles[i][0]), cvRound(circles[i][1]));
        int radius = cvRound(circles[i][2]);
        // circle center im source, center of circle, radius, color, thickness, linetype, shift
        cv::circle( img.at(24), center, 3, cv::Scalar(0,255,0), -1, 8, 0 );
        // circle outline
        cv::circle( img.at(24), center, radius, cv::Scalar(0,0,255), 3, 8, 0 );
     }
}
 
void Processing_Wrap::FindCircleCenters(void)
{
    for(int i=0; i<circles.size();i++)
    {
        cv::Point center(cvRound(circles[i][0]), cvRound(circles[i][1]));
        circleCenters.push_back(center);
    }
    std::cout<<"centers are \t\t"<<circleCenters;
}


/////////////////////////////// IMAGE INTENSITY FUNCTION////////////////////////////////////7
// This function searches through an image at img.at(src) pixel by pixel and prints the intensity
// value for each picture
//NB "print" has to be changed to "add to a storage vector" if it is decided that this function
//is needed. At the minute it is surplus to requirements but this will more than likely change
 
void Processing_Wrap::LabelPoints(int src)
{
    int x,y;
    x=y=0;
    cv::Size dim = img.at(src).size();
    cv::Mat F = img.at(src).clone();
    cv::Scalar intensity;
 
    for(int heightIndex=0;heightIndex<dim.height;++heightIndex)
    {
        std::cout<<"change height";
        for(int widthIndex=0;widthIndex<dim.width;++widthIndex)
        {
            intensity = F .at<uchar>(cv::Point(widthIndex,heightIndex));
            std::cout<< intensity.val[0];
        }
    }
    std::cout<<"height"<<dim.height<<"width"<<dim.width;
    cv::waitKey(0);
}
 
 
////////////////////////////////////HOUGH LINES////////////////////////////////////////////

void Processing_Wrap::HoughLines(int src, int rho, float theta, int intersectionThreshold)
{
    cv::HoughLines( img.at(src), lines, rho, theta, intersectionThreshold, 0, 0 );  
}
 
 
///////////////////////////////DRAW HOUGH LINES////////////////////////////////////////////
 
void Processing_Wrap::DrawHoughLines(int cdst)
{
    int i;
 
    for( size_t i = 0; i < lines.size(); i++ )
    {
        float rho = lines[i][0], theta = lines[i][1];
        cv::Point pt1, pt2;
        double a = cos(theta), b = sin(theta);
        double x0 = a*rho, y0 = b *rho;
 
        pt1.x = cvRound(x0 + 1000*(-b));
        pt1.y = cvRound(y0 + 1000*(a));
        pt2.x = cvRound(x0 + 1000*(-b));
        pt2.y = cvRound(y0 + 1000*(a));
        line( img.at(cdst), pt1, pt2, cv::Scalar(0,0,255), 10, CV_AA);
        cv::imshow("liney", img.at(cdst));  
    }
}

 
///////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////// Contours ////////////////////////////////////////////
 
void Processing_Wrap::Contours(int src)
{
    cv::findContours( img.at(src), contours, CV_RETR_LIST, CV_CHAIN_APPROX_NONE);
}
 
 
/////////////////////////////////////// DISPLAY CONTOURS ///////////////////////////////////////////
 
void Processing_Wrap::showContours(int src, int contourOut, int contourId = -1, int thickness = 1)
{
    img.at(contourOut)=img.at(src).clone();
    cv::drawContours(img.at(contourOut), contours, contourId, cv::Scalar(0,0,255), thickness, CV_AA );
}

 
////////////////////////// HOUGH LINES P //////////////////////////////////////////////////////

void Processing_Wrap::HoughLinesP(int src)
{
    std::vector<cv::Vec4i> houLineStorage;
    double rho =1;
    double theta =    3.14/180;
    int threshold = 10;
    double minLineLength,maxLineGap;
   
    cv::HoughLinesP(img.at(src), houLineStorage, rho, theta, threshold, minLineLength=250,  maxLineGap=0 );
    if (houLineStorage.size()>0)
    {
        std::cout<<"line detected\n"<<houLineStorage.size();
        for(int i=0;i<houLineStorage.size();i++)
        {
            std::cout<<"line detected\n"<<houLineStorage[i][0]<<"\t"<<houLineStorage[i][1]<<"\t"<<houLineStorage[i][2]<<"\t"<<houLineStorage[i][3];
        }
        cv::waitKey(0);
    }   
}


////////////////////////// APPROX POLY //////////////////////////////////////////////////////
 
void Processing_Wrap::approxPolyDP(double epsilon, bool closed)
{
    int rectangleCount=0,triCount=0,halfRect = 0,contourCnt =0;
    std::vector<cv::Point> polys;
    cv::Mat tempStorage;
 
    for (int i =0;i<contours.size();i++)
    {
        cv::approxPolyDP(contours[i], polys, arcLength(cv::Mat(contours[i]), true)*0.02,closed);
        if (polys.size()==4)
        {
            rectangleCenters.push_back(cv::Point(((polys.at(0).x + polys.at(2).x)/2),((polys.at(0).y + polys.at(2).y)/2)));
            rectangleCount++;
        }
        if (polys.size()==3)
        {
            triCount++;
            triangleCenters.push_back(cv::Point((polys.at(0).x + ((2/3)*(polys.at(1).x - polys.at(0).x))),(polys.at(0).y + (2/3)*(polys.at(1).y - polys.at(0).y))));
        }
        if (polys.size()==2)
        {
            halfRect++;
        }
        else
        {
            contourCnt++;
        }
        //tracking, convert int point to float point for optical tracking function
        features_prev=features_next;
        cv::Mat srcMat = cv::Mat(polys);
        cv::Mat dstMat = cv::Mat(features_next);
        cv::Mat tmpMat;
        srcMat.convertTo(tmpMat, dstMat.type());
        features_next = (std::vector<cv::Point2f>) tmpMat;
    }
 
    std::cout<<"\n rectangles:\t\t"<<rectangleCount;
    std::cout<<"\n halfRect:\t\t"<<halfRect;
    //std::cout<<"\n rect centers:\t\t"<<rectangleCenters;
    std::cout<<"\n triangles:\t\t"<<triCount<<std::endl;
    std::cout<<" contour count:\t\t"<<contourCnt<<std::endl;
    //reset features in a dumb way
    if (polys.size()==0)
    {
        features_next.clear();
    }
    //std::cout<<"triangle centers:\t"<<triangleCenters<<std::endl;
   
    std::cout<<"\n polys DETECTED:\t\t"<<polys.size()<<std::endl;
    std::cout<<"size of features \n"<<features_next.size();
}
 
 
/////////////////////////////////////SPLIT CHANNELS ////////////////////////////////////////////
 
void Processing_Wrap::splitChannels(int src)
{
    cv::split(img.at(src), channels);
    std::cout<<"\n Image split completed. \n";
}
 
 
//////////////////////////////////// BGR HISTOGRAM ////////////////////////////////////////////
 
void Processing_Wrap::BGRHistogram(int numSourceArray, int histDimensionality, int histSize, float range[], bool uniform, bool accumulate)
{
    const float *histRange[]={range};
    const int channelToBeMeasured=0;
 
    cv::calcHist( &channels[0], numSourceArray, channelToBeMeasured, cv::Mat(), blueHistVals, histDimensionality, &histSize, histRange, uniform, accumulate );
    cv::calcHist( &channels[1], numSourceArray, channelToBeMeasured, cv::Mat(), greenHistVals, histDimensionality, &histSize, histRange, uniform, accumulate );
    cv::calcHist( &channels[2], numSourceArray, channelToBeMeasured, cv::Mat(), redHistVals, histDimensionality, &histSize, histRange, uniform, accumulate );
}
 
 
///////////////////////////////////// display BGR Histo/////////////////////////////////////////////
// used to debug bgr histo, check if it works
 
void Processing_Wrap::showBGRHistogram(int histSize)
{
    int histWidth = 600; int histHeight =400;
    int bin_w = cvRound( (double)histWidth/histSize);

    cv::Mat histImage( histHeight, histWidth, CV_8UC3, cv::Scalar( 0,0,0) );

    // Normalize:input,output,lower&upper limits of normal, type of normal,-1means o/p type same as i/p type, optional mask
      normalize(blueHistVals, blueHistVals, 0, histImage.rows, cv::NORM_MINMAX, -1, cv::Mat() );
      normalize(greenHistVals, greenHistVals, 0, histImage.rows, cv::NORM_MINMAX, -1, cv::Mat() );
      normalize(redHistVals, redHistVals, 0, histImage.rows, cv::NORM_MINMAX, -1, cv::Mat() );
 
      // Draw for each channel
      for( int i = 1; i < histSize; i++ )
      {
          cv::line( histImage, cv::Point( bin_w*(i-1), histHeight - cvRound(blueHistVals.at<float>(i-1)) ) ,
                       cv::Point( bin_w*(i), histHeight - cvRound(blueHistVals.at<float>(i)) ),
                       cv::Scalar( 255, 0, 0), 2, 8, 0  );//blue
          cv::line( histImage, cv::Point( bin_w*(i-1), histHeight - cvRound(greenHistVals.at<float>(i-1)) ) ,
                       cv::Point( bin_w*(i), histHeight - cvRound(greenHistVals.at<float>(i)) ),
                       cv::Scalar( 0, 255, 0), 2, 8, 0  );//green
          cv::line( histImage, cv::Point( bin_w*(i-1), histHeight - cvRound(redHistVals.at<float>(i-1)) ) ,
                       cv::Point( bin_w*(i), histHeight - cvRound(redHistVals.at<float>(i)) ),
                       cv::Scalar( 0, 0, 255), 2, 8, 0  );//red
      }
      cv::imshow("Histogram", histImage );
    cv::waitKey(0);
}
 
 
//////////////////////////////////// HSI HISTOGRAM ////////////////////////////////////////////
 
void Processing_Wrap::HSIHistogram(int src,int numSourceArray, int channels[], int histSize[],float hrange[],float srange[], int histDimensionality,bool uniform, bool accumulate)
{
    const float *histRange[]={hrange,srange};

    cv::calcHist(&img.at(src),numSourceArray,channels, cv::Mat(),hist,histDimensionality, histSize,histRange,uniform,accumulate);
}
 
 
///////////////////////////////////// display HSI Histo/////////////////////////////////////////////
// used to debug hsi histo, check if it works
 
void Processing_Wrap::showHSIHistogram(int histSize[])
{
    int hbins=histSize[0], sbins=histSize[1];
    double maxVal=0;
    int scale=10;
 
    minMaxLoc(hist,0,&maxVal,0,0);
    cv::Mat histImg = cv::Mat::zeros(sbins*scale, hbins*10, CV_8UC3);

    for( int h = 0; h < hbins; h++ )
    {
        for( int s = 0; s < sbins; s++ )
        {
            float binVal = hist.at<float>(h, s);
            int intensity = cvRound(binVal*255/maxVal);
            rectangle( histImg, cv::Point(h*scale, s*scale),
                        cv::Point( (h+1)*scale - 1, (s+1)*scale - 1),
                        cv::Scalar::all(intensity),
                        CV_FILLED );
        }
    }
    cv::imshow( "H-S Histogram", histImg );
    cv::waitKey();
}
 
 
 ///////////////////////////////////// display HSI Histo/////////////////////////////////////////////
// used to debug hsi histo, check if it works
 
double Processing_Wrap::compareHSVHistograms(int src1,int src2,int compareMethod)
{
    double result=0;
    int channels[] = { 0, 1 };
    cv::Mat histOne,histTwo;
   
  //Using 30 bins for hue and 32 for saturation
  int h_bins = 50; int s_bins = 60;
  int histSize[] = { h_bins, s_bins };

  // hue varies from 0 to 256, saturation from 0 to 180
  float h_ranges[] = { 0, 256 };
  float s_ranges[] = { 0, 180 };

  const float* ranges[] = { h_ranges, s_ranges };

   
    calcHist( &img.at(src1), 1, channels, cv::Mat(), histOne, 2, histSize, ranges, true, false );
    normalize( histOne, histOne, 0, 1, cv::NORM_MINMAX, -1, cv::Mat() );
 
    calcHist( &img.at(src1), 1, channels, cv::Mat(), histTwo, 2, histSize, ranges, true, false );
    normalize( histTwo, histTwo, 0, 1, cv::NORM_MINMAX, -1, cv::Mat() );
   
    result = compareHist( histOne, histTwo, compareMethod );
   
    std::cout<<"compare result is "<<result;
   
    return result;
}


///////////////////////  SHOW BLUE CHANNEL        ///////////////////////////////////////////
 
void Processing_Wrap::showBlueChannel()
{
    std::cout<<channels[0];
}
 
 
///////////////////////  SHOW GREEN CHANNEL        ///////////////////////////////////////////

void Processing_Wrap::showGreenChannel()
{
    std::cout<<channels[1];
}
 
 
///////////////////////  SHOW RED CHANNEL        ///////////////////////////////////////////
 
void Processing_Wrap::showRedChannel()
{
    std::cout<<channels[2];
}
 
    
///////////////////////// goodFeatures     ///////////////////////////////////////////////
 
void Processing_Wrap::goodFeatures(int src)
{
    cv::Mat eig_image,temp_image;
    int numFeatures =400;
    features_prev=features_next;
 
    cv::goodFeaturesToTrack(img.at(src),features_next,numFeatures,0.1,0.1,cv::Mat());
}


///////////////////////// THRESHOLD FUNCTION     ///////////////////////////////////////////////

void Processing_Wrap::thresh(int src, int dst, int blueLow, int blueUp, int greenLow, int greenUp, int redLow, int redUp)
{
    cv::Mat mask,threshOut = img.at(src).clone(), outPic, dstA, dstB,dstC,dstD;
    cv::Mat mrWhite(img.at(src).rows,img.at(src).cols,CV_8UC3,cv::Scalar(255,255,255));
    int tolerance = 0.02;
    int i;

	if ((blueUp == 0)&&(greenUp == 0)&&(redUp == 255))
	{
		cv::inRange(img.at(src), cv::Scalar(0, 135, 135), cv::Scalar(20, 255, 255), dstA);
		cv::inRange(img.at(src), cv::Scalar(159, 135, 135), cv::Scalar(179, 255, 255), dstB);
		cv::bitwise_or(dstA, dstB, dstC);
		cv::inRange(dstC,cv::Scalar(0,0,0),cv::Scalar(0,119,255),dstD); //Orange thresh
		
		mask = 255-dstD; //invert mask
		
		cv::imshow("mask",mask);
		cv::waitKey(0);
	}
	else
	{
		cv::inRange(img.at(src), cv::Scalar(blueLow-(tolerance*blueLow), greenLow-(tolerance*greenLow), redLow-(tolerance*redLow)), cv::Scalar(blueUp+(tolerance*blueUp), greenUp+(tolerance*greenUp), redUp+(tolerance*redUp)), mask);
	}
	//cv::imshow("mask",mask);
	//cv::waitKey(0);

	mrWhite.copyTo(outPic,mask);
	
	img.at(dst)=outPic.clone();
		
	//cv::Size s = mask.size();
	//std::cout<<s.height<<"\t"<<s.width<<"\n";
		
}
	
	  
///////////////////////// OPTICAL FLOW     ///////////////////////////////////////////////
 
void Processing_Wrap::objectTracking(void)
{
    cv::Mat imgA,imgB; //local copies of greyscales
    std::vector<unsigned char> status;
    std::vector<float> err;
 
    if (features_prev.size()>0)
    {
        cv::cvtColor(img.at(0), imgA, 6);
        cv::cvtColor(img.at(1), imgB, 6);
        imgA.convertTo(imgA, CV_8UC1);
        imgB.convertTo(imgB, CV_8UC1);
            
        //std::cout<<"features prev"<<features_prev<<"\n features next"<<features_next;
        //cv::waitKey(0);
 
        cv::calcOpticalFlowPyrLK(imgB,imgA,features_prev,features_next,status,err);
        //std::cout<<"ha!finished and it seems to have worked    ?";
        //cv::waitKey(0);
    
        for (int i =0; i<features_prev.size(); i++)
        {
            int line_thickness=1;
            cv::Scalar line_color;
            cv::Point p,q;
            double angle;
            double hypotenuse;
        
            if(status[i]==0) continue;//feature not found
        
            line_color = CV_RGB(255,0,0);
              
            p.x =(int) features_prev[i].x;
            p.y =(int) features_prev[i].y;
            q.x =(int) features_next[i].x;
            q.y =(int) features_next[i].y;
              
      
            angle = atan2((double) p.y -q.y, (double) p.x - q.x);
            hypotenuse = sqrt(((p.y-q.y)*(p.y-q.y))+((p.x -q.x)*(p.x -q.x)));
              
            q.x=(int)(p.x-1 * hypotenuse * cos(angle));
            q.y=(int)(p.x-1 * hypotenuse * sin(angle));
              
            cv::line(img.at(26),p,q,line_color, line_thickness, CV_AA,0);
              
            p.x = (int)(q.x+9*cos(angle+3.14/4));
            p.y = (int)(q.y+9*sin(angle+3.14/4));
            cv::line(img.at(26),p,q,line_color,line_thickness,CV_AA,0);
            p.x = (int)(q.x+9*cos(angle-3.14/4));
            p.y = (int)(q.y+9*sin(angle-3.14/4));
            cv::line(img.at(26),p,q,line_color,line_thickness,CV_AA,0);
        }
        cv::imshow("why so tracking?",img.at(26));
    }
}


///////////////////////// GAUSIAN BLUR FILTER     ///////////////////////////////////////////////

void Processing_Wrap::gaussianBlur(int src, int dest, int kersize, double sigmaX, double sigmaY)
{
    for ( int i = 1; i < kersize; i = i + 2 )
    {
      cv::GaussianBlur(img.at(src),img.at(dest),cv::Size(i,i),sigmaX,sigmaY,cv::BORDER_DEFAULT);
    }
}


///////////////////////// roi     //////////////////////////////////////////////////////////////

void Processing_Wrap::roi(int src, int dst)
{
    //DO STUFF
    cv::Mat F = img.at(src).clone(), G;
    //img.at(dst)
    G = F(cv::Range(0,0), cv::Range(100,100));
    cv::imshow("roi", G);
    cv::waitKey(0);
}


///////////////////////// GAUSSIAN BLUR SHARPENER     //////////////////////////////////////////////////////////////

void Processing_Wrap::GaussianBlurSharpener(int src,int destination,int accuracy)
{
    cv::Mat tempImStorage;
    tempImStorage=img.at(src).clone();
   
    for(int t=0;t<accuracy;t++)
        {
            cv::GaussianBlur(tempImStorage, img.at(destination), cv::Size(0, 0), 3);
            cv::addWeighted(tempImStorage, 1.5, img.at(destination), -0.5, 0, img.at(destination));
            tempImStorage=img.at(destination).clone();
        }
}

///////////////////////// ESTIMATE VELOCITY    //////////////////////////////////////////////////////////////

float Processing_Wrap::estimateVelocity(void)
{
    float estVel=0.0;
    int numFeatures;
    std::vector<unsigned char> status;
    std::vector<float> err;
   
    int counter=0,distance=0;
        float accumulatedDistance=0,averageDistance=0;
        std::vector<float> distanceStore;
   
    //check if big features detected
    if (features_next.size()>0)
    {
        std::cout<<"object detector estimates velocity as: \t";
        for (int i=0;i<features_next.size();i++)
        {
            distance=sqrt((features_next.at(0).x-features_prev.at(0).x)*(features_next.at(0).x-features_prev.at(0).x) + (features_next.at(0).y-features_prev.at(0).y)*(features_next.at(0).y-features_prev.at(0).y));
            distanceStore.push_back(distance);
            accumulatedDistance=accumulatedDistance+distance;
        }
    }
    else
    {
        std::cout<<"particle detector estimates velocity as: \t";
               
        particle_features_prev=particle_features_nxt;
        cv::cvtColor(img.at(2),img.at(4),6);
        cv::cvtColor(img.at(3),img.at(5),6);
                     
        cv::goodFeaturesToTrack(img.at(4),particle_features_prev,numFeatures=20,0.1,0.1,cv::Mat());
        cv::calcOpticalFlowPyrLK(img.at(5),img.at(4),particle_features_prev,particle_features_nxt,status,err);
             
        for (int i =0; i<particle_features_prev.size(); i++)
        {
            if(status[i]==0) continue;//feature not found
            distance=sqrt((particle_features_nxt.at(0).x-particle_features_prev.at(0).x)*(particle_features_nxt.at(0).x-particle_features_prev.at(0).x) + (particle_features_nxt.at(0).y-particle_features_prev.at(0).y)*(particle_features_nxt.at(0).y-particle_features_prev.at(0).y));
            distanceStore.push_back(distance);
            accumulatedDistance=accumulatedDistance+distance;
        }
    }
    averageDistance=accumulatedDistance/particle_features_prev.size();
    estVel=averageDistance/FRAME_RATE;
    std::cout<<estVel<<"pixels per second \n";
   
    return estVel;
}


///////////////////////  PRINTOUT BASED ON POSITION      ///////////////////////////////////////////

void Processing_Wrap::estPosition(void)
{
    int xCentre,xAccumulated,yAccumulated,xAverage,yAverage;
   
    xCentre=512;
   
    if (features_next.size()>0)
    {
        std::cout<<"object detected!!\n";
        //calc average position of feature detected
        for (int i=0;i<features_next.size();i++)
        {
            xAccumulated=xAccumulated+features_next.at(i).x;
            yAccumulated=yAccumulated+features_next.at(i).y;
        }
        xAverage=xAccumulated/features_next.size();
        yAverage=yAccumulated/features_next.size();
       
        //udate position of auv
        if (xAverage<xCentre)
        {
            std::cout<<"Action: \t Go left\n\n";
        }
        if (xAverage>xCentre)
        {
            std::cout<<"Action: \t Go Right\n\n";
        }
    }
    else
    {
        std::cout<<"no object detected\n Action: \t No action required\n\n";
    }
}


/////////////////////// FUSION ////////////////////////////////////////////////////////////

void Processing_Wrap::fusion(int src, int dst)
{
    //DO STUFF
    cv::Mat img1=img.at(src).clone(), img2, img3, img4, img5=img.at(src).clone();
    cv::cvtColor(img5, img4, CV_BGR2HSV);
    //cv::cvtColor(img1, img2, CV_BGR2GRAY);
    double alpha = 1,beta = 2;
    //cv::addWeighted(img2, alpha, img4, beta, (double)(000,000,000), img3);
    img5.copyTo(img3,img4);
    //img3.copyTo(img3,img4);
    int i = 0;
    for (i = 0; i < 100; i++)
    {
        //DO
        img3.copyTo(img3,img4);
    }
    std::cout<<"\n loops :"<<i;
    img.at(dst) = img3.clone();
   
}


//////////////////////////INVERT IMAGE ///////////////////////////////////////////////////////

void Processing_Wrap::invertImage(int src, int dst)
{
    cv::Mat mrWhite(img.at(src).rows,img.at(src).cols,CV_8UC3,cv::Scalar(255,255,255));
    cv::addWeighted(mrWhite, 1.0, img.at(src), -1.0, 0, img.at(dst));
    cv::cvtColor(img.at(dst),img.at(dst),6);
}


///////////////////////////////////// IMAGE MATCHING/////////////////////////////////////////////

int Processing_Wrap::matchImage(int src)
{
    double results;
    int templateStoreIndex=21;
    int bestShapeMatch=0; 
    std::vector<double> resultsVector;
	double bestMatch=10;
	int bestMatchIndex;
    
    ///contour base image
    cv::findContours( img.at(src), contours, CV_RETR_EXTERNAL, CV_CHAIN_APPROX_NONE);
    cv::drawContours(img.at(0), contours, -1, cv::Scalar(255,255,0), 1, CV_AA );
    
    ///show image and num of contours found for debug
    cv::imshow("drawn contours on base image",img.at(0));
    std::cout<<"num of contours in base image \t"<<contours.size()<<"\n";
    cv::waitKey(0);
    
	///find biggest contour by finding contourn with biggest area 
	int largest_area=0;
	int largest_contour_index=0;
	
	for( int i = 0; i< contours.size(); i++ ) // iterate through each contour.
	{
		double a=contourArea( contours[i],false);  //  Find the area of contour
		if(a>largest_area)
		{
			largest_area=a;
			largest_contour_index=i;                //Store the index of largest contour
		} 
    }
	
    ///check for match
    for (int templateindex=0;templateindex<NUMBER_OF_TEMPLATES;templateindex++)
    {
		///contour templete
		cv::findContours( img.at(templateStoreIndex), templeteContours, CV_RETR_EXTERNAL, CV_CHAIN_APPROX_NONE);
		
		///find best match
		results=cv::matchShapes(contours[largest_contour_index], templeteContours[0], CV_CONTOURS_MATCH_I3,0);
		resultsVector.push_back(results);
		if ((results<bestMatch)&&(results!=0))
		{
			bestMatch=results;
			bestShapeMatch=templateStoreIndex;
		}
		templateStoreIndex++;
	}
	///print results
	if (bestMatch<0.1)
	{ std::cout<<"Good match found!!\n";}
	return bestShapeMatch;
}


///////////////////////////////////// IMAGE MATCHING/////////////////////////////////////////////

void Processing_Wrap::classifyMatch(int bestTemplateMatch)
{
	if (bestTemplateMatch==21)
	{
		std::cout<<"Trident\n";
		cv::waitKey(0);
	}
	if (bestTemplateMatch==22)
	{
		std::cout<<"Sword\n";
		cv::waitKey(0);
	}
	if (bestTemplateMatch==23)
	{
		std::cout<<"Honeycomb\n";
		cv::waitKey(0);
	}
	if (bestTemplateMatch==24)
	{
		std::cout<<"Circle\n";
		cv::waitKey(0);
	}
}
////////////////////////////// fill in poly func //////////////////////////////////////////
//redundant now, used for debuging match shapes, saving in case needed in future

void Processing_Wrap::fillInPoly(void)

{
	///draw square contour from templete
		/*std::vector<cv::Point> squarePoints  = (std::vector<cv::Point>)templeteContours[0];
		int numOfContoursInSquare=squarePoints.size();
		const int *numOfPointsInTempleteContour = &numOfContoursInSquare;
		cv::Point testArray1[1][squarePoints.size()];
   
		for (int a=0;a<squarePoints.size();a++)
		{
			testArray1[0][a]=squarePoints[a];
		}
		const cv::Point* tester1[1] = { testArray1[0] };
		cv::fillPoly(img.at(35), tester1, numOfPointsInTempleteContour, 1, cv::Scalar(0,255,0), 8, 0, cv::Point() );
		cv::imshow("contour to search for",img.at(35));
		cv::waitKey(0);*/ 
		
	///fill in contour on base image
	   /*int numContoursFound=sizeof(contours[largest_contour_index]);
	   std::vector<cv::Point> bestMatchContour1 = (std::vector<cv::Point>)contours[largest_contour_index];
	   int testA= bestMatchContour1.size();
	   const int *testB = &testA;
   
		cv::Point testArray[1][bestMatchContour1.size()];
		for (int k=0;k<bestMatchContour1.size();k++)
		{
			testArray[0][k]=bestMatchContour1[k];
		}
       
		const cv::Point* tester[1] = { testArray[0] };
   
		cv::fillPoly(img.at(0), tester, testB, 1, cv::Scalar(0,255,0), 8, 0, cv::Point() );

		cv::imshow("TTTTIIIIIIIIIIIIIIIIIITTTTTTTTTTANNNNNNNNNNNNNNNNNNIIIIIIIIUUUUUUUUUMMMMMMMMMMMMMM",img.at(0));
		cv::waitKey(0);*/
}


/////////////////////////////// ENHANCE COLORS IN IMAGE ////////////////////////////////////
 
void Processing_Wrap::enhanceColors(int src,int dest,int channel,double level)
{
	///convert image to hsv
	cv::Mat tempImage=img.at(src).clone();
	cv::cvtColor(tempImage, tempImage, CV_BGR2HSV);    

	///enhance image by Level
	for (int i=0; i < tempImage.rows ; i++)
	{
		for(int j=0; j < tempImage.cols; j++)
		{
             tempImage.at<cv::Vec3b>(i,j)[channel] += level;
		}
	}

	///convert image back to bgr
	cv::cvtColor(tempImage, tempImage, CV_HSV2BGR);
	img.at(dest)=tempImage.clone();
}


/////////////////////////////// CLONE IMAGE ////////////////////////////////////

void Processing_Wrap::cloneImage(int src,int dst)
{
	img.at(dst)=img.at(src).clone();
}

/////////////////////////////////////
/////////////////////////////////////
Processing_Wrap::Processing_Wrap(){}
/*********************************************************************************************************************
*               END PROCESSING WRAP                                                                                  *
*********************************************************************************************************************/


/*********************************************************************************************************************
*               START PREPROCESSING WRAP                                                                             *
*********************************************************************************************************************/

///////////////////////  VIDEO CAPTURE        ///////////////////////////////////////////

void Preprocessing_Wrap::VideoCaptureOpen(void)
{
  cap.open(0);
}
 
void Preprocessing_Wrap::namedWindow(char * name, int num)
{
  cv::namedWindow(name, num);
}
 
void Preprocessing_Wrap::nextFrame(int dst)
{
  cap >> img.at(dst);
}
 
Preprocessing_Wrap::Preprocessing_Wrap(){}
 
/*********************************************************************************************************************
*               END PREPROCESSING WRAP                                                                                        *
*********************************************************************************************************************/
