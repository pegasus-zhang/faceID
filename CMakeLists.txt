cmake_minimum_required(VERSION 3.10)
project(yolo)

option(GTEST_OPTION "build gtest samples" OFF)

option(CUDA_USE_STATIC_CUDA_RUNTIME OFF)
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_BUILD_TYPE Debug)
SET(LIBRARY_OUTPUT_PATH ${CMAKE_CURRENT_SOURCE_DIR}/lib)
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/workspace)

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
target_link_libraries(yolov8_cuda ${TRT_LIBS} ${OpenCV_LIBS} )
SET_TARGET_PROPERTIES (yolov8_cuda PROPERTIES VERSION "${_app_version_}")

cuda_add_library(face_feature SHARED ${PROJECT_SOURCE_DIR}/src/face_feature.cu)
target_link_libraries(face_feature ${TRT_LIBS} ${OpenCV_LIBS} )
SET_TARGET_PROPERTIES (face_feature PROPERTIES VERSION "${_app_version_}")

add_library(face_alignment SHARED ${PROJECT_SOURCE_DIR}/src/face_alignment.cpp)
target_link_libraries(face_alignment ${OpenCV_LIBS} )
SET_TARGET_PROPERTIES (face_alignment PROPERTIES VERSION "${_app_version_}")

cuda_add_library(cuda_utils SHARED ${PROJECT_SOURCE_DIR}/src/cuda_utils.cu)
target_link_libraries(cuda_utils ${TRT_LIBS} ${OpenCV_LIBS} glog)
SET_TARGET_PROPERTIES (cuda_utils PROPERTIES VERSION "${_app_version_}")

add_library(face_matcher SHARED ${PROJECT_SOURCE_DIR}/src/face_matcher.cpp)
target_link_libraries(face_matcher ${OpenCV_LIBS} cuda_utils)
SET_TARGET_PROPERTIES (face_matcher PROPERTIES VERSION "${_app_version_}")

add_library(face_register SHARED ${PROJECT_SOURCE_DIR}/src/face_register.cpp)
target_link_libraries(face_register ${OpenCV_LIBS} face_matcher)
SET_TARGET_PROPERTIES (face_register PROPERTIES VERSION "${_app_version_}")

add_executable(face_matcher_test  src/face_matcher_test.cpp)
target_link_libraries(face_matcher_test  face_matcher 
                                glog
                                ) 

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
                                )

add_executable(face_feature_test src/face_feature_test.cpp)
target_link_libraries(face_feature_test  face_feature
                                glog
                                )       
                                

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
