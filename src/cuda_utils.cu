#include "cuda_utils.h"
// CUDA 核函数：计算 L2 距离
__global__ void computeL2Distance(const cv::cuda::PtrStepSz<float> A, 
                                   const cv::cuda::PtrStepSz<float> B, 
                                   cv::cuda::PtrStepSz<float> D, int m, int n, int d) {
    int rowA = blockIdx.x * blockDim.x + threadIdx.x; // A 的行索引
    int rowB = blockIdx.y * blockDim.y + threadIdx.y; // B 的行索引

    if (rowA < m && rowB < n) {
        float sum = 0.0f;
        for (int i = 0; i < d; ++i) {
            float diff = A(rowA, i) - B(rowB, i); // 计算每一维的差值
            sum += diff * diff;
        }
        D(rowA, rowB) = sqrtf(sum); // 存储 L2 距离到 D 矩阵
    }
}


// **确保 GpuMat 具有连续内存**
void ensureContinuous(cv::cuda::GpuMat& mat) {
    if (!mat.isContinuous()) {
        cv::cuda::GpuMat temp;
        mat.copyTo(temp);  // 复制到新的 GpuMat，确保连续
        mat = temp;
    }
}

// 调用 CUDA 核函数
void computeL2DistanceCUDA(const cv::cuda::GpuMat& A,const cv::cuda::GpuMat& B, cv::cuda::GpuMat& D) {
    int m = A.rows;
    int n = B.rows;
    int d = A.cols;

    D.create(m, n, CV_32F); // 确保结果矩阵已创建

    // 线程块大小 (16, 16)
    dim3 blockSize(16, 16);
    dim3 gridSize((m + blockSize.x - 1) / blockSize.x, (n + blockSize.y - 1) / blockSize.y);

    // 调用 CUDA 核函数
    computeL2Distance<<<gridSize, blockSize>>>(
        A, 
        B, 
        D, 
        m, n, d
    );

    cudaDeviceSynchronize();
}

int main() {
    int m = 2, n = 2, d = 2;
    cv::Mat h_A = (cv::Mat_<float>(m, d) << 1, 1, 2, 2);
    cv::Mat h_B = (cv::Mat_<float>(n, d) << 1, 1, 2, 2);
    std::cout << "h_A:\n" << h_A << std::endl;
    std::cout << "h_B:\n" << h_B << std::endl;

    cv::cuda::GpuMat d_A, d_B, d_D;
    d_A.upload(h_A);
    d_B.upload(h_B);

    computeL2DistanceCUDA(d_A, d_B, d_D);

    cv::Mat h_D;
    d_D.download(h_D);

    std::cout << "L2 Distance Matrix:\n" << h_D << std::endl;
    return 0;
}
