#include "face_recognizer.h"
#include<fstream>
#include <unistd.h>
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
    //判断数据库路径是否存在
    std::string database_path = config["database_path"];
    if (access(database_path.c_str(), F_OK) != 0) {
        CreateDatabase(database_path);
    }
    face_register_->Init(database_path);
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
int FaceRecognizer::CreateDatabase(const std::string& database_path)
{
    std::cout << ">>>>>>>>>>>>> 开始注册人脸 <<<<<<<<<<<<<" << std::endl;

    // 使用 OpenCV 的 glob 获取目录中的所有文件
    std::vector<std::string> image_files;
    size_t slash_pos = database_path.find_last_of("/\\");
    if (slash_pos == std::string::npos) {
        // 如果没有找到斜杠，说明路径中没有目录部分
        return -1;
    }
    std::string database_dir_path = database_path.substr(0, slash_pos); // 返回目录部分
    GetAllImagesPath(database_dir_path, image_files);

    for (const auto& image_file : image_files) 
    {
        // 提取文件名
        size_t slash_pos = image_file.find_last_of("/\\");
        std::string name = (slash_pos == std::string::npos) ? image_file : image_file.substr(slash_pos + 1);

        // 提取标签
        std::string label = name.substr(0, name.find('-'));
        if (label.empty() || name == label) 
        {
            std::cout << "file=" << image_file << ",\t图片名称不合法，请将图片按照[ID-XXXX.jpg]命名,如:张三-image.jpg" << std::endl;
            continue;
        }

        // 使用 OpenCV 读取图片
        cv::Mat bgr = cv::imread(image_file);
        if (bgr.empty()) 
        {
            std::cout << "file=" << image_file << ",\t无法读取图片" << std::endl;
            continue;
        }

        std::cout << "file=" << image_file << ",\t";
        // 将图片转换为 GPU Mat
        cv::cuda::GpuMat gpu_bgr;
        gpu_bgr.upload(bgr);
        // 添加人脸到数据库
        AddFace(label, gpu_bgr);
    }

    // 更新人脸数据库并保存
    face_register_->Update();
    face_register_->SaveDatabase(database_path);

    std::cout << ">>>>>>>>>>>>> 完成注册人脸 <<<<<<<<<<<<<" << std::endl;
    return 0;
}
int FaceRecognizer::AddFace(const std::string& face_name,const cv::cuda::GpuMat& image)
{
    // 检测人脸
    FaceInfo face_info;
    DetectExtractFeature(image, face_info); // 提取特征
    if (face_info.boxes.empty()) 
    {
        std::cout <<"no face" << std::endl;
        return -1; // 返回-1表示失败
    }
    face_register_->AddFace(face_name, face_info.features); // 添加人脸到数据库
    std::cout << face_name << "人脸注册成功" << std::endl;
    return 0; // 返回0表示成功
}
int FaceRecognizer::DeleteFace(const std::string& face_name)
{
    // 删除人脸
    face_register_->DeleteFace(face_name);
    std::cout << face_name << "人脸删除成功" << std::endl;
    return 0; // 返回0表示成功
}

bool FaceRecognizer::IsImageFile(const std::string& filename) {
    std::string ext;
    size_t dot_pos = filename.find_last_of(".");
    if (dot_pos != std::string::npos) {
        ext = filename.substr(dot_pos + 1);
        std::transform(ext.begin(), ext.end(), ext.begin(), ::tolower);
        return ext == "jpg" || ext == "jpeg" || ext == "png" || ext == "bmp" || ext == "tiff" || ext == "gif";
    }
    return false;
}

void FaceRecognizer::GetAllImagesPath(const std::string& dir_path, std::vector<std::string>& image_paths) {
    DIR* dir = opendir(dir_path.c_str());
    if (!dir) return;

    struct dirent* entry;
    while ((entry = readdir(dir)) != nullptr) {
        std::string name = entry->d_name;
        if (name == "." || name == "..") continue;

        std::string full_path = dir_path + "/" + name;

        struct stat path_stat;
        if (stat(full_path.c_str(), &path_stat) == -1) continue;

        if (S_ISDIR(path_stat.st_mode)) {
            // 如果是目录，递归进入
            GetAllImagesPath(full_path, image_paths);
        } else if (S_ISREG(path_stat.st_mode)) {
            // 如果是普通文件，检查是否为图片
            if (IsImageFile(name)) {
                image_paths.push_back(full_path);
            }
        }
    }

    closedir(dir);
}