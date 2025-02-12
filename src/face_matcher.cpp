#include "face_matcher.h"
#include <opencv2/opencv.hpp>
#include <vector>
#include <string>
#include <json.hpp>
#include <fstream>
#include <glog/logging.h>
#include "cuda_utils.h"
// 默认构造函数
FaceMatcher::FaceMatcher() {
    // 初始化操作
}

// 析构函数
FaceMatcher::~FaceMatcher() {
    // 清理操作
}

// 带参数的构造函数
FaceMatcher::FaceMatcher(const cv::cuda::GpuMat& face_feature, const std::vector<std::string>& face_id) {
    // 初始化操作
}


// 初始化函数
int FaceMatcher::Init(const std::string& dataset_path) {
    // 初始化操作
    return ParseDatasetFile(dataset_path, face_feature_, face_name_list_);
}

cv::cuda::GpuMat FaceMatcher::get_scores(const cv::cuda::GpuMat& x, double mean = 1.40, double std = 0.2) {
    cv::cuda::GpuMat transformed, scores;

    // (x - mean) / std
    cv::cuda::subtract(x, mean, transformed);
    cv::cuda::divide(transformed, std, transformed);  // -(x - mean) / std

    // Apply sigmoid: 1 / (1 + exp(-x))
    cv::cuda::exp(transformed, scores);  // exp(-x)
    cv::cuda::add(scores, 1.0, scores);   // 1 + exp(-x)
    cv::cuda::divide(1.0, scores, scores); // 1 / (1 + exp(-x))

    return scores;
}
int FaceMatcher::Matching(const cv::cuda::GpuMat& d_face_emb, float score_threshold,
                                std::vector<std::string>& dst_names, std::vector<float>& dst_scores) {
    int nums = d_face_emb.rows;
    cv::cuda::GpuMat d_dist, d_scores;

    // 计算欧氏距离
    computeL2DistanceCUDA(d_face_emb, face_feature_, d_dist);
    cv::Mat h_dist;
    // d_dist.download(h_dist);
    // LOG(INFO) << "h_dist: " << h_dist;

    // 计算匹配得分
    d_scores = get_scores(d_dist);
    cv::Mat scores;
    d_scores.download(scores);

    // 选择最高得分类别
    dst_names.resize(nums);
    dst_scores.resize(nums);
    std::vector<int> record_label;

    for (int i = 0; i < nums; i++) {
        cv::Mat row = scores.row(i);
        cv::Point maxLoc;
        double maxScore;
        cv::minMaxLoc(row, nullptr, &maxScore, nullptr, &maxLoc);

        int id = maxLoc.x;
        std::string label = face_name_list_[id];

        while (std::find(record_label.begin(), record_label.end(), id) != record_label.end()) {
            row.at<float>(0, id) = 0;  // 避免重复
            cv::minMaxLoc(row, nullptr, &maxScore, nullptr, &maxLoc);
            id = maxLoc.x;
            label = face_name_list_[id];

            if (maxScore < score_threshold || maxScore == 0) {
                id = -1;
                break;
            }
        }

        record_label.push_back(id);
        dst_names[i] = (id == -1) ? "Unknown" : face_name_list_[id];
        dst_scores[i] = maxScore;
    }
    return 0;
}


cv::cuda::GpuMat FaceMatcher::GetFaceFeature() const
{
    return face_feature_;
}
int FaceMatcher::ParseDatasetFile(const std::string& dataset_path,cv::cuda::GpuMat& face_feature, std::vector<std::string>& face_name_list) const
{
    // 初始化操作
    // 读取 JSON 文件
    std::ifstream file(dataset_path.c_str());
    nlohmann::json j;
    file >> j;

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
    face_feature.upload(all_values);
    return 0; // 返回0表示成功
}

