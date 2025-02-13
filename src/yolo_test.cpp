
#include "simple_yolo.h"

#include <dirent.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <stdarg.h>
#include <string.h>
#include "cmdline.h"
#include <glog/logging.h>
#include <opencv2/opencv.hpp>
#include "jsoncpp/json/json.h"
#include <fstream>

using namespace MatrixRobotVision;

double timestamp_now_float() {
    return std::chrono::duration_cast<std::chrono::microseconds>(std::chrono::system_clock::now().time_since_epoch()).count()/1000.0;
}

std::tuple<uint8_t, uint8_t, uint8_t> hsv2bgr(float h, float s, float v){
    const int h_i = static_cast<int>(h * 6);
    const float f = h * 6 - h_i;
    const float p = v * (1 - s);
    const float q = v * (1 - f*s);
    const float t = v * (1 - (1 - f) * s);
    float r, g, b;
    switch (h_i) {
    case 0:r = v; g = t; b = p;break;
    case 1:r = q; g = v; b = p;break;
    case 2:r = p; g = v; b = t;break;
    case 3:r = p; g = q; b = v;break;
    case 4:r = t; g = p; b = v;break;
    case 5:r = v; g = p; b = q;break;
    default:r = 1; g = 1; b = 1;break;}
    return std::make_tuple(static_cast<uint8_t>(b * 255), static_cast<uint8_t>(g * 255), static_cast<uint8_t>(r * 255));
}

std::tuple<uint8_t, uint8_t, uint8_t> random_color(int id){
    float h_plane = ((((unsigned int)id << 2) ^ 0x937151) % 100) / 100.0f;;
    float s_plane = ((((unsigned int)id << 3) ^ 0x315793) % 100) / 100.0f;
    return hsv2bgr(h_plane, s_plane, 1);
}

bool exists(const std::string& path){

    return access(path.c_str(), R_OK) == 0;

}

const char* mode_string(IScrfd::Mode type) {
    switch (type) {
    case IScrfd::Mode::FP32:
        return "fp32";
    case IScrfd::Mode::FP16:
        return "fp16";
    case IScrfd::Mode::INT8:
        return "int8";
    default:
        return "UnknowCompileMode";
    }
}

IScrfd::BoxArray AddROI(IScrfd::BoxArray boxes, cv::Rect2i roi)
{
    for(auto& obj : boxes)
    {
        obj.left += roi.x;
        obj.right += roi.x;
        obj.top += roi.y;
        obj.bottom += roi.y;
    }
    return boxes;
}

void Str2Vector(std::string str,std::vector<int>& elems, char delim = ',')
{
    std::size_t previous = 0;
    std::size_t current = str.find(delim);
    while (current != std::string::npos) {
        if (current > previous) {
            elems.push_back(std::stoi(str.substr(previous, current - previous)));
        }
        previous = current + 1;
        current = str.find(delim, previous);
    }
    if (previous != str.size()) {
        elems.push_back(std::stoi(str.substr(previous)));
    }
}

int main(int argc,char* argv[])
{
    FLAGS_logtostderr=true;
    FLAGS_colorlogtostderr=true;
    google::InitGoogleLogging(argv[0]);
    cmdline::parser cmd_parser;
    cmd_parser.add<std::string>("data_path",'p',"offline test data path",true);
    cmd_parser.add<std::string>("model",'m',"model name",true);
    cmd_parser.add<int>("start_idx",'i',"start index of file",false,0);
    cmd_parser.add<int>("device",'\0',"device id",false,0);
    cmd_parser.add<int>("batch_size",'\0',"batch size",false,1);
    cmd_parser.add<double>("max_workspace",'\0',"max workspace,GB",false,1);
    cmd_parser.add<std::string>("calibration_path",'\0',"calibration image path",false);
    cmd_parser.add<std::string>("calibration_cache_path",'\0',"calibration cache path",false);
    cmd_parser.add("pause",'\0',"pause one by one");
    cmd_parser.add("fp16",'\0',"FP16 inference");
    cmd_parser.add("int8",'\0',"INT8 inference");
    cmd_parser.add("compile",'\0',"build engine");
    cmd_parser.add("video",'\0',"input is video file");
    cmd_parser.add<double>("confidence",'\0',"confidence threshold",false,0.4f);
    cmd_parser.add<double>("nms",'\0',"nms threshold",false,0.4f);
    cmd_parser.add<std::string>("roi",'\0',"set roi, separate with comma. for example, x,y,width,height",false);
    cmd_parser.add<std::string>("resize",'\0',"resize image, separate with comma. for example, width,height",false);
    cmd_parser.add<std::string>("output_file",'\0',"output file path, exp: ./output.json",false);
    cmd_parser.add("show",'\0',"show result flag");
    cmd_parser.parse_check(argc,argv);
    bool is_video = cmd_parser.exist("video");
    std::string data_path = cmd_parser.get<std::string>("data_path");
    if(!is_video && data_path.back()!='/')
    {
        data_path+="/";
    }
    int start_idx = cmd_parser.get<int>("start_idx");
    bool pause_flag = cmd_parser.exist("pause");
    IScrfd::Mode inference_mode = IScrfd::Mode::FP32;
    if(cmd_parser.exist("fp16"))
    {
        inference_mode = IScrfd::Mode::FP16;
    }
    if(cmd_parser.exist("int8"))
    {
        inference_mode = IScrfd::Mode::INT8;
    }
    const char * mode_name = mode_string(inference_mode);
    int deviceid = cmd_parser.get<int>("device");
    std::string onnx_file = cmd_parser.get<std::string>("model");
    int test_batch_size = cmd_parser.get<int>("batch_size");
    std::string calibration_path = cmd_parser.get<std::string>("calibration_path");
    std::string calibration_cache_path = cmd_parser.get<std::string>("calibration_cache_path");
    double max_workspace = cmd_parser.get<double>("max_workspace"); 
    bool compile_flag = cmd_parser.exist("compile");
    double confidence_threshold = cmd_parser.get<double>("confidence");
    double nms_threshold = cmd_parser.get<double>("nms");
    std::string roi_str = cmd_parser.get<std::string>("roi");
    std::vector<int> roi_vect;
    if(cmd_parser.exist("roi"))
    {
        std::cout<<"roi_str: "<< roi_str <<std::endl;
        Str2Vector(roi_str,roi_vect);
        if(roi_vect.size() != 4)
        {
            LOG(ERROR)<<"roi_vect.size() != 4";
            return -1;
        }
        // LOG(INFO)<<roi_vect[0]<<", "<<roi_vect[1]<<", "<<roi_vect[2]<<", "<<roi_vect[3];
    }
    std::string resize_str = cmd_parser.get<std::string>("resize");
    std::vector<int> resize_vect;
    if(cmd_parser.exist("resize")) 
    {
        Str2Vector(resize_str,resize_vect);
        if(resize_vect.size() != 2)
        {
            LOG(ERROR)<<"resize_vect.size() != 2";
            return -1;
        }
    }
    std::string output_file;
    if(cmd_parser.exist("output_file"))
    {
        output_file = cmd_parser.get<std::string>("output_file");
    }
    bool show_flag = false;
    if(cmd_parser.exist("show"))
    {
        show_flag = true;
    }
    std::shared_ptr<IScrfd> engine = IScrfdManager::create();
    engine->SetPrecision(inference_mode);
    engine->SetDeviceID(deviceid);
    engine->SetBatchSize(test_batch_size);
    engine->SetCalibrationPath(calibration_path);
    engine->SetCalibrationCachePath(calibration_cache_path);
    engine->SetMaxWorkspace(max_workspace * 1024 *1024 *1024);//接口输入的单位是byte，转换为GB

    engine->Init(onnx_file,compile_flag,confidence_threshold, nms_threshold);
    Json::Value root;
    float all_used_time = 0.0;
    if(is_video)
    {
        // 打开文件
        cv::VideoCapture capture;
        LOG(INFO)<<"data_path: "<<data_path;
        capture.open(data_path.c_str());
        if (!capture.isOpened()) 
        {
            printf("could not read this video file...\n");
            return -1;
        }
        cv::Mat image;
        int frame_index = 0;
        while(capture.read(image))
        {
            std::shared_future<IScrfd::BoxArray> boxes_future;
            auto begin_timer = timestamp_now_float();
            
            if(cmd_parser.exist("roi"))
            {
                auto roi = cv::Rect2i(roi_vect[0],roi_vect[1],roi_vect[2],roi_vect[3]);
                cv::Mat roi_image = image(roi);
                image = roi_image;
            }
            if(cmd_parser.exist("resize"))
            {
                // auto time_start = timestamp_now_float();
                cv::resize(image,image,cv::Size(resize_vect[0],resize_vect[1]));
                // auto used_time = timestamp_now_float() - time_start;
                // LOG(INFO)<<"resize used_time(ms): "<<used_time;
            }
            boxes_future = engine->Inference(image);

            auto boxes = boxes_future.get();
            float used_time = (timestamp_now_float() - begin_timer);
            all_used_time += used_time;
            float inference_average_time = all_used_time / ((frame_index+1) * 1.0);
            LOG(INFO)<<"inference used_time(ms): "<<used_time;
            LOG(INFO)<<"inference_average_time(ms): "<<inference_average_time;
            // LOG(INFO)<<"boxes.size(): "<<boxes.size();
            Json::Value bboxes;
            cv::Mat image_show = image.clone();
            for(auto& obj : boxes)
            {
                uint8_t b, g, r;
                std::tie(b, g, r) = random_color(1);
                cv::rectangle(image_show, cv::Point(obj.left, obj.top), cv::Point(obj.right, obj.bottom), cv::Scalar(b, g, r), 2);
                Json::Value bbox;
                bbox.append(obj.left);
                bbox.append(obj.top);
                bbox.append(obj.right);
                bbox.append(obj.bottom);
                bbox.append(obj.confidence);
                // bbox.append(obj.class_label);
                bboxes.append(bbox);
                // std::string name    = std::to_string(obj.class_label);
                // auto caption = cv::format("%s %.2f", name.c_str(), obj.confidence);
                auto caption = cv::format("%.2f", obj.confidence);
                int width    = cv::getTextSize(caption, 0, 1, 2, nullptr).width + 10;
                cv::rectangle(image_show, cv::Point(obj.left-3, obj.top-33), cv::Point(obj.left + width, obj.top), cv::Scalar(b, g, r), -1);
                cv::putText(image_show, caption, cv::Point(obj.left, obj.top-5), 0, 1, cv::Scalar::all(0), 2, 16);
            }
            std::string image_key = std::to_string(frame_index);
            root[image_key] = bboxes;
            if(show_flag)
            {
                cv::namedWindow("detection_result",cv::WINDOW_NORMAL);
                cv::imshow("detection_result",image_show);
                cv::waitKey(1);
                if(pause_flag)
                {
                    cv::waitKey(0);
                }
            }
            frame_index ++;

        }
        capture.release();
    }
    else
    {
        std::vector<cv::String> files_;
        files_.reserve(10000);
        cv::glob(data_path + "/*", files_, false);
        std::vector<std::string> files(files_.begin(), files_.end());
        for (int i=start_idx; i<files.size(); i++)
        {
            LOG(INFO)<<"img_files["<< i<<"]: "<<files[i];
            cv::Mat image = cv::imread(files[i]);
            if (image.empty()) {  // use the file name to search the photo
                std::cout<<"No Picture found: "<< files[i] << std::endl;
                return -1;
            }
            std::shared_future<IScrfd::BoxArray> boxes_future;
            auto begin_timer = timestamp_now_float();
            if(cmd_parser.exist("roi"))
            {
                auto roi = cv::Rect2i(roi_vect[0],roi_vect[1],roi_vect[2],roi_vect[3]);
                cv::Mat roi_image = image(roi);
                image = roi_image;
            }
            if(cmd_parser.exist("resize"))
            {
                cv::resize(image,image,cv::Size(resize_vect[0],resize_vect[1]));
            }
            boxes_future = engine->Inference(image);
            auto boxes = boxes_future.get();
            float used_time = (timestamp_now_float() - begin_timer);
            all_used_time += used_time;
            float inference_average_time = all_used_time / ((i+1) * 1.0);
            LOG(INFO)<<"inference used_time(ms): "<<used_time;
            LOG(INFO)<<"inference_average_time(ms): "<<inference_average_time;
            LOG(INFO)<<"boxes.size(): "<<boxes.size();
            cv::Mat image_show = image.clone();
            Json::Value bboxes;
            for(auto& obj : boxes)
            {
                uint8_t b, g, r;
                std::tie(b, g, r) = random_color(1);
                cv::rectangle(image_show, cv::Point(obj.left, obj.top), cv::Point(obj.right, obj.bottom), cv::Scalar(b, g, r), 2);
                Json::Value bbox;
                bbox.append(obj.left);
                bbox.append(obj.top);
                bbox.append(obj.right);
                bbox.append(obj.bottom);
                bbox.append(obj.confidence);
                // bbox.append(obj.class_label);
                bboxes.append(bbox);
                // std::string name    = std::to_string(obj.class_label);
                // auto caption = cv::format("%s %.2f", name.c_str(), obj.confidence);
                auto caption = cv::format("%.2f", obj.confidence);
                int width    = cv::getTextSize(caption, 0, 1, 2, nullptr).width + 10;
                cv::rectangle(image_show, cv::Point(obj.left-3, obj.top-33), cv::Point(obj.left + width, obj.top), cv::Scalar(b, g, r), -1);
                cv::putText(image_show, caption, cv::Point(obj.left, obj.top-5), 0, 1, cv::Scalar::all(0), 2, 16);

                    // 绘制关键点  
                for (const auto& keypoint : obj.keypoints)  
                {  
                    float x = keypoint.x;  
                    float y = keypoint.y;  
                    // 绘制关键点为小圆点  
                    cv::circle(image_show, cv::Point(x, y), 3, cv::Scalar(b, g, r), -1); // 半径为3，填充颜色  
                }  
            }
            std::string image_key = files[i].substr(files[i].find_last_of("/")+1);
            root[image_key] = bboxes;
            if(show_flag)
            {
                cv::imshow("detection_result",image_show);
                cv::waitKey(1);
                if(pause_flag)
                {
                    cv::waitKey(0);
                }
            }
        }

    }
    
    if(!output_file.empty())
    {
        Json::StyledWriter sw;
        //输出到文件  
        std::ofstream os;
        os.open(output_file, std::ios::out | std::ios::ate);
        if (!os.is_open())
            std::cout << "error：can not find or create the file which named \" demo.json\"." << std::endl;
        os << sw.write(root);
        os.close();
    }

    engine.reset();
    
    return 0;
}