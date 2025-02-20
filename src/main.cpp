#include <iostream>
#include <string>
using namespace std;
#include <glog/logging.h>
#include "cmdline.h"
#include <fstream>
#include <ros/ros.h>
#include "cmd_listener.h"
int main(int argc, char** argv) {
    FLAGS_logtostderr=true;
    FLAGS_colorlogtostderr=true;
    google::InitGoogleLogging(argv[0]);
    cmdline::parser cmd_parser;
    cmd_parser.add<std::string>("config_path",'c',"config path",false,"../config/default.json");
    cmd_parser.add("show",'\0',"show result flag");
    cmd_parser.add("suspend",'\0',"suspend thread flag");
    cmd_parser.add<std::string>("host_name",'\0',"host name",false,"Zhangzhaokang");
    cmd_parser.parse_check(argc,argv);
    bool show_flag = cmd_parser.exist("show");
    std::string config_path = cmd_parser.get<std::string>("config_path");
    std::string host_name = cmd_parser.get<std::string>("host_name");
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
	bool suspend_flag = cmd_parser.exist("suspend");
    config["debug_parameters"]["suspend"] = suspend_flag;
	config["debug_parameters"]["host_name"] = host_name;
    ros::NodeHandle nh;
    CmdListener cmd_listener;
    cmd_listener.Init(nh, config);
    cmd_listener.start();
    ros::spin();
    return 0;
}
