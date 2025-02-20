#ifndef SIMPLE_YOLO_CUDA_HPP
#define SIMPLE_YOLO_CUDA_HPP

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
#include <opencv2/core/opengl.hpp>

namespace YoloGpu
{
    class IYolo
    {
        public:
            enum class Mode : int {
                FP32,
                FP16,
                INT8
            };

            struct Box {  
                float left, top, right, bottom; // 边界框坐标  
                float confidence;              // 边界框置信度  
                // int class_label;            // 如果需要类别标签，可以取消注释  
                struct Keypoint {  
                    cv::Point2f point;         // 使用 cv::Point2f 表示关键点的坐标  
                    float confidence;          // 关键点的置信度  

                    Keypoint() = default;  
                    Keypoint(const cv::Point2f& point, float confidence)  
                        : point(point), confidence(confidence) {}  
                };  
                std::vector<Keypoint> keypoints; // 存储所有关键点  

                Box() = default;  

                Box(float left, float top, float right, float bottom, float confidence, const std::vector<Keypoint>& keypoints = {})  
                    : left(left), top(top), right(right), bottom(bottom), confidence(confidence), keypoints(keypoints) {}  
                
                // 计算边界框面积  
                float area() const {  
                    return std::max(0.0f, right - left) * std::max(0.0f, bottom - top);  
                } 
            };  

            typedef std::vector<Box> BoxArray;

        public:
            virtual ~IYolo(){};
            virtual int Init(std::string model_name, bool build_engine, float confidence_threshold=0.4, float nms_threshold=0.4) = 0;
            virtual std::shared_future<BoxArray> Inference(cv::cuda::GpuMat input_image) = 0;
            virtual std::vector<std::shared_future<BoxArray>> Inference(std::vector<cv::cuda::GpuMat>& input_image) = 0;
            virtual int SetDeviceID(int id) = 0;
            virtual int SetBatchSize(int size) = 0;
            virtual int SetMaxWorkspace(size_t size) = 0;
            virtual int SetPrecision(Mode mode) = 0;
            virtual int SetCalibrationPath(std::string path) = 0;
            virtual int SetCalibrationCachePath(std::string path) = 0;            
    };

    class IYoloManager
    {
        public:
           static std::shared_ptr<IYolo> create(); 
    };

}; //namespace YoloGpu


#endif // SIMPLE_YOLO_CUDA_HPP