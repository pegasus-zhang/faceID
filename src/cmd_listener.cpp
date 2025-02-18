#include <ros/ros.h>
#include <std_msgs/String.h>
#include <thread>
#include <mutex>
#include <future>
#include "perception_msgs/PercCmd.h"
#include "eye_msgs/EyeCmd.h"
#include "face_id_thread.h"
#include "json.hpp"
#include "myPinyin.h"
#include <glog/logging.h>
#include "cmdline.h"
#include <fstream>
class CmdListener {
public:
    CmdListener() 
    {
    }
    int Init(ros::NodeHandle& nh, const nlohmann::json& args)
    {
        args_ = args;
        face_record_thread_flag_= false;
        sub_perc_cmd_ = nh.subscribe("/planning/perc_cmd", 10, &CmdListener::cmdCallback, this);
        // sub_eye_cmd_ = nh.subscribe("/planning/eye_cmd", 10, &CmdListener::cmdFaceRecordCallback, this);
        int ret = face_detect_thread_.Init(args);
        return ret;
    }
    void start() {
        face_detect_thread_.start();
        if(args_["debug_parameters"]["suspend"])
        {
            face_detect_thread_.suspend();
        }
        // pub_face_record_state_thread_.start();
    }

private:
    void cmdCallback(const perception_msgs::PercCmd::ConstPtr& msg) {
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

    // void cmdFaceRecordCallback(const EyeCmd::ConstPtr& msg) {
    //     std::lock_guard<std::mutex> lock(mutex_);
    //     if (msg->eye_kind == msg->EYE_FACE_RECORD) {
    //         if (!face_record_thread_flag_) {
    //             face_record_thread_flag_ = true;
    //             EyeState state_msg;
    //             state_msg.eye_kind = msg->EYE_FACE_RECORD;
    //             state_msg.action_id = msg->action_id;
    //             state_msg.exe_state = EyeState::ACTION_RUNNING;
    //             state_msg.exe_result = EyeState::ACTION_NONE;
    //             pub_face_record_state_thread_.setState(state_msg);
    //             pub_face_record_state_thread_.resume();
                
    //             std::string human_name = chineseToPinyin(msg->human_name);
    //             FaceDatabaseUpdateThread face_database_update_thread(args_);
                
    //             auto future_result = std::async(std::launch::async, &FaceDatabaseUpdateThread::run, &face_database_update_thread, human_name);
    //             ROS_INFO("Start face database update thread");
    //             bool result = future_result.get();
    //             face_record_thread_flag_ = false;
    //             ROS_INFO("Stop face input thread");

    //             if (!result) {
    //                 state_msg.exe_state = EyeState::ACTION_DONE;
    //                 state_msg.exe_result = EyeState::ACTION_FAIL;
    //                 pub_face_record_state_thread_.setState(state_msg);
    //                 ROS_WARN("Face input failed");
    //                 return;
    //             }
                
    //             ROS_INFO("Loading database");
    //             bool flag = face_detect_thread_.faceDetector().loadDatabase();
    //             if (flag) {
    //                 state_msg.exe_state = EyeState::ACTION_DONE;
    //                 state_msg.exe_result = EyeState::ACTION_SUCCESS;
    //                 pub_face_record_state_thread_.setState(state_msg);
    //                 ROS_INFO("Database loaded successfully");
    //                 face_detect_thread_.setHostName(human_name);
    //                 ROS_INFO("Set host name done");
    //             } else {
    //                 state_msg.exe_state = EyeState::ACTION_DONE;
    //                 state_msg.exe_result = EyeState::ACTION_FAIL;
    //                 pub_face_record_state_thread_.setState(state_msg);
    //                 ROS_WARN("Database load failed");
    //             }
    //         } else {
    //             ROS_INFO("Face record thread is already running");
    //         }
    //     } else if (msg->eye_kind == msg->EYE_BODY_RECORD) {
    //         pub_face_record_state_thread_.suspend();
    //     } else if (msg->eye_kind == msg->EYE_CANCEL) {
    //         if (face_record_thread_flag_) {
    //             face_record_thread_flag_ = false;
    //             ROS_INFO("Stopping face record thread");
    //         } else {
    //             ROS_INFO("Face record thread was not running");
    //         }
    //         EyeState state_msg;
    //         state_msg.eye_kind = msg->EYE_FACE_RECORD;
    //         state_msg.action_id = msg->action_id;
    //         state_msg.exe_state = EyeState::ACTION_DONE;
    //         state_msg.exe_result = EyeState::ACTION_SUCCESS;
    //         pub_face_record_state_thread_.setState(state_msg);
    //     }
    // }

    ros::Subscriber sub_perc_cmd_;
    ros::Subscriber sub_eye_cmd_;
    nlohmann::json args_;
    FaceDetectThread face_detect_thread_;
    std::mutex mutex_;
    bool face_record_thread_flag_;
};

int main(int argc, char** argv) {
    FLAGS_logtostderr=true;
    FLAGS_colorlogtostderr=true;
    google::InitGoogleLogging(argv[0]);
    cmdline::parser cmd_parser;
    cmd_parser.add<std::string>("config_path",'c',"config path",false,"../config/default.json");
    cmd_parser.add("show",'\0',"show result flag");
    cmd_parser.add<bool>("suspend",'\0',"suspend thread flag",false,true);
    cmd_parser.parse_check(argc,argv);
    bool show_flag = cmd_parser.exist("show");
    std::string config_path = cmd_parser.get<std::string>("config_path");
    
    // 初始化ROS节点
    ros::init(argc, argv, "face_id");

    // 创建一个配置对象
    nlohmann::json config;
    std::ifstream file(config_path);  // 打开 JSON 文件
    if (!file) {
        std::cerr << "无法打开配置文件!" << std::endl;
        return -1;
    }
    file >> config;  // 解析 JSON
    config["debug_parameters"]["suspend"] = cmd_parser.get<bool>("suspend");
    ros::NodeHandle nh;
    CmdListener cmd_listener;
    cmd_listener.Init(nh, config);
    cmd_listener.start();
    ros::spin();
    return 0;
}
