import sys
import os
import argparse
import cv2
import numpy as np
# from ultralytics import YOLO
import time
import json

# 计算透视变换参数矩阵
def cal_perspective_params(img, calibrate_points_img,calibrate_points_camera,resolution = 0.005):
    # 设置偏移点。如果设置为(0,0),表示透视结果只显示变换的部分（也就是画框的部分）
    # offset_x = 300
    # offset_y = 300
    src = np.float32(calibrate_points_img)
    # 选取四个点，分别是左上、右上、左下、右下
    height = (calibrate_points_camera[0][2] - calibrate_points_camera[2][2])/resolution
    width = (calibrate_points_camera[3][0] - calibrate_points_camera[2][0])/resolution
    offset_x = width
    offset_y = height

    # 透视变换的四个点
    dst = np.float32([[offset_x, offset_y], [width + offset_x, offset_y],
                      [offset_x, height + offset_y], [width + offset_x, height + offset_y]])
    # 透视矩阵
    M = cv2.getPerspectiveTransform(src, dst)
    # print(M)
    # 透视逆矩阵
    M_inverse = cv2.getPerspectiveTransform(dst, src)
    # print(M_inverse)
    return M, M_inverse,(int(width+2*offset_x),int(height+offset_y))

# 透视变换
def img_perspect_transform(img, M, target_size):
    return cv2.warpPerspective(img, M, target_size)

def draw_line(img,calibrate_points_img):
    # 画线
    img_out = np.copy(img)
    img_out = cv2.line(img_out, calibrate_points_img[0], calibrate_points_img[1], (0, 0, 255), 2)
    img_out = cv2.line(img_out, calibrate_points_img[1], calibrate_points_img[3], (0, 0, 255), 2)
    img_out = cv2.line(img_out, calibrate_points_img[3], calibrate_points_img[2], (0, 0, 255), 2)
    img_out = cv2.line(img_out, calibrate_points_img[2], calibrate_points_img[0], (0, 0, 255), 2)
    return img_out

class ImageUndistort:
    def __init__(self,K,D,width,height):
        self.h, self.w = height,width
        self.K = K
        self.D = D

        # 计算去畸变和校正的映射矩阵
        self.new_K = cv2.fisheye.estimateNewCameraMatrixForUndistortRectify(self.K, self.D, (self.w, self.h), None)
        self.map1, self.map2 = cv2.fisheye.initUndistortRectifyMap(self.K, self.D, np.eye(3), self.new_K, (self.w, self.h), cv2.CV_16SC2)

    def undistort_fisheye_image(self,img):
        # # 校正图像
        undistorted_img = cv2.remap(img, self.map1, self.map2, interpolation=cv2.INTER_LINEAR)
        # cut_img,R = cut(img)
        # undistorted_img = undistort(cut_img,R)[360:1520,360:1520]
        return np.array(undistorted_img,dtype=np.uint8) 
    
    def undistort_points(self,points):
        return cv2.fisheye.undistortPoints(points, self.K, self.D, P=self.new_K)

class IPM:
    def __init__(self,points_transformed,calibrate_points_camera,perspective_matrix,K,D,width,height):
        self.points_transformed = points_transformed
        self.calibrate_points_camera = calibrate_points_camera
        self.perspective_matrix = perspective_matrix
        self.undistort_image = ImageUndistort(K,D,width,height)

    def get_target_points_camera(self,reference_point_img,reference_point_camera,target_point_img):
        # 获取相机坐标
        dx = (target_point_img[0][0] - reference_point_img[0][0])/(reference_point_img[3][0] - reference_point_img[0][0])
        dy = (target_point_img[0][1] - reference_point_img[0][1])/(reference_point_img[3][1] - reference_point_img[0][1])
        f_xy1 = reference_point_camera[0]*(1-dx) + reference_point_camera[1]*dx
        f_xy2 = reference_point_camera[2]*(1-dx) + reference_point_camera[3]*dx
        target_point_camera = f_xy1*(1-dy) + f_xy2*dy
        return target_point_camera
    
    def get_3d_pos(self,target_point_img):
        if target_point_img is None:
            return None
        target_point_img = target_point_img.reshape(-1, 1, 2)
        target_point_img_undistorted = self.undistort_image.undistort_points(target_point_img)
        target_point_img_undistorted_transformed = cv2.perspectiveTransform(target_point_img_undistorted, self.perspective_matrix).reshape(-1, 2).astype(int)
        target_point = self.get_target_points_camera(self.points_transformed,self.calibrate_points_camera,target_point_img_undistorted_transformed)
        return target_point

# 鼠标回调函数
def click_event(event, x, y, flags, param):
    points, img,window_name = param
    # 左键点击，添加点到列表
    if event == cv2.EVENT_LBUTTONDOWN:
        points.append((x, y))
    # 右键点击，移除上一个点
    elif event == cv2.EVENT_RBUTTONDOWN and points and len(points) > 1:
        points.pop()

    img_copy = img.copy()
    for point in points:
        cv2.circle(img_copy, point, 5, (0, 255, 0), -1)
    cv2.imshow(window_name, img_copy)

# def get_four_points(points):
#     # Take the first four points
#     points = points[:4]
    
#     # Convert to numpy array
#     points = np.array(points)
    
#     # Sort the points based on y-coordinate, then x-coordinate
#     sorted_points = sorted(points, key=lambda p: (p[1], p[0]))
    
#     # Assuming the points are in the order of top-left, top-right, bottom-left, bottom-right
#     top_left = sorted_points[0]
#     top_right = sorted_points[1]
#     bottom_left = sorted_points[2]
#     bottom_right = sorted_points[3]
    
#     # Combine the points into a single numpy array
#     result = np.array([top_left, top_right, bottom_left, bottom_right])
    
#     return result

def get_four_points(points):
    """
    按照左上角、右上角、左下角、右下角的顺序排序点。
    
    参数：
        points: 点列表，每个点为 (x, y) 元组。如果点数大于4个，则仅取前4个点。
    
    返回：
        按照 (左上角, 右上角, 左下角, 右下角) 顺序排列的点列表。
    """
    # 如果输入点数大于4个，则取前4个
    if len(points) > 4:
        points = points[:4]
    
    if len(points) != 4:
        raise ValueError("必须提供4个点！")
    
    # 先按照 y 坐标排序，y 值越小的点越靠上
    sorted_by_y = sorted(points, key=lambda p: (p[1], p[0]))
    
    # 顶部两个点（y 值较小的）和底部两个点（y 值较大的）
    top_points = sorted_by_y[:2]
    bottom_points = sorted_by_y[2:]
    
    # 对顶部两个点按照 x 坐标排序，x 值较小的是左侧
    top_left, top_right = sorted(top_points, key=lambda p: p[0])
    # 对底部两个点按照 x 坐标排序
    bottom_left, bottom_right = sorted(bottom_points, key=lambda p: p[0])
    
    return [top_left, top_right, bottom_left, bottom_right]

if __name__ == '__main__':
    parser = argparse.ArgumentParser() 
    parser.add_argument('--img', type=str, default= '../data/calibration/calibration.png',
                        help='image path')
    parser.add_argument('--calibration', action='store_true',
                        help='open calibration mode')
    parser.add_argument('--save', action='store_true',
                        help='save calibration result')
    parser.add_argument('--config', type=str, default= "../config/default.json",
                        help='config file path')
    parser.add_argument('--camera_id', type=int, default= 0,
                    help='calibration camera id,front camera is 0,back camera is 1')
    opt = parser.parse_args()
    
    # 观察图像像素大小，便于手动选点
    img = cv2.imread(opt.img)
    # cv2.namedWindow('img',cv2.WINDOW_NORMAL)
    # cv2.imshow('img',img)
    with open(opt.config, 'r') as json_file:
        config = json.load(json_file)
        K = np.array(config["camera_parameter"][opt.camera_id]['camera_intrinsics'])
        D = np.array(config["camera_parameter"][opt.camera_id]['camera_distortion'])
        width = config["camera_parameter"][opt.camera_id]['image_size'][0]
        height = config["camera_parameter"][opt.camera_id]['image_size'][1]
        
        undistort_image = ImageUndistort(K,D,width,height)
        img_undistort = undistort_image.undistort_fisheye_image(img)
        if opt.calibration:
            # 选取四个点，分别是左上、右上、左下、右下
            calibrate_points_img = []
            cv2.namedWindow('img_undistort',cv2.WINDOW_NORMAL)
            cv2.imshow('img_undistort',img_undistort)
            # 绑定鼠标回调函数
            cv2.setMouseCallback('img_undistort', click_event, (calibrate_points_img, img_undistort,"img_undistort"))
            print("Click the four points on the image, then press 'q' to confirm.")
            print("Right click to remove the last point.")
            print("Left click to add a new point.")
            # 等待用户操作
            while True:
                key = cv2.waitKey(40) & 0xFF
                if key == ord('q'):  # 按下 'q' 键退出
                    break
            calibrate_points_img = get_four_points(calibrate_points_img)
            calibrate_points_camera = np.array(config["camera_parameter"][opt.camera_id]["3d_calibration_parameter"]["CALIBRATE_POINTS_CAMERA"])
            resolution = 0.005
            test01_img = draw_line(img_undistort, calibrate_points_img)
            cv2.namedWindow('test01',cv2.WINDOW_NORMAL)
            cv2.imshow('test01',test01_img)
            # cv2.imwrite('test01.png',img)
            M, M_inverse,target_size = cal_perspective_params(img_undistort, calibrate_points_img,calibrate_points_camera,resolution)
            trasform_img = img_perspect_transform(img_undistort, M,target_size)
            points_to_transform = np.float32(calibrate_points_img).reshape(-1, 1, 2)
            points_transformed = cv2.perspectiveTransform(points_to_transform, M).reshape(-1, 2).astype(int)
            print("calibration results: ")
            print("CALIBRATE_POINTS_IMG: ",calibrate_points_img)
            print("CALIBRATE_POINTS_PIXEL: ",points_transformed)
            print("CALIBRATE_POINTS_CAMERA: ",calibrate_points_camera)
            print("PERPECTIVE_MATRIX: ",M)
            print("TARGET_SIZE: ",target_size)
            # # 创建一个字典来存储变量
            config["camera_parameter"][opt.camera_id]["3d_calibration_parameter"]["CALIBRATE_POINTS_PIXEL"] = points_transformed.tolist()
            config["camera_parameter"][opt.camera_id]["3d_calibration_parameter"]["CALIBRATE_POINTS_CAMERA"] = calibrate_points_camera.tolist()
            config["camera_parameter"][opt.camera_id]["3d_calibration_parameter"]["PERPECTIVE_MATRIX"] = M.tolist()
            config["camera_parameter"][opt.camera_id]["3d_calibration_parameter"]["TARGET_SIZE"] = target_size

            # 将字典保存到 JSON 文件中
            if opt.save:
                with open(opt.config, 'w') as json_file:
                    json.dump(config, json_file, indent=4)
                print(f"Variables saved to {opt.config}")

            test02_img = draw_line(trasform_img, points_transformed)
            cv2.namedWindow('test02',cv2.WINDOW_NORMAL)
            cv2.imshow('test02',test02_img)
            cv2.waitKey(0)
            # cv2.imwrite('test02.png',trasform_img)
        else:
            cv2.namedWindow('img',cv2.WINDOW_NORMAL)
            cv2.imshow('img',img)
            # cv2.waitKey(0)
            print("start test")
            # 获取 JSON 数组
            CALIBRATE_POINTS_PIXEL = np.array(config["camera_parameter"][opt.camera_id]["3d_calibration_parameter"]["CALIBRATE_POINTS_PIXEL"])
            CALIBRATE_POINTS_CAMERA = np.array(config["camera_parameter"][opt.camera_id]["3d_calibration_parameter"]["CALIBRATE_POINTS_CAMERA"])
            PERPECTIVE_MATRIX = np.array(config["camera_parameter"][opt.camera_id]["3d_calibration_parameter"]["PERPECTIVE_MATRIX"])
            TARGET_SIZE = np.array(config["camera_parameter"][opt.camera_id]["3d_calibration_parameter"]["TARGET_SIZE"])
            K = np.array(config["camera_parameter"][opt.camera_id]['camera_intrinsics'])
            D = np.array(config["camera_parameter"][opt.camera_id]['camera_distortion'])
            width = config["camera_parameter"][opt.camera_id]['image_size'][0]
            height = config["camera_parameter"][opt.camera_id]['image_size'][1]
            target_point_img = []
            # 绑定鼠标回调函数
            cv2.setMouseCallback('img', click_event, (target_point_img, img,"img"))
            print("Click the points on the image, then press 'q' to confirm.")
            print("Right click to remove the last point.")
            print("Left click to add a new point.")
            # 等待用户操作
            while True:
                key = cv2.waitKey(40) & 0xFF
                if key == ord('q'):  # 按下 'q' 键退出
                    break
            
            ipm = IPM(CALIBRATE_POINTS_PIXEL,CALIBRATE_POINTS_CAMERA,PERPECTIVE_MATRIX,K,D,width,height)
            if len(target_point_img)>0:
                start_time = time.time()
                print("target_point_img: ",target_point_img)
                target_point_img = np.array(target_point_img, dtype=np.float64).reshape(-1, 1, 2)
                target_point = ipm.get_3d_pos(target_point_img)
                print(f"\033[31mused time(s): {time.time()-start_time} \033[0m")
                print(f"\033[31mtarget_point_img: {target_point_img} \033[0m")
                print(f"\033[31mtarget_point:{target_point} \033[0m")
                cv2.namedWindow('img_undistort',cv2.WINDOW_NORMAL)
                cv2.imshow("img_undistort",img_undistort)
                print("PERPECTIVE_MATRIX: ",PERPECTIVE_MATRIX)
                print("TARGET_SIZE: ",TARGET_SIZE)
                trasform_img = img_perspect_transform(img_undistort,PERPECTIVE_MATRIX,TARGET_SIZE)
                cv2.namedWindow('trasform_img',cv2.WINDOW_NORMAL)
                cv2.imshow('trasform_img',trasform_img)
                cv2.waitKey(0)
            else:
                print("no point was selected")