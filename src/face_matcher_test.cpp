#include "face_matcher.h"
#include <opencv2/opencv.hpp>
#include <vector>
#include <string>
#include <iostream>
#include <glog/logging.h>
#include "cuda_utils.h"


int main() {
    // 创建一个 FaceMatcher 对象
    FaceMatcher face_matcher;

    // 测试初始化函数
    std::string dataset_path = "/home/jetson/workspace/faceID_jzb/data/known_people/test.json";
    if (face_matcher.Init(dataset_path) != 0) {
        std::cerr << "Failed to initialize FaceMatcher." << std::endl;
        return -1;
    }
    // cv::cuda::GpuMat face_feature_dataset;
    // face_feature_dataset = face_matcher.GetFaceFeature();
    // LOG(INFO) << gpuMatToString(face_feature_dataset);
    // 创建一个模拟的人脸特征
    cv::cuda::GpuMat face_feature;
    std::vector<std::string> face_name;
    // 填充 face_feature 数据...
    face_matcher.ParseDatasetFile("/home/jetson/workspace/faceID_jzb/data/known_people/Zhangzhaokang.json",face_feature,face_name);

    // 测试匹配函数
    float score_threshold = 0.5;
    std::vector<std::string> face_ids;
    std::vector<float> scores;
    if (face_matcher.Matching(face_feature, score_threshold, face_ids, scores) != 0) {
        std::cerr << "Failed to match face." << std::endl;
        return -1;
    }

    // 输出匹配结果
    for (size_t i = 0; i < face_ids.size(); ++i) {
        std::cout << "Face ID: " << face_ids[i] << ", Score: " << scores[i] << std::endl;
    }

    return 0;
}


// #include <iostream>
// #include <vector>
// #include <opencv2/opencv.hpp>
// #include <opencv2/cudaarithm.hpp>

// class FaceMatcher {
// public:
//     cv::cuda::GpuMat dataset_embeddings;
//     std::vector<std::string> dataset_names_list;

//     FaceMatcher(const cv::Mat& embeddings, const std::vector<std::string>& names) {
//         dataset_embeddings.upload(embeddings);  // 上传到 GPU
//         dataset_names_list = names;
//     }

//     cv::cuda::GpuMat get_scores(const cv::cuda::GpuMat& x, double mean = 1.40, double std = 0.2) {
//         cv::cuda::GpuMat transformed, scores;

//         // (x - mean) / std
//         cv::cuda::subtract(x, mean, transformed);
//         cv::cuda::divide(transformed, std, transformed);  // -(x - mean) / std

//         // Apply sigmoid: 1 / (1 + exp(-x))
//         cv::cuda::exp(transformed, scores);  // exp(-x)
//         cv::cuda::add(scores, 1.0, scores);   // 1 + exp(-x)
//         cv::cuda::divide(1.0, scores, scores); // 1 / (1 + exp(-x))

//         return scores;
//     }
//     void frame_embedding_matching(const cv::Mat& face_emb, double score_threshold,
//                                   std::vector<std::string>& dst_names, std::vector<float>& dst_scores) {
//         int nums = face_emb.rows;
//         cv::cuda::GpuMat d_face_emb, d_dist, d_scores;
//         d_face_emb.upload(face_emb);

//         // 计算欧氏距离
//         computeL2DistanceCUDA(d_face_emb, dataset_embeddings, d_dist);
//         cv::Mat h_dist;
//         d_dist.download(h_dist);
//         LOG(INFO) << "h_dist: " << h_dist;

//         // 计算匹配得分
//         d_scores = get_scores(d_dist);
//         cv::Mat scores;
//         d_scores.download(scores);

//         // 选择最高得分类别
//         dst_names.resize(nums);
//         dst_scores.resize(nums);
//         std::vector<int> record_label;

//         for (int i = 0; i < nums; i++) {
//             cv::Mat row = scores.row(i);
//             cv::Point maxLoc;
//             double maxScore;
//             cv::minMaxLoc(row, nullptr, &maxScore, nullptr, &maxLoc);

//             int id = maxLoc.x;
//             std::string label = dataset_names_list[id];

//             while (std::find(record_label.begin(), record_label.end(), id) != record_label.end()) {
//                 row.at<float>(0, id) = 0;  // 避免重复
//                 cv::minMaxLoc(row, nullptr, &maxScore, nullptr, &maxLoc);
//                 id = maxLoc.x;
//                 label = dataset_names_list[id];

//                 if (maxScore < score_threshold || maxScore == 0) {
//                     id = -1;
//                     break;
//                 }
//             }

//             record_label.push_back(id);
//             dst_names[i] = (id == -1) ? "Unknown" : dataset_names_list[id];
//             dst_scores[i] = maxScore;
//         }
//     }
// };

// int main() {
//     // 假设数据库有 5 个特征向量，每个特征 128 维
//     cv::Mat database = (cv::Mat_<float>(3, 3) << 1,2,3,
//                                                 4,5,6,
//                                                 7,8,9);
//     std::vector<std::string> names = {"Alice", "Bob", "Charlie"};

//     FaceMatcher matcher(database, names);

//     // 输入一帧人脸特征
//     cv::Mat face_emb = (cv::Mat_<float>(2, 3) << 1,2,3,
//                                                 0,0,0);

//     std::vector<std::string> dst_names;
//     std::vector<float> dst_scores;
//     matcher.frame_embedding_matching(face_emb, 0.5, dst_names, dst_scores);

//     // 输出结果
//     for (size_t i = 0; i < dst_names.size(); i++) {
//         std::cout << "Face " << i << ": " << dst_names[i] << " (score: " << dst_scores[i] << ")\n";
//     }

//     return 0;
// }
