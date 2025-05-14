#pragma once
#include <opencv2/opencv.hpp>
#include <opencv2/core/cuda.hpp>
#include <opencv2/cudaobjdetect.hpp>
#include "scrfd_cuda.h"
#include "face_alignment.h"
#include "face_feature.h"
#include "face_register.h"
#include <dirent.h>
#include <sys/stat.h>
#include <unistd.h>
#include <algorithm>
struct FaceInfo
{
    ScrfdGpu::IScrfd::BoxArray boxes;
    cv::cuda::GpuMat features;
    std::vector<std::string> face_ids;
    std::vector<float> scores;
};

class FaceRecognizer
{
public:
    FaceRecognizer();
    ~FaceRecognizer();
    int Init(nlohmann::json config);
    int CropFacesAlignment(const cv::cuda::GpuMat& img, const ScrfdGpu::IScrfd::BoxArray& boxes,std::vector<cv::cuda::GpuMat>& aligned_faces);
    int ExtractFeature(const std::vector<cv::cuda::GpuMat>& aligned_faces, cv::cuda::GpuMat& features);
    int DetectExtractFeature(const cv::cuda::GpuMat& img,FaceInfo& face_info);
    int DetectFace(const cv::cuda::GpuMat& img,FaceInfo& face_info);
    std::future<int> DetectFaceAsync(const cv::cuda::GpuMat& img,FaceInfo& face_info);
    int SetName2IDDict(const nlohmann::json& name2id_dic);
    int GetName2IDDict(nlohmann::json& name2id_dic);
    int GetNameList(std::vector<std::string>& name_list);
    int CreateDatabase(const std::string& database_path);
    int AddFace(const std::string& face_name,const cv::cuda::GpuMat& image);
    int DeleteFace(const std::string& face_name);
private:
    nlohmann::json config_;
    std::shared_ptr<ScrfdGpu::IScrfd> face_detector_ = nullptr;
    std::shared_ptr<GeelyRobotVisionGpu::IFaceFeature> face_feature_ = nullptr;
    std::shared_ptr<FaceRegister> face_register_ = nullptr;
    nlohmann::json name2id_dic_;
    bool IsImageFile(const std::string& filename);
    void GetAllImagesPath(const std::string& dir_path, std::vector<std::string>& image_paths);
};