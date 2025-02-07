// #include "simple_yolo.h"
// #include <glog/logging.h>
// #include "tool.hpp"
// #include <gtest/gtest.h>

// using namespace MatrixRobotVision;

// TEST(YoloTest, SingleBatch)
// {
//     cv::Mat image = cv::imread("../data/bus.png");
//     std::shared_ptr<IYolo> yolo_engine = IYoloManager::create();
//     std::string yolo_onnx_file = "../weights/yolov8n.onnx";
//     yolo_engine->Init(yolo_onnx_file,false);
//     //warm up
//     yolo_engine->Inference(image).get();
//     //推理
//     std::shared_future<IYolo::BoxArray> boxes_future;
//     IYolo::BoxArray boxes;
//     auto start = std::chrono::duration_cast<std::chrono::microseconds>(std::chrono::system_clock::now().time_since_epoch()).count() / 1000.0;
//     boxes_future = yolo_engine->Inference(image);
//     boxes = boxes_future.get();
//     auto end = std::chrono::duration_cast<std::chrono::microseconds>(std::chrono::system_clock::now().time_since_epoch()).count() / 1000.0;
//     double used_time = (end- start);

//     //gtest check
//     EXPECT_EQ(1,boxes.size());
//     EXPECT_NEAR(533.645,boxes[0].left,0.1);
//     EXPECT_NEAR(589.3826904296875,boxes[0].right,0.1);
//     EXPECT_NEAR(149.99142456054688,boxes[0].top,0.1);
//     EXPECT_NEAR(156.55322265625,boxes[0].bottom,0.1);
//     EXPECT_NEAR(0.9008791446685791,boxes[0].confidence,0.01);
//     EXPECT_EQ(0,boxes[0].class_label);
//     EXPECT_GE(10.0,used_time) << "used_time: "<< used_time;  
// }


// TEST(YoloTest, MultiBatch)
// {
//     cv::Mat image = cv::imread("../data/bus.png");

//     std::shared_ptr<IYolo> yolo_engine = IYoloManager::create();
//     std::string yolo_onnx_file = "../weights/yolov8n.onnx";
//     int batch_size = 4;
//     yolo_engine->SetBatchSize(batch_size);
//     yolo_engine->Init(yolo_onnx_file,false);
//     //warm up
//     yolo_engine->Inference(image).get();

//     // 多batch推理
//     std::vector<cv::Mat> images(batch_size);
//     for(int i = 0;i<batch_size;i++)
//     {
//         images[i] = image;
//     }
//     std::vector<std::shared_future<IYolo::BoxArray>> boxes_future(batch_size);
//     std::vector<IYolo::BoxArray> boxes(batch_size);
//     auto start = std::chrono::duration_cast<std::chrono::microseconds>(std::chrono::system_clock::now().time_since_epoch()).count() / 1000.0;
//     boxes_future = yolo_engine->Inference(images);
//     for(int i = 0;i<boxes_future.size();i++)
//     {
//         boxes[i] = boxes_future[i].get(); 
//     }
//     auto end = std::chrono::duration_cast<std::chrono::microseconds>(std::chrono::system_clock::now().time_since_epoch()).count() / 1000.0;
//     double used_time = (end- start)/batch_size;

//     //gtest check
//     for(int i = 0;i<boxes.size();i++)
//     {
//         EXPECT_EQ(1,boxes[i].size());
//         EXPECT_NEAR(1205,boxes[i][0].left,0.1);
//         EXPECT_NEAR(1400,boxes[i][0].right,0.1);
//         EXPECT_NEAR(528.5,boxes[i][0].top,0.1);
//         EXPECT_NEAR(723.5,boxes[i][0].bottom,0.1);
//         EXPECT_NEAR(0.955276,boxes[i][0].confidence,0.01);
//         EXPECT_EQ(0,boxes[i][0].class_label);
//     }
//     EXPECT_GE(10.0,used_time) << "used_time: "<< used_time;  
// }
