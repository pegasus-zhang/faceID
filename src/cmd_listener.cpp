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
    sub_perc_state_ = nh.subscribe("/planning/perc_state", 10, &CmdListener::percStateCallback, this);
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
        action_id_ = msg->action_id;
        std::string host_name = GetChineseName(msg->follow_name);
        ROS_INFO("Receieve host_name: %s", host_name.c_str());
        std::vector<std::string> name_list;
        face_detect_thread_.GetNameList(name_list);
        auto result = find_similar_name_ignore_first(host_name, name_list);
        if(result.second < 0.6)
        {
            ROS_INFO("No similar name found, please check the name: %s", host_name.c_str());
            host_name = "unknown";
        }
        else
        {
            host_name = result.first;
        }
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

void CmdListener::percStateCallback(const perception_msgs::PercState::ConstPtr& msg)
{
    if (action_id_ == msg->action_id &&
     msg->exe_state == msg->ACTION_DONE) 
    {
        face_detect_thread_.suspend();
    } 
}