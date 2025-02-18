Header   header     #  
uint32   id     # #人体ID
int32   type     # #人物类别，TYPE=0//未知，TYPE=1//主人，TYPE=2//指定用户，TYPE=3//其他用户 
int32   sub_type     # #人物子类别，SUB_TYPE=0//未识别，SUB_TYPE=1//成年人，SUB_TYPE=2//儿童，SUB_TYPE=3//老人
float32   confidence     # #置信度
int32   posture_type     # #人体姿态类型，POSTURE_TYPE=0//未知姿态，POSTURE_TYPE=1//站，POSTURE_TYPE=2//坐，POSTURE_TYPE=3//躺
Point3D   center_point_abs     # 在世界坐标系下的人体中心点位置
float32   theta     # #在世界坐标系下人体的朝向
float32   length     # #人体长度
float32   width     # #人体宽度
float32   height     # #人体高度
Point3D[] polygon_point_abs # # 世界坐标系下人体3D框点坐标
Point3D   velocity     # #在世界坐标系下的人体速度
