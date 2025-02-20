#include "cmd_listener.h"
#include "myPinyin.h"
CmdListener::CmdListener() 
{
}

int CmdListener::Init(ros::NodeHandle& nh, const nlohmann::json& args)
{
    args_ = args;
    face_record_thread_flag_= false;
    sub_perc_cmd_ = nh.subscribe("/planning/perc_cmd", 10, &CmdListener::cmdCallback, this);
    // sub_eye_cmd_ = nh.subscribe("/planning/eye_cmd", 10, &CmdListener::cmdFaceRecordCallback, this);
    int ret = face_detect_thread_.Init(args);
    return ret;
}

void CmdListener::start() {
    face_detect_thread_.start();
    if(args_["debug_parameters"]["suspend"])
    {
        face_detect_thread_.suspend();
    }
    // pub_face_record_state_thread_.start();
}

void CmdListener::cmdCallback(const perception_msgs::PercCmd::ConstPtr& msg) {
    if (msg->perc_kind == msg->PERC_FOLLOW || msg->perc_kind == msg->PERC_WELCOME_DEMO || msg->perc_kind == msg->PERC_LOBBY_DEMO) {
        std::string host_name = GetChineseName(msg->follow_name);
        ROS_INFO("Set host_name: %s", host_name.c_str());
        face_detect_thread_.SetHostName(host_name);
        face_detect_thread_.resume();
    } else if (msg->perc_kind == msg->PERC_NODE_CLOSE || msg->perc_kind == msg->PERC_CANCEL) {
        face_detect_thread_.suspend();
    } else if (msg->perc_kind == 1000) {
        face_detect_thread_.FlipPrintFlag();
    }
}

// CmdListener::cmdFaceRecordCallback 的实现可以保留在源文件中，如果需要启用它的话
// void CmdListener::cmdFaceRecordCallback(const EyeCmd::ConstPtr& msg) {
//     // 实现内容
// }

