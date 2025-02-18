Header   header     #  
uint64   action_id     # #动作执行id
int32   quadbot_kind     # #简单指令（坐下...）；复杂指令（走直线/走圆弧）
string   action_name     # #简单指令，坐下，站起来（坐下，站起来指令直接运控执行），包含步态切换，规划只需要发送这个就行了
Twist   twist     #  
ComplexCommand   complex_cmd     # #规划端不使用这个指令
