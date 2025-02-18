Header   header     #  
uint32   id     # #面容ID
string   name     # #面容名称
int32   emotion_type     # #情绪类别，EMOTION_TYPE=0//未知，EMOTION_TYPE=1//开心，EMOTION_TYPE=2//悲伤
int32   type     # #人物类别，TYPE=0//未知，TYPE=1//主人，TYPE=2//指定主人，TYPE=3//陌生用户
float32   confidence     # #人脸检测置信度
BBox2D   face_box     # # 人脸图像框
BBox2D   body_box     # # 人体图像框
Point3D   center_point_abs     # 在世界坐标系下的人体中心点位置
sensor_msgs/Image image
