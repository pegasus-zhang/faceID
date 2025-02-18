Header   header     #  
uint8   id     # #物体ID
int32   type     # #物体类型，TYPE=0//未知物体，TYPE=1//门，TYPE=2//窗户，TYPE=3//冰箱，TYPE=4//电视，TYPE=5//风扇，TYPE=6//衣柜，TYPE=7//床，TYPE=8//沙发，TYPE=9//桌子，TYPE=10//椅子，TYPE=11//楼梯，TYPE=12//台阶，TYPE=13//斜坡，TYPE=14//坑洼，TYPE=15//人
float32   confidence     # #置信度
Point3D   center_point_abs     # #在世界坐标系下的物体中心位置
float32   theta     # #在世界坐标系下物体的朝向
Point3D   velocity     # #在世界坐标系下的物体的速度
float32   length     # #物体外接立体的长度
float32   width     # #物体外接立体的宽度
float32   height     # #物体外接立体的高度
OccGrid[] occupy_grid # # 世界坐标系下物体占据的网格
