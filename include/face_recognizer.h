#pragma once
#include <opencv2/opencv.hpp>
#include <opencv2/core/cuda.hpp>
#include <opencv2/cudaobjdetect.hpp>
#include "simple_yolo_cuda.h"
#include "face_alignment.h"
#include "face_feature.h"

class FaceRecognizer
{
public:
    FaceRecognizer();
    ~FaceRecognizer();

    int CropFacesAlignment(const cv::cuda::GpuMat& img, const MatrixRobotVisionGpu::IYolo::BoxArray& boxes,std::vector<cv::cuda::GpuMat>& aligned_faces);
    int ExtractFeature(const std::vector<cv::cuda::GpuMat>& aligned_faces, cv::cuda::GpuMat& features);
    int DetectExtractFeature(const cv::cuda::GpuMat& img,cv::cuda::GpuMat& features);

};