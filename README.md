# 关于依赖
- CUDA10.2         （可修改，适配TensorRT即可）
- CUDNN8.2.2.26    （可修改，适配 TensorRT即可）
- OpenCV4.5.0     （可修改）
- TensorRT-8.4.3.1

人脸检测部分
bash ./build_yolov8.sh
./workspace/yolo_gpu_test -p ./data -m ./weights/det_10g.engine --fp16 --show --pause

C++部署代码存放在example-yolov8 目录中，部署只需要simple_yolo.h和simple_yolo.cu这两个文件，yolo_test.cpp中给出了实例代码。yolo_test.cpp同时也是个测试代码，可以使用yolo_test.cpp生成的可执行文件对onnx模型进行测试。测试数据可以是图片也可以是视频   
* 如果测试数据是图片
```
./yolo_test -p ../../data/images -m ../../weights/best.onnx --fp16 --show

./yolo_test -p ../data -m ../weights/yolov8n.onnx --fp16 --show --pause
```
-p 选项代表图片目录的路径，测试代码会搜索这个目录下所有图片进行测试   
-m 选项代表onnx模型路径
--fp16代表tensorrt使用fp16精度   
--show 代表显示测试结果
* 如果测试前onnx没有生成engine 可以使用--compile生成engine
```
./yolo_test -p ../../data/images -m ../../weights/best.onnx --fp16  --compile --show
```
* 如果想要一帧一帧测试图片，可以使用--pause选项。对显示图片按**空格键**可以跳转到下一帧
```
./yolo_test -p ../../data/images -m ../../weights/best.onnx --fp16  --pause --show
```
* 通过--start_idx或者-i 选项可以设置起始图片的序号，默认是从第0张开始。这个可以用于调试特定帧的图片   
```
./yolo_test -p ../../data/images -m ../../weights/best.onnx --fp16  --pause -i 1 --show
```
* 通过--device选项可以切换显卡id号,如果不设置默认是0卡
```
./yolo_test -p ../../data/images -m ../../weights/best.onnx --fp16  --device 1 --show
```
* 如果测试数据是视频数据，则-p选项后面跟的视频数据的路径，再增加--video选项来进行区分
```
./yolo_test -p ../../data/test.mp4 --video -m ../../weights/best.onnx --fp16  --show
```
* 设置--roi 和--resize选项可以修改输入的roi，并进行resize
```
./yolo_test -p ../../data/test.mp4 --video -m ../../weights/best.onnx --fp16 --roi 400,500,3000,1000 --resize 640,480 --show
```
roi的四个值分别代表x,y,width,height。x，y代表左上角的像素值，width代表宽度，height代表高度。resize的两个值代表width,height  
* 设置--confidence和--nms选项可以修改confidence的阈值和nms的阈值，confidence的阈值不设置时默认0.4,nms的阈值不设置时默认0.4。
```
./yolo_test -p ../../data/test.mp4 --video -m ../../weights/best.onnx --fp16 --confidence 0.3 --nms 0.5 --show
```
* 如果要使用tensorrt的int8精度，需要有标定数据集
```
./yolo_test -p ../../data/test.mp4 --video -m ../../weights/best.onnx --int8 --calibration_path ../../data/calibration_path --calibration_cache_path ../../data/calibration_path/calibration.cache --compile --show
```
--calibration_path是标定数据集目录的路径
--calibration_cache_path是标定缓存文件存放的路径。如果使用标定数据集生成过标定缓存文件，则可以下次生成int8 engine时可以直接调用这个缓存文件。   
* 如果只是想将检测结果bbox输出到json文件中，则可以使用--output_file选项,选项后面接输出文件的路径  
```
./yolo_test -p ../../data/images -m ../../weights/best.onnx --fp16 --output_file ./output.json
```
json文件说明如下
(1)以图片名作为key去查找bbox。如果是视频，则以帧号作为key
(2)每张图片的检测结果是一个二维数据，每行代表1个bbox的检测结果。检测结果分别为x1 y1 x2 y2 score class 
(3)x1 y1 x2 y2（左上右下）均为在图片上的原始坐标
例：
```
{
    "1.jpg":[[200, 200, 300, 300, 0.9, 0],[400, 400, 500, 500, 0.9, 1]],
    "2.jpg":[[200, 200, 300, 300, 0.9, 0],[400, 400, 500, 500, 0.9,1]]
}

```