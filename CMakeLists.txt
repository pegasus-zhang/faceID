cmake_minimum_required(VERSION 3.10)
project(yolo)

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


# Detect ROS Version  
# if(DEFINED ENV{ROS_VERSION})  
#     if($ENV{ROS_VERSION} EQUAL 1)  
#         message(STATUS "Building for ROS1")  
#         find_package(catkin REQUIRED COMPONENTS  
#             roscpp  
#             std_msgs  
#         )  
#         catkin_package(  
#             INCLUDE_DIRS include  
#             LIBRARIES ${PROJECT_NAME}  
#             CATKIN_DEPENDS roscpp std_msgs  
#         )  
#         include_directories(${catkin_INCLUDE_DIRS})  
#         add_definitions(-DUSING_ROS1)  
#     elseif($ENV{ROS_VERSION} EQUAL 2)  
#         message(STATUS "Building for ROS2")  
#         find_package(ament_cmake REQUIRED)  
#         find_package(rclcpp REQUIRED)  
#         find_package(std_msgs REQUIRED)  
#         include_directories(${rclcpp_INCLUDE_DIRS} ${std_msgs_INCLUDE_DIRS})  
#         add_definitions(-DUSING_ROS2)  
#     else()  
#         message(FATAL_ERROR "Unsupported ROS version: $ENV{ROS_VERSION}")  
#     endif()  
# else()  
#     message(STATUS "No ROS environment detected. Building without ROS support.")  
# endif()  


# 如果启用了 ROS1  
if(ENABLE_ROS1)  
    find_package(catkin REQUIRED COMPONENTS  
        roscpp
        rosconsole  
        sensor_msgs  
    )  
    include_directories(${catkin_INCLUDE_DIRS})  
    link_directories(${catkin_LIBRARY_DIRS})  
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
    set(TENSORRT_LIB_PATH "/usr/lib")
    file(GLOB TRT_LIBS "${TENSORRT_LIB_PATH}/*.so")
    set(TENSOR_INCLUDE_DIRS "/usr/include")
    include_directories(${TENSOR_INCLUDE_DIRS})
    link_directories(${TENSORRT_LIB_PATH})
endif()
# TensorRT


# set(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} -std=c++11 -Wall -O0 -Wfatal-errors -pthread -w -g")
# set(CUDA_NVCC_FLAGS "${CUDA_NVCC_FLAGS} -std=c++11 -O0 -Xcompiler -fPIC -g -w ${CUDA_GEN_CODE}")

cuda_add_library(yolov8 SHARED ${PROJECT_SOURCE_DIR}/src/simple_yolo.cu)
target_link_libraries(yolov8 ${TRT_LIBS} ${OpenCV_LIBS} )
SET_TARGET_PROPERTIES (yolov8 PROPERTIES VERSION "${_app_version_}")


cuda_add_library(yolov8_cuda SHARED ${PROJECT_SOURCE_DIR}/src/simple_yolo_cuda.cu)
target_link_libraries(yolov8_cuda ${TRT_LIBS} ${OpenCV_LIBS} ${catkin_LIBRARIES})
SET_TARGET_PROPERTIES (yolov8_cuda PROPERTIES VERSION "${_app_version_}")


add_executable(yolo_test src/yolo_test.cpp)
target_link_libraries(yolo_test  yolov8
                                ${OpenCV_LIBS}
                                jsoncpp
                                glog 
                                )

add_executable(yolo_gpu_test src/yolo_gpu_test.cpp)
target_link_libraries(yolo_gpu_test  yolov8_cuda
                                jsoncpp
                                glog
                                pthread
                                )

# # ROS-Specific Targets [ADDED]  
# if(DEFINED ENV{ROS_VERSION})  
# if($ENV{ROS_VERSION} EQUAL 1) # [ADDED]  
#     add_executable(yolo_ros1_node src/yolo_ros1_node.cpp) # [ADDED]  
#     target_link_libraries(yolo_ros1_node ${catkin_LIBRARIES} yolov8) # [ADDED]  
#     add_dependencies(yolo_ros1_node ${catkin_EXPORTED_TARGETS}) # [ADDED]  
# elseif($ENV{ROS_VERSION} EQUAL 2) # [ADDED]  
#     add_executable(yolo_ros2_node src/yolo_ros2_node.cpp) # [ADDED]  
#     target_link_libraries(yolo_ros2_node rclcpp yolov8) # [ADDED]  
#     ament_target_dependencies(yolo_ros2_node rclcpp std_msgs) # [ADDED]  
# endif()  
# endif() 

# gtest
if(GTEST_OPTION)
    message(STATUS "GTEST_OPTION ON.")
    enable_testing()

    find_package(GTest REQUIRED)
    Message(STATUS "--------------------------------------")
    include_directories(${GTEST_INCLUDE_DIRS})
    add_executable(sample1_unittest samples/sample1_unittest.cpp)
    target_link_libraries(sample1_unittest gtest gtest_main pthread yolov8_cuda ${OpenCV_LIBS})

    add_executable(sample2_unittest samples/sample2_unittest.cpp)
    target_link_libraries(sample2_unittest gtest gtest_main pthread yolov8 ${OpenCV_LIBS})
    
    include(GoogleTest)
    gtest_discover_tests(sample1_unittest sample2_unittest)
else()
    message(STATUS "GTEST_OPTION OFF.")
endif()

#安装信息
IF(DEFINED _install_root_path_ AND NOT "${_install_root_path_}" STREQUAL "")
    # 宏定义不为空的处理逻辑
    set(CMAKE_INSTALL_PREFIX ${_install_root_path_})
ELSE()
    # 宏定义为空的处理逻辑yolov8
    set(CMAKE_INSTALL_PREFIX "/opt/opt_control/")
ENDIF()
if(GTEST_OPTION)
    install(TARGETS sample1_unittest sample2_unittest DESTINATION bin/yolov8)
endif()
install(TARGETS yolov8_cuda yolov8 DESTINATION lib/yolov8)
install(FILES include/simple_yolo_cuda.h include/simple_yolo.h DESTINATION include/yolov8)

#cmake install
install(FILES
        cmake/yolov8Config.cmake
        cmake/yolov8ConfigVersion.cmake
        DESTINATION lib/cmake/yolov8)

# Create an uninstall target (optional)
add_custom_target(uninstall
    COMMAND ${CMAKE_COMMAND} -E remove_directory "${CMAKE_INSTALL_PREFIX}/lib/yolov8"
    COMMAND ${CMAKE_COMMAND} -E remove_directory "${CMAKE_INSTALL_PREFIX}/include/yolov8"
    COMMAND ${CMAKE_COMMAND} -E remove_directory "${CMAKE_INSTALL_PREFIX}/bin/yolov8"
    COMMAND ${CMAKE_COMMAND} -E remove_directory "${CMAKE_INSTALL_PREFIX}/lib/cmake/yolov8"
    COMMENT "Uninstalling YoloV8"
)

# ROS2 Install [ADDED]  
if(DEFINED ENV{ROS_VERSION} AND $ENV{ROS_VERSION} EQUAL 2) # [ADDED]  
    ament_package() # [ADDED]  
endif()  

