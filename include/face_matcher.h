#pragma once
#include <string>
#include <opencv2/opencv.hpp>
#include <opencv2/cudacodec.hpp>
#include <opencv2/cudaimgproc.hpp> 
#include <opencv2/cudawarping.hpp>
#include <opencv2/cudaarithm.hpp>
class FaceMatcher
{
public:
    FaceMatcher();
    ~FaceMatcher();
    FaceMatcher(const std::vector<std::string>& face_id, const cv::cuda::GpuMat& face_feature);
    int Init(const std::string& database_path);
    // Match two face embeddings
    int Matching(const cv::cuda::GpuMat& face_feature, float score_threshold,std::vector<std::string>& face_ids,std::vector<float>& scores);
    cv::cuda::GpuMat get_scores(const cv::cuda::GpuMat& x, double mean, double stddev);
    cv::cuda::GpuMat GetFaceFeature() const;
    int ParseDatasetFile(const std::string& database_path,cv::cuda::GpuMat& face_feature, std::vector<std::string>& face_name_list) const;
private:
    // The face recognition model
    cv::cuda::GpuMat face_feature_;
    std::vector<std::string> face_name_list_; // The face name list
};
