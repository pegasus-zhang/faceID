cmake_minimum_required(VERSION 3.10)
project(faceID)

option(GTEST_OPTION "build gtest samples" OFF)

option(CUDA_USE_STATIC_CUDA_RUNTIME OFF)
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_BUILD_TYPE Debug)
SET(LIBRARY_OUTPUT_PATH ${CMAKE_CURRENT_SOURCE_DIR}/lib)
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/workspace)


# 添加选项以启用 ROS1 或 ROS2  
option(ENABLE_ROS1 "Enable ROS1 support" ON)  
option(ENABLE_ROS2 "Enable ROS2 support" OFF)  

# 检查是否同时启用了 ROS1 和 ROS2  
if(ENABLE_ROS1 AND ENABLE_ROS2)  
    message(FATAL_ERROR "Cannot enable both ROS1 and ROS2 at the same time.")  
endif()  

# 根据选项定义编译宏  
if(ENABLE_ROS1)  
    add_definitions(-DROS_ENABLE)  
    message(STATUS "ROS1 support enabled.")  
endif()  

if(ENABLE_ROS2)  
    add_definitions(-DROS2_ENABLE)  
    message(STATUS "ROS2 support enabled.")  
endif() 

#版本信息
add_definitions(-D__app_version__=\"${_app_version_}\")
add_definitions(-D__git_version__=\"${_git_version_}\")
add_definitions(-D__git_log__=\"${_git_log_}\")
message(STATUS "${_app_version_}")

# #set libs
#set(MXT_CONTROL_SDK_LIB_SYSTEM_PATH /opt/opt_control)

# link_directories(${MXT_CONTROL_SDK_LIB_PATH} ${MXT_CONTROL_SDK_LIB_SYSTEM_PATH})
include_directories(include)
link_directories(lib)

# 如果启用了 ROS1  
if(ENABLE_ROS1)  
    find_package(catkin REQUIRED COMPONENTS  
        roscpp
        rosconsole  
        sensor_msgs
        cv_bridge
        image_transport  
    )  
    include_directories(${catkin_INCLUDE_DIRS})  
    link_directories(${catkin_LIBRARY_DIRS}) 
    find_package(perception_msgs REQUIRED
    )
    include_directories(${perception_msgs_INCLUDE_DIRS})
    find_package(eye_msgs REQUIRED)
    include_directories(${eye_msgs_INCLUDE_DIRS})
    find_package(ros_interface REQUIRED)
    include_directories(${ros_interface_INCLUDE_DIRS})
endif()  

# 如果启用了 ROS2  
if(ENABLE_ROS2)  
    find_package(rclcpp REQUIRED)  
    find_package(sensor_msgs REQUIRED)
    find_package(ament_cmake REQUIRED)    
    include_directories(${rclcpp_INCLUDE_DIRS} ${sensor_msgs_INCLUDE_DIRS})  
    link_directories(${rclcpp_LIBRARY_DIRS} ${sensor_msgs_LIBRARY_DIRS})  
endif()  
# #jsoncpp
# set(jsoncpp_DIR ${MXT_CONTROL_SDK_LIB_SYSTEM_PATH}/jsoncpp/lib/cmake/jsoncpp)
# find_package(jsoncpp 1.9.5 REQUIRED)
# #jsoncpp

#opencv
option(With_OpenCV "Use OpenCV" ON)
if(With_OpenCV)
    message(STATUS "USE OpenCV")
    set(CUDA_TOOLKIT_ROOT_DIR /usr/local/cuda-11.4)
    set(OPENCV_DIR /usr/local/lib/cmake/opencv4/)
    set(CMAKE_PREFIX_PATH ${OPENCV_DIR})
    find_package(OpenCV 4 REQUIRED)
    if(OpenCV_FOUND)
        message(STATUS "Found Opencv version: ${OpenCV_VERSION}")
        include_directories(${OpenCV_INCLUDE_DIRS})
        # message(STATUS ${OpenCV_LIBS})
    else() 	 
        message(FATAL_ERROR "OpenCV library NOT found or version NOT correct!!!")
    endif()
endif()
#opencv

#CUDA
option(With_CUDA "Use CUDA" ON)
if(With_CUDA)
    message(STATUS "USE CUDA")
    set(CUDA_TOOLKIT_ROOT_DIR /usr/local/cuda-11.4)
    find_package(CUDA REQUIRED)
    if(CUDA_FOUND)
        include_directories(${CUDA_INCLUDE_DIRS})
        option(CUDA_USE_STATIC_CUDA_RUNTIME OFF)
        set(CUDA_GEN_CODE "-gencode=arch=compute_87,code=sm_87")
    else()
        message(FATAL_ERROR "CUDA library NOT found")
    endif()
endif()
#CUDA

# TensorRT
option(With_TRT "Use TensorRT" ON)
if(With_TRT)
    set(TensorRT_version 8.5.2)
    message(STATUS "USE TensorRT-${TensorRT_version}")
    set(TENSORRT_LIB_PATH "/usr/lib/aarch64-linux-gnu")
    # file(GLOB TRT_LIBS "${TENSORRT_LIB_PATH}/*.so")
    set(TRT_LIBS nvinfer nvonnxparser)
    set(TENSOR_INCLUDE_DIRS "/usr/include/aarch64-linux-gnu")
    include_directories(${TENSOR_INCLUDE_DIRS})
    link_directories(${TENSORRT_LIB_PATH})
    message(STATUS "${TensorRT_LDFLAGS}")
endif()
# TensorRT


set(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} -std=c++11 -Wall -O0 -Wfatal-errors -pthread -w -g")
set(CUDA_NVCC_FLAGS "${CUDA_NVCC_FLAGS} -std=c++11 -O0 -Xcompiler -fPIC -g -w ${CUDA_GEN_CODE}")

cuda_add_library(scrfd SHARED ${PROJECT_SOURCE_DIR}/src/scrfd.cu)
target_link_libraries(scrfd ${TRT_LIBS} ${OpenCV_LIBS} )
SET_TARGET_PROPERTIES (scrfd PROPERTIES VERSION "${_app_version_}")

cuda_add_library(scrfd_cuda SHARED ${PROJECT_SOURCE_DIR}/src/scrfd_cuda.cu)
target_link_libraries(scrfd_cuda ${TRT_LIBS} ${OpenCV_LIBS})
SET_TARGET_PROPERTIES (scrfd_cuda PROPERTIES VERSION "${_app_version_}")

cuda_add_library(face_feature SHARED ${PROJECT_SOURCE_DIR}/src/face_feature.cu)
target_link_libraries(face_feature ${TRT_LIBS} ${OpenCV_LIBS} )
SET_TARGET_PROPERTIES (face_feature PROPERTIES VERSION "${_app_version_}")

cuda_add_library(cuda_utils SHARED ${PROJECT_SOURCE_DIR}/src/cuda_utils.cu)
target_link_libraries(cuda_utils ${TRT_LIBS} ${OpenCV_LIBS} glog)
SET_TARGET_PROPERTIES (cuda_utils PROPERTIES VERSION "${_app_version_}")

cuda_add_library(simple_yolo_cuda SHARED ${PROJECT_SOURCE_DIR}/src/simple_yolo_cuda.cu)
target_link_libraries(simple_yolo_cuda ${TRT_LIBS} ${OpenCV_LIBS} ${catkin_LIBRARIES})
SET_TARGET_PROPERTIES (simple_yolo_cuda PROPERTIES VERSION "${_app_version_}")

# add_library(face_alignment SHARED ${PROJECT_SOURCE_DIR}/src/face_alignment.cpp)
# target_link_libraries(face_alignment ${OpenCV_LIBS} )
# SET_TARGET_PROPERTIES (face_alignment PROPERTIES VERSION "${_app_version_}")

# add_library(face_matcher SHARED ${PROJECT_SOURCE_DIR}/src/face_matcher.cpp)
# target_link_libraries(face_matcher ${OpenCV_LIBS} cuda_utils)
# SET_TARGET_PROPERTIES (face_matcher PROPERTIES VERSION "${_app_version_}")

# add_library(face_register SHARED ${PROJECT_SOURCE_DIR}/src/face_register.cpp)
# target_link_libraries(face_register ${OpenCV_LIBS} face_matcher)
# SET_TARGET_PROPERTIES (face_register PROPERTIES VERSION "${_app_version_}")

add_library(face_recognizer SHARED ${PROJECT_SOURCE_DIR}/src/face_recognizer.cpp
                                    ${PROJECT_SOURCE_DIR}/src/face_alignment.cpp
                                    ${PROJECT_SOURCE_DIR}/src/face_matcher.cpp
                                    ${PROJECT_SOURCE_DIR}/src/face_register.cpp
)
target_link_libraries(face_recognizer               cuda_utils
                                                    scrfd_cuda
                                                    face_feature
                                                    ${OpenCV_LIBS}
                                                    )
SET_TARGET_PROPERTIES (face_recognizer PROPERTIES VERSION "${_app_version_}")

add_library(mythread SHARED ${PROJECT_SOURCE_DIR}/src/my_thread.cpp)
target_link_libraries(mythread pthread)
SET_TARGET_PROPERTIES (mythread PROPERTIES VERSION "${_app_version_}")

add_library(ros_adapter SHARED ${PROJECT_SOURCE_DIR}/src/ros_adapter.cpp)
target_link_libraries(ros_adapter pthread ${OpenCV_LIBS} ${catkin_LIBRARIES})
SET_TARGET_PROPERTIES (ros_adapter PROPERTIES VERSION "${_app_version_}")

add_library(ipm SHARED ${PROJECT_SOURCE_DIR}/src/ipm.cpp)
target_link_libraries(ipm   ${OpenCV_LIBS}           
                                )                      
SET_TARGET_PROPERTIES (ipm PROPERTIES VERSION "${_app_version_}")

add_library(face_id_thread SHARED ${PROJECT_SOURCE_DIR}/src/face_id_thread.cpp
                                    )
target_link_libraries(face_id_thread   face_recognizer
                                            simple_yolo_cuda
                                            ipm
                                            ros_adapter
                                            mythread 
                                            ${catkin_LIBRARIES}
                                            pthread
                                            glog 
                                                                       
                                ) 
SET_TARGET_PROPERTIES (face_id_thread PROPERTIES VERSION "${_app_version_}")

# add_library(cmd_listener SHARED ${PROJECT_SOURCE_DIR}/src/cmd_listener.cpp 
#                                 ${PROJECT_SOURCE_DIR}/src/myPinyin.cpp)
# target_link_libraries(cmd_listener  face_id_thread
#                                     glog
#                                     ${catkin_LIBRARIES}                                        
#                                 )                                 
# SET_TARGET_PROPERTIES (cmd_listener PROPERTIES VERSION "${_app_version_}")

add_executable(face_id_app ${PROJECT_SOURCE_DIR}/src/main.cpp
                            ${PROJECT_SOURCE_DIR}/src/cmd_listener.cpp
                            ${PROJECT_SOURCE_DIR}/src/myPinyin.cpp)
target_link_libraries(face_id_app face_id_thread
                                    glog  
                                    ${catkin_LIBRARIES}   
)


# add_executable(face_id_thread_test src/face_id_thread.cpp)
# target_link_libraries(face_id_thread_test   face_id_thread      
#                                 )                                 


# add_executable(face_matcher_test  src/face_matcher_test.cpp)
# target_link_libraries(face_matcher_test  face_matcher 
#                                 glog
#                                 ) 

# add_executable(yolo_test src/yolo_test.cpp)
# target_link_libraries(yolo_test  scrfd
#                                 ${OpenCV_LIBS}
#                                 jsoncpp
#                                 glog 
#                                 )


# ---------------for detection test---------------------#
add_executable(faceID ${PROJECT_SOURCE_DIR}/src/faceID.cpp)
target_link_libraries(faceID  scrfd_cuda
                                jsoncpp
                                glog
                                pthread
                                ros_adapter
                                simple_yolo_cuda
                                )
# ---------------for detection test---------------------#

# add_executable(face_feature_test src/face_feature_test.cpp)
# target_link_libraries(face_feature_test  face_feature
#                                 glog
#                                 )       
# add_executable(face_recognizer_test src/face_recognizer_test.cpp)
# target_link_libraries(face_recognizer_test   face_recognizer 
#                                             glog
#                                 )     
# add_executable(mythread_test src/my_thread.cpp)
# target_link_libraries(mythread_test   pthread
#                                 )                                 
# add_executable(ipm_test src/ipm.cpp)
# target_link_libraries(ipm_test   ${OpenCV_LIBS}           
#                                 )                                 
                                                                
# # ROS-Specific Targets [ADDED]  
# if(DEFINED ENV{ROS_VERSION})  
# if($ENV{ROS_VERSION} EQUAL 1) # [ADDED]  
#     add_executable(yolo_ros1_node src/yolo_ros1_node.cpp) # [ADDED]  
#     target_link_libraries(yolo_ros1_node ${catkin_LIBRARIES} scrfd) # [ADDED]  
#     add_dependencies(yolo_ros1_node ${catkin_EXPORTED_TARGETS}) # [ADDED]  
# elseif($ENV{ROS_VERSION} EQUAL 2) # [ADDED]  
#     add_executable(yolo_ros2_node src/yolo_ros2_node.cpp) # [ADDED]  
#     target_link_libraries(yolo_ros2_node rclcpp scrfd) # [ADDED]  
#     ament_target_dependencies(yolo_ros2_node rclcpp std_msgs) # [ADDED]  
# endif()  
# endif() 

# ROS2 Install [ADDED]  
if(DEFINED ENV{ROS_VERSION} AND $ENV{ROS_VERSION} EQUAL 2) # [ADDED]  
    ament_package() # [ADDED]  
endif()  

