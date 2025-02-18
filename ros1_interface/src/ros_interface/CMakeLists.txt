cmake_minimum_required(VERSION 2.8.3)
project(ros_interface)

find_package(catkin REQUIRED COMPONENTS
  message_generation
  std_msgs
  rospy
  roscpp
  sensor_msgs
)

## Generate messages in the 'msg' folder
add_message_files(
  DIRECTORY msg
  FILES
Header.msg
Time.msg
PointLLH.msg
Point3D.msg
PointENU.msg
Quaternion.msg
Twist.msg
Vector3.msg
BBox2D.msg
Polygon3D.msg
QuadbotCmd.msg
ComplexCommand.msg
QuadbotState.msg
RobotPlan.msg
RobotTwist.msg
FusedLocalization.msg
Gnss.msg
Imu.msg
VIOOdom.msg
Odometry.msg
PoseWithCovariance.msg
TwistWithCovariance.msg
RobotEnd.msg
Body.msg
Face.msg
FaceList.msg
Gesture.msg
ObstacleList.msg
Obstacle.msg
OccGrid.msg
FreeSpace.msg
Image.msg
PointCloud2.msg
PointField.msg
Terrain.msg
PercCmd.msg
Point.msg
PercReq.msg
PercState.msg
BodyList.msg
)

## Generate added messages and services with any dependencies listed here
generate_messages(
  DEPENDENCIES
  std_msgs
  sensor_msgs
)
catkin_package(
  CATKIN_DEPENDS
  message_runtime
 #std_msgs
)
