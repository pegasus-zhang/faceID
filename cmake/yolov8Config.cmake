# get_filename_component(Scrfdv5_CONFIG_PATH "${CMAKE_CURRENT_LIST_DIR}" REALPATH)
# get_filename_component(Scrfdv5_INSTALL_PATH "${_install_root_path_}" REALPATH)

set(MXT_CONTROL_SDK_LIB_SYSTEM_PATH /opt/opt_control)

#opencv
option(With_OpenCV "Use OpenCV" ON)
if(With_OpenCV)
    message(STATUS "USE OpenCV")
    set(CUDA_TOOLKIT_ROOT_DIR ${MXT_CONTROL_SDK_LIB_SYSTEM_PATH}/cuda)
    set(OPENCV_DIR ${MXT_CONTROL_SDK_LIB_SYSTEM_PATH}/opencv-4.5.0/)
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
    set(CUDA_TOOLKIT_ROOT_DIR /usr/local/cuda)
    find_package(CUDA REQUIRED)
    if(CUDA_FOUND)
        include_directories(${CUDA_INCLUDE_DIRS})
        option(CUDA_USE_STATIC_CUDA_RUNTIME OFF)
        set(CUDA_GEN_CODE "-gencode=arch=compute_75,code=sm_75")
    else()
        message(FATAL_ERROR "CUDA library NOT found")
    endif()
endif()
#CUDA

# TensorRT
option(With_TRT "Use TensorRT" ON)
if(With_TRT)
    set(TensorRT_version 8.4.3.1)
    message(STATUS "USE TensorRT-${TensorRT_version}")
    set(TENSORRT_LIB_PATH ${MXT_CONTROL_SDK_LIB_SYSTEM_PATH}/tensorRT-${TensorRT_version})
    file(GLOB TRT_LIBS "${TENSORRT_LIB_PATH}/lib/*.so")
    include_directories(${TENSORRT_LIB_PATH}/include)
    link_directories(${TENSORRT_LIB_PATH}/lib)
endif()
# TensorRT

set(Scrfdv8_INCLUDE_DIRS ${MXT_CONTROL_SDK_LIB_SYSTEM_PATH}/include/yolov8/)
set(Scrfdv8_LIBS ${MXT_CONTROL_SDK_LIB_SYSTEM_PATH}/lib/yolov8/libyolov8.so ${MXT_CONTROL_SDK_LIB_SYSTEM_PATH}/lib/yolov8/libyolov8_cuda.so  ${TRT_LIBS} ${OpenCV_LIBS} )