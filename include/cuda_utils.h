#pragma once
#include <opencv2/opencv.hpp>
#include <opencv2/core/cuda.hpp>
#include <cuda_runtime.h>
#include <iostream>
#include <cmath>

void computeL2DistanceCUDA(const cv::cuda::GpuMat& A, const cv::cuda::GpuMat& B, cv::cuda::GpuMat& D);