#include "face_register.h"
#include <fstream>
// 构造函数
FaceRegister::FaceRegister() 
{
    // 初始化代码
}

// 析构函数
FaceRegister::~FaceRegister() {
    // 清理代码
}

int FaceRegister::Init(std::string database_path)
{
    // 实现代码
    database_path_ = database_path;
    Load(database_path);
    Update();
    return 0; // 返回值
}

// 在数据库中搜索人脸
int FaceRegister::SearchFace(const cv::cuda::GpuMat& face_feature, float score_thresh, std::vector<std::string>& face_ids, std::vector<float>& face_scores) 
{
    if(face_feature.empty())
    {
        return -1;
    }
    face_matcher_.Matching(face_feature,score_thresh, face_ids, face_scores);
    // 实现代码
    return 0; // 返回值
}
int FaceRegister::GetDatabase(std::vector<std::string>& face_name_list,cv::cuda::GpuMat& face_features)
{
    nlohmann::json j;
    j = face_database_;
    // 确定值的维度
    int value_size = j.begin().value()[0].size();

    // 创建一个临时的 cv::Mat 来存储所有的值
    cv::Mat all_values(j.size(), value_size, CV_32F);

    // 解析 JSON 文件中的每个键值对
    int row = 0;
    for (auto& element : j.items()) {
        std::string key = element.key();
        nlohmann::json value = element.value();

        // 将键添加到键容器中
        face_name_list.push_back(key);

        // 将值转换为 cv::Mat 并存储到 all_values 中
        std::vector<float> value_vector;
        for (auto& v : value) {
            for (auto& vv : v) {
                value_vector.push_back(vv.get<float>());
            }
        }
        memcpy(all_values.ptr<float>(row), value_vector.data(), value_size * sizeof(float));
        ++row;
    }

    // 将 all_values 上传到 GPU
    face_features.upload(all_values);
    return 0;
}
int FaceRegister::Update()
{
    std::vector<std::string> face_ids;
    cv::cuda::GpuMat face_features;
    GetDatabase(face_ids,face_features);
    face_matcher_ = FaceMatcher(face_ids,face_features);
    return 0;
}

int FaceRegister::Load(std::string database_path)
{
        // 读取 JSON 文件
    std::ifstream file(database_path.c_str());
    nlohmann::json j;
    file >> j;
    file.close();
    face_database_ = j;
    return 0;
}
