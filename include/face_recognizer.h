#pragma once
#include <opencv2/opencv.hpp>
#include <opencv2/core/cuda.hpp>
#include <opencv2/cudaobjdetect.hpp>
#include "simple_yolo_cuda.h"
#include "face_alignment.h"
#include "face_feature.h"
#include "face_register.h"
struct FaceInfo
{
    MatrixRobotVisionGpu::IYolo::BoxArray boxes;
    cv::cuda::GpuMat features;
    std::vector<std::string> face_ids;
    std::vector<float> scores;
}

class FaceRecognizer
{
public:
    FaceRecognizer(std::string database_path,float det_thresh=0.5,float rec_thresh=0.5);
    ~FaceRecognizer();
    int Init();
    int CropFacesAlignment(const cv::cuda::GpuMat& img, const MatrixRobotVisionGpu::IYolo::BoxArray& boxes,std::vector<cv::cuda::GpuMat>& aligned_faces);
    int ExtractFeature(const std::vector<cv::cuda::GpuMat>& aligned_faces, cv::cuda::GpuMat& features);
    int DetectExtractFeature(const cv::cuda::GpuMat& img,FaceInfo& face_info);
    int DetectFace(const cv::cuda::GpuMat& img,FaceInfo& face_info);
private:
    float det_thresh_;
    float rec_thresh_;
    std::shared_ptr<MatrixRobotVisionGpu::IYolo> face_detector_ = nullptr;
    std::shared_ptr<GeelyRobotVisionGpu::IFaceFeature> face_feature_ = nullptr;
    std::shared_ptr<FaceRegister> face_register_ = nullptr;
};