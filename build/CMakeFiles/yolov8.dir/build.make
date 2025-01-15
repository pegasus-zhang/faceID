# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.31

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/cmake/bin/cmake

# The command to remove a file.
RM = /opt/cmake/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/jetson/workspace/faceID

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/jetson/workspace/faceID/build

# Include any dependencies generated for this target.
include CMakeFiles/yolov8.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/yolov8.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/yolov8.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/yolov8.dir/flags.make

CMakeFiles/yolov8.dir/src/yolov8_generated_simple_yolo.cu.o: /home/jetson/workspace/faceID/src/simple_yolo.cu
CMakeFiles/yolov8.dir/src/yolov8_generated_simple_yolo.cu.o: CMakeFiles/yolov8.dir/src/yolov8_generated_simple_yolo.cu.o.depend
CMakeFiles/yolov8.dir/src/yolov8_generated_simple_yolo.cu.o: CMakeFiles/yolov8.dir/src/yolov8_generated_simple_yolo.cu.o.Debug.cmake
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/jetson/workspace/faceID/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building NVCC (Device) object CMakeFiles/yolov8.dir/src/yolov8_generated_simple_yolo.cu.o"
	cd /home/jetson/workspace/faceID/build/CMakeFiles/yolov8.dir/src && /opt/cmake/bin/cmake -E make_directory /home/jetson/workspace/faceID/build/CMakeFiles/yolov8.dir/src/.
	cd /home/jetson/workspace/faceID/build/CMakeFiles/yolov8.dir/src && /opt/cmake/bin/cmake -D verbose:BOOL=$(VERBOSE) -D build_configuration:STRING=Debug -D generated_file:STRING=/home/jetson/workspace/faceID/build/CMakeFiles/yolov8.dir/src/./yolov8_generated_simple_yolo.cu.o -D generated_cubin_file:STRING=/home/jetson/workspace/faceID/build/CMakeFiles/yolov8.dir/src/./yolov8_generated_simple_yolo.cu.o.cubin.txt -P /home/jetson/workspace/faceID/build/CMakeFiles/yolov8.dir/src/yolov8_generated_simple_yolo.cu.o.Debug.cmake

CMakeFiles/yolov8.dir/codegen:
.PHONY : CMakeFiles/yolov8.dir/codegen

# Object files for target yolov8
yolov8_OBJECTS =

# External object files for target yolov8
yolov8_EXTERNAL_OBJECTS = \
"/home/jetson/workspace/faceID/build/CMakeFiles/yolov8.dir/src/yolov8_generated_simple_yolo.cu.o"

/home/jetson/workspace/faceID/lib/libyolov8.so.: CMakeFiles/yolov8.dir/src/yolov8_generated_simple_yolo.cu.o
/home/jetson/workspace/faceID/lib/libyolov8.so.: CMakeFiles/yolov8.dir/build.make
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/cuda-11.4/lib64/libcudart.so
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/lib/klibc-TL4FphOsYc4-OZYOMnFTxn9-7xk.so
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/lib/libMonoPosixHelper.so
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/lib/libMonoSupportW.so
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/lib/libOpenNI.jni.so
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/lib/libOpenNI.so
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/lib/libOpenNI2.so
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/lib/libSample-NiSampleModule.so
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/lib/libarmadillo.so
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/lib/libckteec.so
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/lib/libdfalt.so
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/lib/libgdal.so
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/lib/libklibc-TL4FphOsYc4-OZYOMnFTxn9-7xk.so
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/lib/libmfhdfalt.so
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/lib/libmono-btls-shared.so
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/lib/libmono-native.so
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/lib/libnimCodecs.so
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/lib/libnimMockNodes.so
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/lib/libnimRecorder.so
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/lib/libnvcaffe_parser.so
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/lib/libnvinfer.so
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/lib/libnvinfer_plugin.so
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/lib/libnvonnxparser.so
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/lib/libnvparsers.so
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/lib/libogdi.so
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/lib/liborocos-kdl.so
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/lib/libqwt-qt5.so
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/lib/libteec.so
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/lib/libvpf.so
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_gapi.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_stitching.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_alphamat.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_aruco.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_barcode.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_bgsegm.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_bioinspired.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_ccalib.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_cudabgsegm.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_cudafeatures2d.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_cudaobjdetect.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_cudastereo.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_dnn_objdetect.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_dnn_superres.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_dpm.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_face.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_freetype.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_fuzzy.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_hdf.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_hfs.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_img_hash.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_intensity_transform.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_line_descriptor.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_mcc.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_quality.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_rapid.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_reg.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_rgbd.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_saliency.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_sfm.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_stereo.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_structured_light.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_superres.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_surface_matching.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_tracking.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_videostab.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_viz.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_wechat_qrcode.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_xfeatures2d.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_xobjdetect.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_xphoto.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_shape.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_highgui.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_datasets.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_plot.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_text.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_ml.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_phase_unwrapping.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_cudacodec.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_videoio.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_cudaoptflow.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_cudalegacy.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_cudawarping.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_optflow.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_ximgproc.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_video.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_imgcodecs.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_objdetect.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_calib3d.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_dnn.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_features2d.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_flann.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_photo.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_cudaimgproc.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_cudafilters.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_imgproc.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_cudaarithm.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_core.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: /usr/local/lib/libopencv_cudev.so.4.6.0
/home/jetson/workspace/faceID/lib/libyolov8.so.: CMakeFiles/yolov8.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/jetson/workspace/faceID/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library /home/jetson/workspace/faceID/lib/libyolov8.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/yolov8.dir/link.txt --verbose=$(VERBOSE)
	$(CMAKE_COMMAND) -E cmake_symlink_library /home/jetson/workspace/faceID/lib/libyolov8.so. /home/jetson/workspace/faceID/lib/libyolov8.so. /home/jetson/workspace/faceID/lib/libyolov8.so

/home/jetson/workspace/faceID/lib/libyolov8.so: /home/jetson/workspace/faceID/lib/libyolov8.so.
	@$(CMAKE_COMMAND) -E touch_nocreate /home/jetson/workspace/faceID/lib/libyolov8.so

# Rule to build all files generated by this target.
CMakeFiles/yolov8.dir/build: /home/jetson/workspace/faceID/lib/libyolov8.so
.PHONY : CMakeFiles/yolov8.dir/build

CMakeFiles/yolov8.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/yolov8.dir/cmake_clean.cmake
.PHONY : CMakeFiles/yolov8.dir/clean

CMakeFiles/yolov8.dir/depend: CMakeFiles/yolov8.dir/src/yolov8_generated_simple_yolo.cu.o
	cd /home/jetson/workspace/faceID/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jetson/workspace/faceID /home/jetson/workspace/faceID /home/jetson/workspace/faceID/build /home/jetson/workspace/faceID/build /home/jetson/workspace/faceID/build/CMakeFiles/yolov8.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/yolov8.dir/depend

