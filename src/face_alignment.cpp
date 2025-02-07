#include "face_alignment.h"
#include <iostream>
#include <vector>
#include <stdexcept>
namespace GeelyRobotVisionGpu
{
    // ----------------------------------------------------------------------------
    // 1. 对单个点进行仿射变换（CPU 版本）
    // ----------------------------------------------------------------------------
    cv::Point2f pointAffineTransform(const cv::Point2f &point, const cv::Mat &trans)
    {
        // 构造扩展的点向量 [x, y, 1]
        cv::Mat pointMat = (cv::Mat_<double>(3, 1) << point.x, point.y, 1.0);
        cv::Mat result = trans * pointMat;
        return cv::Point2f(static_cast<float>(result.at<double>(0, 0)),
                        static_cast<float>(result.at<double>(1, 0)));
    }

    // ----------------------------------------------------------------------------
    // 2. 使用 GPU 对图像进行仿射变换  
    //    传入的图像类型为 cv::cuda::GpuMat，利用 cv::cuda::warpAffine 完成加速
    // ----------------------------------------------------------------------------
    cv::cuda::GpuMat imageAffineTransform(const cv::cuda::GpuMat &gpuImage, const cv::Size &dsize, const cv::Mat &trans)
    {
        cv::cuda::GpuMat gpuOut;
        cv::cuda::warpAffine(gpuImage, gpuOut, trans, dsize);
        return gpuOut;
    }

    // ----------------------------------------------------------------------------
    // 3. 根据关键点计算仿射变换矩阵（CPU 计算）  
    //    参数 transType 可选 "estimate" 或 "affine"
    // ----------------------------------------------------------------------------
    cv::Mat getAffineTransform(const std::vector<cv::Point2f> &kpts,
                                const std::vector<cv::Point2f> &kptsRef,
                                const std::string &transType = "estimate")
    {
        cv::Mat trans;
        if (transType == "estimate")
        {
            cv::Mat inliers;
            // 使用所有关键点估计仿射矩阵
            trans = cv::estimateAffine2D(kpts, kptsRef, inliers);
        }
        else if (transType == "affine")
        {
            if (kpts.size() < 3 || kptsRef.size() < 3)
                throw std::runtime_error("需要至少三个点进行仿射变换！");
            std::vector<cv::Point2f> kptsSub(kpts.begin(), kpts.begin() + 3);
            std::vector<cv::Point2f> kptsRefSub(kptsRef.begin(), kptsRef.begin() + 3);
            trans = cv::getAffineTransform(kptsSub, kptsRefSub);
        }
        else
        {
            throw std::runtime_error("Error: 未知的变换类型 " + transType);
        }
        return trans;
    }

    // ----------------------------------------------------------------------------
    // 4. 利用 GPU 进行人脸对齐与裁剪  
    //    输入图像为 GPU 端图像（GpuMat），计算仿射矩阵后调用 cv::cuda::warpAffine
    // ----------------------------------------------------------------------------
    cv::cuda::GpuMat alignmentAndCropFace(const cv::cuda::GpuMat &gpuImage,
                                            const cv::Size &faceSize,
                                            const std::vector<cv::Point2f> &kpts,
                                            const std::vector<cv::Point2f> &kptsRef,
                                            const std::string &alignType = "estimate")
    {
        cv::Mat trans;
        if (alignType == "estimate")
        {
            cv::Mat inliers;
            trans = cv::estimateAffine2D(kpts, kptsRef, inliers);
        }
        else if (alignType == "affine")
        {
            if (kpts.size() < 3 || kptsRef.size() < 3)
                throw std::runtime_error("需要至少三个点进行仿射变换！");
            std::vector<cv::Point2f> kptsSub(kpts.begin(), kpts.begin() + 3);
            std::vector<cv::Point2f> kptsRefSub(kptsRef.begin(), kptsRef.begin() + 3);
            trans = cv::getAffineTransform(kptsSub, kptsRefSub);
        }
        else
        {
            throw std::runtime_error("Error: 未知的对齐类型 " + alignType);
        }
        cv::cuda::GpuMat gpuFaceAligned;
        cv::cuda::warpAffine(gpuImage, gpuFaceAligned, trans, faceSize);
        return gpuFaceAligned;
    }

    // ----------------------------------------------------------------------------
    // 5. 获取参考人脸关键点  
    //    square 为 true 时输出尺寸为 [112, 112]，否则为 [96, 112]；
    //    vis 为 true 时显示参考关键点（使用 CPU 绘制）
    // ----------------------------------------------------------------------------
    std::vector<cv::Point2f> getReferenceFacialPoints(bool square = true, bool vis = false)
    {
        int baseWidth = 96;
        int baseHeight = 112;
        std::vector<cv::Point2f> kptsRef = {
            cv::Point2f(30.29459953f, 51.69630051f),
            cv::Point2f(65.53179932f, 51.50139999f),
            cv::Point2f(48.02519989f, 71.73660278f),
            cv::Point2f(33.54930115f, 92.3655014f),
            cv::Point2f(62.72990036f, 92.20410156f)
        };

        if (square)
        {
            int maxSize = std::max(baseWidth, baseHeight); // 此处为 112
            int diffW = maxSize - baseWidth;  // 112 - 96 = 16
            int diffH = maxSize - baseHeight; // 112 - 112 = 0

            for (size_t i = 0; i < kptsRef.size(); i++)
            {
                kptsRef[i].x += diffW / 2.0f;
                kptsRef[i].y += diffH / 2.0f;
            }
            baseWidth = maxSize;
            baseHeight = maxSize;
        }

        if (vis)
        {
            cv::Mat visImg = cv::Mat::zeros(baseHeight, baseWidth, CV_8UC3);
            for (size_t i = 0; i < kptsRef.size(); i++)
            {
                cv::circle(visImg, kptsRef[i], 2, cv::Scalar(0, 255, 0), -1);
            }
            cv::imshow("ref-Landmark", visImg);
            cv::waitKey(0);
        }
        return kptsRef;
    }
}
// ----------------------------------------------------------------------------
// 主函数示例：加载图像、上传到 GPU、生成参考关键点、估计仿射矩阵、
// 利用 GPU 进行人脸对齐与裁剪，并下载结果显示
// ----------------------------------------------------------------------------
using namespace GeelyRobotVisionGpu;
int main(int argc, char** argv)
{
    // 请确保传入正确的图像路径，或修改为你本地的图像文件路径
    cv::Mat image = cv::imread("/home/jetson/workspace/faceID_jzb/data/frame_1733835120220579455.png");
    if (image.empty())
    {
        std::cerr << "未能加载图像，请检查路径！" << std::endl;
        return -1;
    }

    // 将图像上传到 GPU（创建 GpuMat）
    cv::cuda::GpuMat gpuImage;
    gpuImage.upload(image);

    // 假设已有检测到的人脸关键点（示例数据，实际应用中请替换为真实检测结果）//[881.824, 129.703] [904.453, 133.318] [890.298, 141.911] [879.996, 153.094] [898.447, 155.83]
    std::vector<cv::Point2f> kpts = {
        cv::Point2f(881.824, 129.703),
        cv::Point2f(904.453, 133.318),
        cv::Point2f(890.298, 141.911),
        cv::Point2f(879.996, 153.094),
        cv::Point2f(898.447, 155.83)
    };
    // std::vector<cv::Point2f> kpts = {
    //     cv::Point2f(287.86636353, 306.13598633),
    //     cv::Point2f(399.58618164, 272.68032837),
    //     cv::Point2f(374.80252075, 360.95596313),
    //     cv::Point2f(326.71264648, 409.12332153),
    //     cv::Point2f(419.06210327, 381.41421509)
    // };
    // 获取参考人脸关键点，square 为 true 输出尺寸为 112x112，vis 为 true 时显示参考关键点
    std::vector<cv::Point2f> kptsRef = getReferenceFacialPoints(true, false);

    // 通过 CPU 计算仿射变换矩阵（"estimate" 方法）
    cv::Mat trans = getAffineTransform(kpts, kptsRef, "estimate");
    std::cout << "仿射变换矩阵:" << std::endl << trans << std::endl;

    // 利用 GPU 对图像进行人脸对齐和裁剪，输出尺寸为 112x112
    cv::Size faceSize(112, 112);
    cv::cuda::GpuMat gpuAlignedFace = alignmentAndCropFace(gpuImage, faceSize, kpts, kptsRef, "estimate");

    // 将对齐后的结果从 GPU 下载到 CPU 端以便显示
    cv::Mat alignedFace;
    gpuAlignedFace.download(alignedFace);

    // cv::imshow("Aligned Face", alignedFace);
    // cv::waitKey(0);
    cv::imwrite("/home/jetson/workspace/faceID_jzb/data/crop/crop_zzk_align.png", alignedFace);
    return 0;
}
