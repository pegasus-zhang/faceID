#include "face_recognizer.h"
#include <opencv2/opencv.hpp>

int main()
{
    // 创建 FaceRecognizer 对象
    FaceRecognizer face_recognizer;
    face_recognizer.Init("/home/jetson/workspace/faceID_jzb/data/known_people/database-resnet50.json", 0.5, 0.5);

    // 读取测试图像
    cv::cuda::GpuMat img;
    cv::Mat cpu_img = cv::imread("/home/jetson/workspace/faceID_jzb/data/backup/frame_1733835120220579455.png");
    img.upload(cpu_img);

    // 检测人脸并提取特征
    FaceInfo face_info;
    int ret = face_recognizer.DetectFace(img, face_info);
    if (ret != 0)
    {
        std::cerr << "Error: No face detected." << std::endl;
        return -1;
    }

    // 输出检测结果
    std::cout << "Detected " << face_info.face_ids.size() << " faces." << std::endl;
    for (size_t i = 0; i < face_info.face_ids.size(); i++)
    {
        std::cout << "Face " << i << ": ID = " << face_info.face_ids[i] << ", Score = " << face_info.scores[i] << std::endl;
    }
    // 在图像上绘制人脸边界框并显示人脸 ID 和分数
    for (size_t i = 0; i < face_info.boxes.size(); i++)
    {
        const auto& box = face_info.boxes[i];
        cv::rectangle(cpu_img, cv::Point(box.left, box.top), cv::Point(box.right, box.bottom), cv::Scalar(0, 0, 255), 2);
        std::string label = "ID: " + face_info.face_ids[i] + ", Score: " + std::to_string(face_info.scores[i]);
        int baseline = 0;
        cv::Size label_size = cv::getTextSize(label, cv::FONT_HERSHEY_SIMPLEX, 0.5, 1, &baseline);
        cv::putText(cpu_img, label, cv::Point(box.left, box.top - label_size.height - 5), cv::FONT_HERSHEY_SIMPLEX, 0.5, cv::Scalar(0, 255, 0), 1);
    }

    // // 显示图像
    // cv::imshow("Detected Faces", cpu_img);
    // cv::waitKey(0);
    cv::imwrite("/home/jetson/workspace/faceID_jzb/data/backup/frame_1733835120220579455_result.png", cpu_img);
    return 0;
}
