Header   header     #  
PointLLH   position     # # 经纬度高程
float32   pitch     # # 姿态角(单位弧度，满足右手定则)
float32   roll     #  
float32   heading     #  
Point3D   linear_velocity     # # 线速度（m/s，xxx坐标系）
Point3D   linear_acceleration     # # 线加速度（m/s2，xxx坐标系）
Point3D   angular_velocity     # # 角速度（度/s，xxx坐标系，满足右手定则）
int32   odom_type     # # 融合标志:0-(纯gps) 1-(gps+imu递推) 2-(语义匹配定位) 3-(语义匹配+imu+gps)
string   location_valid_flag     # # Location有效性标志位0: invalid； 1: valid
float32   origin_lat     # # 参考点纬度 GCJ-02格式
float32   origin_lon     # # 参考点经度 GCJ-02格式
PointENU   utm_position     # # 相对参考点xyz坐标
Point3D   position_std_dev     # # 位置标准差
Point3D   orientation_std_dev     # # 方向标准差
Point3D   linear_velocity_std_dev     # # 速度标准差
Point3D   linear_acceleration_std_dev     # # 加速度标准差
Point3D   angular_velocity_std_dev     # # 角速度标准差
