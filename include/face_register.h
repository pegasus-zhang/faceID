#pragma once
#include "face_matcher.h"
#include "json.hpp"
class FaceRegister
{
public:
    FaceRegister();
    ~FaceRegister();
    int Init(std::string database_path);
    int SearchFace(const cv::cuda::GpuMat& face_feature,float score_thresh,std::vector<std::string>& face_ids,std::vector<float>& face_scores);
    int GetDatabase(std::vector<std::string>& face_name_list,cv::cuda::GpuMat& face_features);
private:
    nlohmann::json face_database_;
    FaceMatcher face_matcher_;
    std::string database_path_;
    int Update();
    int Load(std::string database_path);
};