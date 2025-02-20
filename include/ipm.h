#ifndef IPM_H
#define IPM_H

#include <opencv2/opencv.hpp>
#include <vector>
#include "json.hpp"
#include <fstream>

class ImageUndistort {
public:
    cv::Mat cameraMatrix_, distCoeffs_;
    cv::Mat new_K_;
    cv::Mat map1_,map2_;
    ImageUndistort(const cv::Mat& cameraMatrix, const cv::Mat& distCoeffs,const int image_width,const int image_height);
    std::vector<cv::Point2f> undistortPoints(const std::vector<cv::Point2f>& points);
};

class IPM {
private:
    std::vector<cv::Point2f> calibratePointsPixel;
    std::vector<cv::Point3f> calibratePointsCamera;
    cv::Mat perspectiveMatrix;
    ImageUndistort undistortImage;

public:
    IPM(const std::vector<cv::Point2f>& calibratePointsPixel,
        const std::vector<cv::Point3f>& calibratePointsCamera,
        const cv::Mat& perspectiveMatrix,
        const cv::Mat& cameraMatrix,
        const cv::Mat& distCoeffs,
        const int image_width,
        const int image_height);
    
    int getTargetPointsCamera(const std::vector<cv::Point2f>& referencePointImg,
                                      const std::vector<cv::Point3f>& referencePointCamera,
                                      const std::vector<cv::Point2f>& targetPointImg,
                                      std::vector<cv::Point3f>& targetPointCamera);
    
    int get3DPos(const std::vector<cv::Point2f>& targetPointImg,std::vector<cv::Point3f>& targetPointCamera);
};

cv::Mat jsonToCvMat(const nlohmann::json& j, int rows, int cols,int dim);  
std::vector<cv::Point2f> jsonToPoints2f(const nlohmann::json& j); 
std::vector<cv::Point3f> jsonToPoints3f(const nlohmann::json& j);

#endif // IPM_H



