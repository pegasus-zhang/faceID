#include "ipm.h"

using json = nlohmann::json;

cv::Mat jsonToCvMat(const json& j, int rows, int cols,int dim=1) 
{
    std::vector<double> data;
    if(1 == dim)
    {
        data = j.get<std::vector<double>>();
    }
    else if(2 == dim)
    {
        std::vector<std::vector<double>> data2d = j.get<std::vector<std::vector<double>>>();
        data.reserve(data2d.size() * data2d[0].size()); // 预分配大小
        // 使用 std::copy 直接拷贝
        auto it = data.begin();
        for (const auto& row : data2d) {
            it = std::copy(row.begin(), row.end(), it);
        }
    }
    return cv::Mat(rows, cols, CV_64F, data.data()).clone();
}

std::vector<cv::Point2f> jsonToPoints2f(const json& j) 
{
    std::vector<cv::Point2f> points;
    for (const auto& p : j) {
        points.emplace_back(p[0], p[1]);
    }
    return points;
}

std::vector<cv::Point3f> jsonToPoints3f(const json& j) 
{
    std::vector<cv::Point3f> points;
    for (const auto& p : j) {
        points.emplace_back(p[0], p[1], p[2]);
    }
    return points;
}

ImageUndistort::ImageUndistort(const cv::Mat& cameraMatrix, const cv::Mat& distCoeffs,const int image_width=1920,const int image_height=1536): cameraMatrix_(cameraMatrix), distCoeffs_(distCoeffs)
{
    int h = image_height;
    int w = image_width;
    // 计算新的相机矩阵
    cv::fisheye::estimateNewCameraMatrixForUndistortRectify(cameraMatrix, distCoeffs, cv::Size(w, h), cv::noArray(), new_K_);
    // 计算去畸变映射表
    cv::fisheye::initUndistortRectifyMap(cameraMatrix, distCoeffs, cv::Mat::eye(3, 3, CV_64F), new_K_, cv::Size(w, h), CV_16SC2, map1_, map2_);
}

std::vector<cv::Point2f> ImageUndistort::undistortPoints(const std::vector<cv::Point2f>& points) {
    std::vector<cv::Point2f> undistortedPoints;
    cv::fisheye::undistortPoints(points, undistortedPoints, cameraMatrix_, distCoeffs_,cv::noArray(), new_K_);
    return undistortedPoints;
}

IPM::IPM(const std::vector<cv::Point2f>& calibratePointsPixel,
         const std::vector<cv::Point3f>& calibratePointsCamera,
         const cv::Mat& perspectiveMatrix,
         const cv::Mat& cameraMatrix,
         const cv::Mat& distCoeffs,
         const int image_width=1920,const int image_height=1536)
    : calibratePointsPixel(calibratePointsPixel),
      calibratePointsCamera(calibratePointsCamera),
      perspectiveMatrix(perspectiveMatrix),
      undistortImage(cameraMatrix, distCoeffs,image_width,image_height) {}

int IPM::getTargetPointsCamera(const std::vector<cv::Point2f>& referencePointImg,
                                       const std::vector<cv::Point3f>& referencePointCamera,
                                       const std::vector<cv::Point2f>& targetPointImg,
                                       std::vector<cv::Point3f>& targetPointCamera) 
{
    int size = targetPointImg.size();
    targetPointCamera.resize(size);
    for(size_t i = 0;i<size;i++)
    {
        float dx = (targetPointImg[i].x - referencePointImg[0].x) /
               (referencePointImg[3].x - referencePointImg[0].x);
        float dy = (targetPointImg[i].y - referencePointImg[0].y) /
                (referencePointImg[3].y - referencePointImg[0].y);
        
        cv::Point3f f_xy1 = referencePointCamera[0] * (1 - dx) + referencePointCamera[1] * dx;
        cv::Point3f f_xy2 = referencePointCamera[2] * (1 - dx) + referencePointCamera[3] * dx;
        cv::Point3f target = f_xy1 * (1 - dy) + f_xy2 * dy;
        targetPointCamera[i] = target;
    }
    
    return 0;
}

int IPM::get3DPos(const std::vector<cv::Point2f>& targetPointImg,std::vector<cv::Point3f>& targetPointsCamera) {
    if (targetPointImg.empty()) {
        return -1;
    }
    
    std::vector<cv::Point2f> targetPointImgUndistorted = undistortImage.undistortPoints(targetPointImg);
    std::vector<cv::Point2f> targetPointImgUndistortedTransformed;
    cv::perspectiveTransform(targetPointImgUndistorted, targetPointImgUndistortedTransformed, perspectiveMatrix);
    
    for (auto& pt : targetPointImgUndistortedTransformed) {
        pt = cv::Point2f(static_cast<int>(pt.x), static_cast<int>(pt.y));
    }

    return getTargetPointsCamera(calibratePointsPixel, calibratePointsCamera, targetPointImgUndistortedTransformed,targetPointsCamera);
}

#include <iostream>

int main(int argc,char* argv[]) {
    std::string config_path;
    if (argc < 2) {
        config_path = "/home/jetson/workspace/faceID_jzb/config/default.json";
    }
    else
    {
        config_path = argv[1];
    }

    // 创建一个配置对象
    nlohmann::json config;
    std::ifstream file(config_path);  // 打开 JSON 文件
    if (!file) {
        std::cerr << "无法打开配置文件!" << std::endl;
        return -1;
    }
    file >> config;  // 解析 JSON
    // cv::Mat cameraMatrix = (cv::Mat_<double>(3, 3) << 1000, 0, 320, 0, 1000, 240, 0, 0, 1);
    // cv::Mat distCoeffs = cv::Mat::zeros(1, 5, CV_64F);
    // cv::Mat perspectiveMatrix = cv::Mat::eye(3, 3, CV_64F);
    
    // std::vector<cv::Point2f> calibratePointsPixel = { {0,0}, {1,0}, {1,1}, {0,1} };
    // std::vector<cv::Point3f> calibratePointsCamera = { {0,0,0}, {1,0,0}, {1,1,0}, {0,1,0} };
    
    cv::Mat cameraMatrix = jsonToCvMat(config["camera_parameter"]["camera_intrinsics"], 3, 3, 2);
    cv::Mat distCoeffs = jsonToCvMat(config["camera_parameter"]["camera_distortion"], 1, 4, 1);
    cv::Mat perspectiveMatrix = jsonToCvMat(config["3d_calibration_parameter"]["PERPECTIVE_MATRIX"], 3, 3, 2);
    std::vector<cv::Point2f> calibratePointsPixel = jsonToPoints2f(config["3d_calibration_parameter"]["CALIBRATE_POINTS_PIXEL"]);
    std::vector<cv::Point3f> calibratePointsCamera = jsonToPoints3f(config["3d_calibration_parameter"]["CALIBRATE_POINTS_CAMERA"]); 
    int image_width = config["camera_parameter"]["image_size"][0];
    int image_height = config["camera_parameter"]["image_size"][1];
    IPM ipm(calibratePointsPixel, calibratePointsCamera, perspectiveMatrix, cameraMatrix, distCoeffs,image_width, image_height);
    
    std::vector<cv::Point2f> targetPointImg = { {963, 811} };
    std::vector<cv::Point3f> targetPointCamera;
    ipm.get3DPos(targetPointImg,targetPointCamera);
    
    std::cout << "Target Point in Camera Coordinates: (" << targetPointCamera[0].x << ", " 
              << targetPointCamera[0].y << ", " << targetPointCamera[0].z << ")" << std::endl;
    return 0;
}
