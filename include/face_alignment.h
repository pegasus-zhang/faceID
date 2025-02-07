#pragma once

#include <opencv2/opencv.hpp>
#include <opencv2/cudawarping.hpp>
#include <opencv2/core/cuda.hpp>
namespace GeelyRobotVisionGpu
{
    cv::Mat getAffineTransform(const std::vector<cv::Point2f> &kpts,
                                const std::vector<cv::Point2f> &kptsRef,
                                const std::string &transType);
    cv::cuda::GpuMat alignmentAndCropFace(const cv::cuda::GpuMat &gpuImage,
            const cv::Size &faceSize,
            const std::vector<cv::Point2f> &kpts,
            const std::vector<cv::Point2f> &kptsRef,
            const std::string &alignType);
}


