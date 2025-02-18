std_msgs/Header header

#动作执行id,增加含义：时间+序号
uint64 action_id

# 人脸录入
uint32 EYE_FACE_RECORD          = 5
uint32 EYE_BODY_RECORD          = 6        

# 欢迎模式
uint32 EYE_WELCOME_DEMO         = 61
# 回大厅找人
uint32 EYE_LOBBY_DEMO           = 62

# 任务取消
uint32 EYE_CANCEL               = 100

# 类型
uint32 eye_kind

# 人的名字
string human_name
