#include "face_recognizer.h"
#include<fstream>
FaceRecognizer::FaceRecognizer()  
{
}

FaceRecognizer::~FaceRecognizer()
{
    // 清理资源
}

int FaceRecognizer::Init(nlohmann::json config)
{
    config_ = config;
    face_detector_ = ScrfdGpu::IScrfdManager::create();
    face_detector_->Init(config["model_parameter"]["face_detector"]["model_path"],
                         false,config["model_parameter"]["face_detector"]["confidence_threshold"]);
    face_feature_ = GeelyRobotVisionGpu::IFaceFeatureManager::create();
    face_feature_->SetBatchSize(5);
    face_feature_->SetPrecision(GeelyRobotVisionGpu::IFaceFeature::Mode::FP32);
    face_feature_->Init(config["model_parameter"]["face_feature"]["model_path"],
                        config["model_parameter"]["face_feature"]["build_engine"],
                        config["model_parameter"]["face_feature"]["confidence_threshold"]);
    
    face_register_ = std::make_shared<FaceRegister>();
    face_register_->Init(config["database_path"]);
    // 读取 JSON 文件
    std::string name2id_path = config["name2id_path"];
    std::ifstream file(name2id_path.c_str());
    if (!file.is_open()) {
        std::cerr << "Failed to open file." << std::endl;
        return -1; // 返回-1表示失败
    }
    // 将 JSON 文件内容解析到 JSON 对象中
    nlohmann::json name2id_dic;
    file >> name2id_dic;
    file.close();
    SetName2IDDict(name2id_dic);

    return 0; // 返回0表示成功
}

int FaceRecognizer::CropFacesAlignment(const cv::cuda::GpuMat& img, const ScrfdGpu::IScrfd::BoxArray& boxes, std::vector<cv::cuda::GpuMat>& aligned_faces)
{
    // 裁剪和对齐人脸
    std::vector<std::vector<cv::Point2f>> all_landmarks;
    for(int i=0;i<boxes.size();i++)
    {
        all_landmarks.push_back(boxes[i].keypoints);
    }
    aligned_faces = GeelyRobotVisionGpu::FaceAlignment(img, all_landmarks);
    return 0; // 返回0表示成功
}

int FaceRecognizer::ExtractFeature(const std::vector<cv::cuda::GpuMat>& aligned_faces, cv::cuda::GpuMat& features)
{
    // 提取人脸特征
    std::vector<cv::cuda::GpuMat> all_face_features;
    std::vector<std::shared_future<cv::cuda::GpuMat>> all_face_features_future = face_feature_->Inference(aligned_faces);
    for(int i=0;i<all_face_features_future.size();i++)
    {
        all_face_features.push_back(all_face_features_future[i].get());
    }
    // 将所有特征合并为一个 GpuMat
     // 确保所有特征的列数和数据类型一致
    int feature_dim = all_face_features[0].cols;
    int feature_type = all_face_features[0].type();
    for (const auto& feat : all_face_features) {
        if (feat.cols != feature_dim || feat.type() != feature_type) {
            std::cerr << "错误：所有特征的列数和数据类型必须相同！" << std::endl;
            return -1;
        }
    }

    // 计算合并后的矩阵大小
    int total_rows = all_face_features.size();
    cv::cuda::GpuMat merged_features(total_rows, feature_dim, feature_type);

    // 依次将每个 GpuMat 拷贝到 merged_features 中
    for (size_t i = 0; i < all_face_features.size(); i++) {
        cv::cuda::GpuMat roi(merged_features, cv::Rect(0, i, feature_dim, 1)); // 选取某一行
        all_face_features[i].copyTo(roi);
    }
    features = merged_features;
    return 0; // 返回0表示成功
}

int FaceRecognizer::DetectExtractFeature(const cv::cuda::GpuMat& img, FaceInfo& face_info)
{
    if(img.empty())
    {
        return -1;
    }
    // 检测人脸并提取特征
    ScrfdGpu::IScrfd::BoxArray boxes;
    boxes = face_detector_->Inference(img).get();
    if (0 == boxes.size())
    {
        return -1;
    }
    face_info.boxes = boxes;
    std::vector<cv::cuda::GpuMat> aligned_faces;
    CropFacesAlignment(img, boxes, aligned_faces);
    return ExtractFeature(aligned_faces, face_info.features); // 返回0表示成功
}

int FaceRecognizer::DetectFace(const cv::cuda::GpuMat& img, FaceInfo& face_info)
{
    // 检测人脸
    int ret = DetectExtractFeature(img, face_info);
    if(ret != 0)
    {
        return ret;
    }
    ret = face_register_->SearchFace(face_info.features,config_["model_parameter"]["face_feature"]["confidence_threshold"], face_info.face_ids, face_info.scores);
    return ret; // 返回0表示成功
}

std::future<int> FaceRecognizer::DetectFaceAsync(const cv::cuda::GpuMat& img,FaceInfo& face_info)
{
    return std::async(std::launch::async, &FaceRecognizer::DetectFace, this, img, std::ref(face_info));
}

int FaceRecognizer::SetName2IDDict(const nlohmann::json& name2id_dic) {
    name2id_dic_ = name2id_dic;
    return 0; // 返回0表示成功
}

int FaceRecognizer::GetName2IDDict(nlohmann::json& name2id_dic) {
    name2id_dic = name2id_dic_;
    return 0; // 返回0表示成功
}

int FaceRecognizer::GetNameList(std::vector<std::string>& name_list)
{
    //name2id_dic_ = name2id_dic;
    for (const auto& item : name2id_dic_.items()) {
        name_list.push_back(item.key());
    }
    return 0; // 返回0表示成功
}