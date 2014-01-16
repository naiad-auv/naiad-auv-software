#include "opencv2/calib3d/calib3d.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include "opencv2/highgui/highgui.hpp"
#include "opencv2/contrib/contrib.hpp"

#include <stdio.h>
#include <iostream>
using namespace cv;


int main(int, char**)
{
	int numberOfPhotos=20;//num photos required from each cam
	
	//filenaming stuff
	int rightImageName = 1;
	int leftImageName = 1;
	
    cv::VideoCapture capLeft(1); // open the Left camera
    //cv::VideoCapture capRight("http://192.168.1.238:8080/videofeed?x.mjpeg"); // open the Right camera
    cv::VideoCapture capRight(0);//open the right camera
    
    if(!capLeft.isOpened() || !capRight.isOpened())  
    {
        std::cerr << "ERROR: Could not open cameras." << std::endl;
        return -1;
    }
   
    cv::namedWindow("Left",1);
    cv::namedWindow("Right",1);
    
    for(int i=0;i<numberOfPhotos;i++)
    {
        bool isValid = true;
          
        cv::Mat frameLeft;
        cv::Mat frameRight;
        
        try
        {
          capLeft >> frameLeft; // get a new frame from left camera
          capRight >> frameRight; //get a new frame from right camera
        }
        catch( cv::Exception& e )
        {
          std::cout << "An exception occurred. Ignoring frame. " << e.err << std::endl;
          isValid = false;
        }
        
        if (isValid)
        {
          try
          {
			  for(int j=10;j>0;j--)
			  {
				  capLeft>>frameLeft;
				  // waitKey(700); 
				  capRight>>frameRight;
				  //Size dSize=Size(round(frameLeft.cols),round(frameLeft.rows));
				  //resize(frameRight,frameRight,dSize,0,0,CV_INTER_CUBIC);//CV_INTER_AREA  
				  Size dSize=Size(round(frameLeft.cols),round(frameLeft.rows));
				  resize(frameRight,frameRight,dSize,0,0,CV_INTER_CUBIC);//CV_INTER_AREA
				  
				  cv::imshow("Left", frameLeft);
				  cv::imshow("Right", frameRight);
				  std::cout<<"wait..."<<j<<"\n";
				  //cv::waitKey(1);
				  }
			cv::waitKey(0);
			 
			char strStorage[50]; // enough to hold all numbers up to 64-bits
			//int bufSize=0;
  
			std::string leftFolderPath = "/home/vision/Documents/Images/calibrationPictures/l";
			std::string rightFolderPath = "/home/vision/Documents/Images/calibrationPictures/r";
    
			std::string rightResult;
			std::string leftResult;
			
			std::string imageType = ".jpg";
  
		
			sprintf(strStorage, "%d", rightImageName);//imageName global, set to 1, and increases as prog scrolls through images in folder
			rightResult = rightFolderPath + strStorage + imageType;
			
		
			sprintf(strStorage, "%d", leftImageName);//imageName global, set to 1, and increases as prog scrolls through images in folder
			leftResult = leftFolderPath + strStorage + imageType;
			
			cv::imwrite(rightResult,frameRight);
			
			cv::imwrite(leftResult,frameLeft);
			
			rightImageName++;
			leftImageName++;
			
			
		}
          catch( cv::Exception& e )
          {
            /************************************************************ 
            *    Sometimes an "Unrecognized or unsuported array type"   * 
            *    exception is received so we handle it to avoid dying   *
            ************************************************************/
            std::cout << "An exception occurred. Ignoring frame. " << e.err << std::endl;
          }
        }
        //if(cv::waitKey(30) >= 0) break;
    }
    return 0;
}
