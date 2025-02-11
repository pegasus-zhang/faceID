#ifndef FACE_FEATURE_H
#define FACE_FEATURE_H

/*
  简单的yolo接口，容易集成但是高性能
*/

#include <vector>
#include <memory>
#include <string>
#include <future>
#include <opencv2/opencv.hpp>
#include <opencv2/cudacodec.hpp>
#include <opencv2/cudaimgproc.hpp> 
#include <opencv2/cudawarping.hpp>
#include <opencv2/cudaarithm.hpp>
#include <opencv2/core/opengl.hpp>

namespace GeelyRobotVisionGpu
{
    class IFaceFeature
    {
        public:
            enum class Mode : int {
                FP32,
                FP16,
                INT8
            };

        public:
            virtual ~IFaceFeature(){};
            virtual int Init(std::string model_name, bool build_engine, float confidence_threshold=0.4, float nms_threshold=0.4) = 0;
            virtual std::shared_future<cv::cuda::GpuMat> Inference(cv::cuda::GpuMat input_image) = 0;
            virtual std::vector<std::shared_future<cv::cuda::GpuMat>> Inference(std::vector<cv::cuda::GpuMat>& input_image) = 0;
            virtual int SetDeviceID(int id) = 0;
            virtual int SetBatchSize(int size) = 0;
            virtual int SetMaxWorkspace(size_t size) = 0;
            virtual int SetPrecision(Mode mode) = 0;
            virtual int SetCalibrationPath(std::string path) = 0;
            virtual int SetCalibrationCachePath(std::string path) = 0;            
    };

    class IFaceFeatureManager
    {
        public:
           static std::shared_ptr<IFaceFeature> create(); 
    };

}; // namespace GeelyRobotVisionGpu

#endif // FACE_FEATURE_H