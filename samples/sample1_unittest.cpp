#include "simple_yolo_cuda.h"
#include <glog/logging.h>
#include "tool.hpp"
#include <gtest/gtest.h>

using namespace MatrixRobotVisionGpu;

TEST(YoloTest, SingleBatchGpu)
{
    cv::Mat image = cv::imread("../data/bus.jpg");
    cv::cuda::GpuMat gpu_image;
    gpu_image.upload(image);

    std::shared_ptr<IYolo> yolo_engine = IYoloManager::create();
    std::string yolo_onnx_file = "../weights/yolov8n.onnx";
    yolo_engine->Init(yolo_onnx_file,false);
    //warm up
    yolo_engine->Inference(gpu_image).get();

    std::shared_future<IYolo::BoxArray> boxes_future;
    IYolo::BoxArray boxes;
    //推理
    auto start = std::chrono::duration_cast<std::chrono::microseconds>(std::chrono::system_clock::now().time_since_epoch()).count() / 1000.0;
    boxes_future = yolo_engine->Inference(gpu_image);
    boxes = boxes_future.get();
    auto end = std::chrono::duration_cast<std::chrono::microseconds>(std::chrono::system_clock::now().time_since_epoch()).count() / 1000.0;
    double used_time = end- start;

    //gtest check
    EXPECT_EQ(1,boxes.size());
    EXPECT_NEAR(1205,boxes[0].left,0.1);
    EXPECT_NEAR(1400,boxes[0].right,0.1);
    EXPECT_NEAR(528.5,boxes[0].top,0.1);
    EXPECT_NEAR(723.5,boxes[0].bottom,0.1);
    EXPECT_NEAR(0.955276,boxes[0].confidence,0.01);
    EXPECT_EQ(0,boxes[0].class_label);
    EXPECT_GE(10.0,used_time)<< "used_time: "<< used_time;
}


TEST(YoloTest, MultiBatchGpu)
{
    cv::Mat image = cv::imread("../data/bus.jpg");
    cv::cuda::GpuMat gpu_image;
    gpu_image.upload(image);

    std::shared_ptr<IYolo> yolo_engine = IYoloManager::create();
    std::string yolo_onnx_file = "../weights/yolov8n.onnx";
    int batch_size = 4;
    yolo_engine->SetBatchSize(batch_size);
    yolo_engine->Init(yolo_onnx_file,false);
    //warm up
    yolo_engine->Inference(gpu_image).get();

    std::vector<cv::cuda::GpuMat> images(batch_size);
    for(int i = 0;i<batch_size;i++)
    {
        images[i] = gpu_image;
    }
    std::vector<std::shared_future<IYolo::BoxArray>> boxes_future(batch_size);
    std::vector<IYolo::BoxArray> boxes(batch_size);
    // 多batch推理
    auto start = std::chrono::duration_cast<std::chrono::microseconds>(std::chrono::system_clock::now().time_since_epoch()).count() / 1000.0;
    boxes_future = yolo_engine->Inference(images);
    for(int i = 0;i<boxes_future.size();i++)
    {
        boxes[i] = boxes_future[i].get(); 
    }
    auto end = std::chrono::duration_cast<std::chrono::microseconds>(std::chrono::system_clock::now().time_since_epoch()).count() / 1000.0;
    double used_time = (end- start)/batch_size;

    //gtest check
    for(int i = 0;i<boxes.size();i++)
    {
        EXPECT_EQ(1,boxes[i].size());
        EXPECT_NEAR(1205,boxes[i][0].left,0.1);
        EXPECT_NEAR(1400,boxes[i][0].right,0.1);
        EXPECT_NEAR(528.5,boxes[i][0].top,0.1);
        EXPECT_NEAR(723.5,boxes[i][0].bottom,0.1);
        EXPECT_NEAR(0.955276,boxes[i][0].confidence,0.01);
        EXPECT_EQ(0,boxes[i][0].class_label);
    }
    EXPECT_GE(10.0,used_time) << "used_time: "<< used_time;  
}
