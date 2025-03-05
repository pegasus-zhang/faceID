# FaceID识别
创建人: 江子奔   
## 软件环境
* Jetson5.1.2
* Ros1-noetic
* tensorrt==8.5.2
* Opencv+cuda==4.5.5

## 硬件环境：
Orin NX, 森云鱼眼相机

## 更新日志
* [2025.02.08]  添加face id 识别python代码，模型以及环境。
* [2025.02.28] 添加face id 识别C++代码，模型以及环境。

## 运行方法 
* 编译主程序  
    ```
    bash ./build.sh
    ```
* 编译ros接口,并启用  
    ```
    cd ros1_interface && catkin_make
    source ros1_interface/devel/setup.bash
    ```
* 运行程序  
``` ./run.sh```

## 人脸检测，人体检测测试
* 单帧图像测试
    ```
    ./workspace/face_detect_test -p ./data/face_detection -m ./weights/det_10g.engine --fp16 --show --pause
    ```
* ros测试
    ```
    ./workspace/face_detect_test -p ./data/face_detection -m ./weights/det_10g.engine --fp16 --show --ros
    ```