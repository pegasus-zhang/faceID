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
#include <cuda_runtime.h>  

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

    struct Box_cuda {  
        float left;       // 边界框的左坐标  
        float top;        // 边界框的上坐标  
        float right;      // 边界框的右坐标  
        float bottom;     // 边界框的下坐标  
        float confidence; // 边界框的置信度  
    
        // 关键点信息（固定为 17 个关键点）  
        struct Keypoint {  
            float x;          // 关键点的 x 坐标  
            float y;          // 关键点的 y 坐标  
            float confidence; // 关键点的置信度  
    
            // 构造函数，支持 GPU 和 CPU  
            __host__ __device__ Keypoint() : x(0), y(0), confidence(0) {}  
            __host__ __device__ Keypoint(float x_, float y_, float conf_)  
                : x(x_), y(y_), confidence(conf_) {}  
        };  
    
        Keypoint keypoints[17]; // 固定大小的关键点数组  
    
        // 默认构造函数  
        __host__ __device__ Box_cuda()  
            : left(0), top(0), right(0), bottom(0), confidence(0) {  
            // 初始化关键点为默认值  
            for (int i = 0; i < 17; ++i) {  
                keypoints[i] = Keypoint();  
            }  
        }  
    
        // 赋值构造函数，支持对关键点数组的赋值  
        __host__ __device__ Box_cuda(float l, float t, float r, float b, float conf, const Keypoint* kp_array)  
            : left(l), top(t), right(r), bottom(b), confidence(conf) {  
            // 对 keypoints 数组进行赋值  
            for (int i = 0; i < 17; ++i) {  
                keypoints[i] = kp_array[i];  
            }  
        }  
    };  

}; //namespace YoloGpu


#endif // SIMPLE_YOLO_CUDA_HPP