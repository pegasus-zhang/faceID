std_msgs/Header header

# ActionState
uint8 ACTION_IDLE = 0
uint8 ACTION_RUNNING = 1
uint8 ACTION_DONE = 2

# ActionResult
uint8 ACTION_NONE = 0
uint8 ACTION_SUCCESS = 1
uint8 ACTION_FAIL = 2

# ErrCode
uint16 ACTION_ERR_NONE = 0
uint16 ACTION_ERR_NOWORK = 1

# 当前执行的id
uint64 action_id

# 人脸录入
uint32 EYE_FACE_RECORD          = 5
uint32 EYE_BODY_RECORD          = 6 
# 欢迎模式
uint32 EYE_WELCOME_DEMO         = 61
# 回大厅找人
uint32 EYE_LOBBY_DEMO           = 62

# 任务取消（不需要请求）
uint32 EYE_CANCEL               = 100

# 类型
uint32 eye_kind
# 执行状态：空闲/正在执行/执行完成
uint8 exe_state
# 执行结果：无效/成功/失败
uint8 exe_result

# 错误码
uint16 err_code
# 错误消息
string err_info
# 剩余执行时间
uint64 wait_for_millisec
