#ifndef SIMPLE_YOLO_HPP
#define SIMPLE_YOLO_HPP

/*
  简单的yolo接口，容易集成但是高性能
*/

#include <vector>
#include <memory>
#include <string>
#include <future>
#include <opencv2/opencv.hpp>

namespace MatrixRobotVision
{
    class IScrfd
    {
        public:
            enum class Mode : int {
                FP32,
                FP16,
                INT8
            };

            struct Box{
                float left, top, right, bottom, confidence;
                // int class_label;
                std::vector<cv::Point> keypoints;

                Box() = default;

                Box(float left, float top, float right, float bottom, float confidence, const std::vector<cv::Point>& keypoints = {})
                :left(left), top(top), right(right), bottom(bottom), confidence(confidence), keypoints(keypoints){}
            };

            typedef std::vector<Box> BoxArray;

        public:
            virtual ~IScrfd(){};
            virtual int Init(std::string model_name, bool build_engine, float confidence_threshold=0.4, float nms_threshold=0.4) = 0;
            virtual std::shared_future<BoxArray> Inference(cv::Mat input_image) = 0;
            virtual std::vector<std::shared_future<BoxArray>> Inference(std::vector<cv::Mat>& input_image) = 0;
            virtual int SetDeviceID(int id) = 0;
            virtual int SetBatchSize(int size) = 0;
            virtual int SetMaxWorkspace(size_t size) = 0;
            virtual int SetPrecision(Mode mode) = 0;
            virtual int SetCalibrationPath(std::string path) = 0;
            virtual int SetCalibrationCachePath(std::string path) = 0;            
    };

    class IScrfdManager
    {
        public:
           static std::shared_ptr<IScrfd> create(); 
    };

}; // namespace MatrixRobotVision

#endif // SIMPLE_YOLO_HPP