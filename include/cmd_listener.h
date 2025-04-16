#ifndef CMD_LISTENER_H
#define CMD_LISTENER_H

#include <ros/ros.h>
#include "json.hpp"
#include <perception_msgs/PercCmd.h>
#include <perception_msgs/PercState.h>
#include <std_msgs/String.h>
#include "face_id_thread.h"
#include "name_matching.h"
class CmdListener {
public:
    CmdListener();
    int Init(ros::NodeHandle& nh, const nlohmann::json& args);
    void start();

private:
    void cmdCallback(const perception_msgs::PercCmd::ConstPtr& msg);
    // void cmdFaceRecordCallback(const EyeCmd::ConstPtr& msg);
    void percStateCallback(const perception_msgs::PercState::ConstPtr& msg);
    
    ros::Subscriber sub_perc_cmd_;
    ros::Subscriber sub_eye_cmd_;
    ros::Subscriber sub_perc_state_;
    nlohmann::json args_;
    FaceDetectThread face_detect_thread_;
    std::mutex mutex_;
    bool face_record_thread_flag_;
    int action_id_ = 0;
};

#endif // CMD_LISTENER_H
