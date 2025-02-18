#pragma once
#include "my_thread.h"
#include "ros_adapter.h"
#include "face_recognizer.h"
#include <json.hpp>
#include <memory>
class FaceDetectThread: public MyThread
{
private:
    /* data */
    std::unique_ptr<RosAdapter> ros_adapter_ = nullptr;
    std::shared_ptr<FaceRecognizer> face_recognizer_ = nullptr;
    nlohmann::json config_;
    std::string host_name_="";
    bool print_flag_ = false;
    std::mutex mutex_;
public:
    FaceDetectThread(/* args */);
    ~FaceDetectThread();
    void run() override;
    int Init(nlohmann::json config);
    void Spin();
    void GetImageTask(cv::cuda::GpuMat& gpu_frame);
    int SetHostName(std::string host_name);
    std::string GetHostName();
    int FlipPrintFlag();
};