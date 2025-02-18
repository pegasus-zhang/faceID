Header   header     #  
bool   is_valid     # # 数据有效性标志位
float32   latitude     # # 纬度信息
float32   longitude     # # 经度信息
float32   elevation     # # 海拔信息
Point3D   utm_position     # # UTM坐标位置
Point3D   attitude     # # 三轴姿态
Point3D   sd_position     # # 位置标准差
Point3D   sd_velocity     # # 速度标准差
Point3D   sd_attitude     # # 姿态标准差
float32   second     # # 时间
int32   sat_use_num     # # 使用卫星数
int32   sat_in_view_num     # # 可见卫星数
uint16   solution_status     # # 求解状态
uint16   position_type     # # 定位状态
Point3D   linear_velocity     # # 线速度信息
