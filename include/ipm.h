#ifndef IPM_H
#define IPM_H

#include <opencv2/opencv.hpp>
#include <vector>
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
    
    cv::Point3f getTargetPointsCamera(const std::vector<cv::Point2f>& referencePointImg,
                                      const std::vector<cv::Point3f>& referencePointCamera,
                                      const std::vector<cv::Point2f>& targetPointImg);
    
    cv::Point3f get3DPos(const std::vector<cv::Point2f>& targetPointImg);
};

#endif // IPM_H



