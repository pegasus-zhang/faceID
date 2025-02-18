Header   header     #  
uint8   id     # #手势ID
float32   confidence     # #置信度
int32   gesture_type     # #手势类型，GESTURE_TYPE=0//未知模式，GESTURE_TYPE=1//来，手指指向下方，GESTURE_TYPE=2//握手，GESTURE_TYPE=3//招手，打招呼
BBox2D   gesture_box     # # 手势图像框
