//
// Created by lab1 on 7/18/20.
//

#ifndef TOOL_KIT_HPP__
#define TOOL_KIT_HPP__

//mkdir
#include <iostream>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include <sys/stat.h>
#include <unistd.h>
#define ACCESS access
#define MKDIR(a) mkdir((a),0755)

#include <sys/time.h>
#include <sys/timeb.h>
#include <string>
#include <vector>
#include <ctime>
#include <algorithm>


#include <dirent.h> //GetFileListFromDir

#include <fstream> //csv_paser
#include <sstream>


namespace MatrixTimeTool{

    class recoder_time
    {
        struct timeval tpstart,tpend;
        double timeuse;

    public:
        ~recoder_time(){};

        float start()
        {
            return gettimeofday(&tpstart,NULL);
        }

        float get_time(int mod)// 0: don't print; 1: print used time.
        {
            gettimeofday(&tpend,NULL);
            timeuse = 1000000 * (tpend.tv_sec - tpstart.tv_sec) + tpend.tv_usec - tpstart.tv_usec; //该时间单位为微妙
            timeuse /= 1000000; //将微妙的时间换算为妙

            switch (mod) {
                case 0:
                    break;
                case 1:
                    printf("Recoder time info: Used Time:%f s\n",timeuse);
                    break;
            }

            return timeuse;
        }

        /**
         * @name: getTimeStr
         * @msg: 获取本地时间，精确到秒
         * @param {type}
         * @return: string字符串，格式为%Y-%m-%d-%H:%M:%S，如：2021-01-18-19:41:49
         */
        std::string getTimeStr(void)
        {
            time_t tt = std::time(NULL);
            char chCurrentTime[64];
            std::strftime(chCurrentTime, sizeof(chCurrentTime), "%Y-%m-%d-%H:%M:%S", localtime(&tt));
            std::string stCurrentTime = chCurrentTime;
            return stCurrentTime;
        }

        /**
         * @name: getTimeStr2
         * @msg: 获取本地时间,从1970年1月1日开始的毫秒数，精确到毫秒
         * @param {type}
         * @return: string字符串，格式为%ms，如：1610970109594
         */
        std::string getTimeStr2(void)
        {
            struct timeb current_time;
            ftime(&current_time);
            long long t = current_time.time*1000+current_time.millitm;
            return std::to_string(t);
        }

        /**
         * @name: GetLocalTimeWithMs
         * @msg: 获取本地时间，精确到毫秒
         * @param {type}
         * @return: string字符串，格式为YYYYMMDDHHMMSSsss，如：20190710130510368
         */
        static std::string GetLocalTimeWithMs(void)
        {
            std::string defaultTime = "19700101000000000";
            try
            {
                struct timeval curTime;
                gettimeofday(&curTime, NULL);
                int milli = curTime.tv_usec / 1000;

                char buffer[80] = {0};
                struct tm nowTime;
                localtime_r(&curTime.tv_sec, &nowTime);//把得到的值存入临时分配的内存中，线程安全
                strftime(buffer, sizeof(buffer), "%Y%m%d%H%M%S", &nowTime);

                char currentTime[84] = {0};
                snprintf(currentTime, sizeof(currentTime), "%s%03d", buffer, milli);

                return currentTime;
            }
            catch(const std::exception& e)
            {
                return defaultTime;
            }
            catch (...)
            {
                return defaultTime;
            }
        }

    };

    class DirOperation
    {
    private:

    public:
        int CreateDir(const char *pDir)
        {
//            char *pDir = path.c_str();
            int i = 0;
            int iRet;
            int iLen;
            char* pszDir;

            if(NULL == pDir)
            {
                return 0;
            }

            pszDir = strdup(pDir);
            iLen = strlen(pszDir);

            // 创建中间目录
            for (i = 0;i < iLen;i ++)
            {
                if (pszDir[i] == '\\' || pszDir[i] == '/')
                {
                    pszDir[i] = '\0';

                    //如果不存在,创建
                    iRet = ACCESS(pszDir,0);
                    if (iRet != 0)
                    {
                        iRet = MKDIR(pszDir);
                        if (iRet != 0)
                        {
                            return -1;
                        }
                    }
                    //支持linux,将所有\换成/
                    pszDir[i] = '/';
                }
            }

            iRet = MKDIR(pszDir);
            free(pszDir);
            return iRet;
        }

        void GetFileListFromDir (std::string path, std::vector<std::string>& filenames)
        {
            DIR *dir;
            struct dirent* ptr;
            std::vector<std::string> file;
            if(!(dir = opendir(path.c_str()))) {
                std::cerr << "Folder doesn't Exist!" << std::endl;
                return;
            }

            while((ptr = readdir(dir)) != NULL)
            {
                if(ptr->d_name[0] == '.') {continue;}
                file.push_back(ptr->d_name);
            }
            closedir(dir);
            sort(file.begin(), file.end());
            filenames = file;
            return;
        }


    };

    class CSVParser{
    private:
        std::string file_name;
    public:
        CSVParser(std::string name):file_name(name)
        {

        }
        ~CSVParser()
        {

        }

        void setFileName(std::string name)
        {
            file_name = name;
        }

        template <class Type>
        Type stringToNum(const std::string str)
        {
            std::istringstream iss(str);
            Type num;
            iss >> num;
            return num;
        }

        template <typename T>
        bool LoadDataFromFile(std::vector<T> &data, bool table_head_flag)
        {
            std::ifstream inFile(file_name,std::ios::in);
            std::string lineStr;
            if(table_head_flag)
            {
                getline(inFile,lineStr);
            }
            while(getline(inFile,lineStr))
            {
                //        std::cout<<lineStr<<std::endl;
                std::stringstream ss(lineStr);
                std::string str;
                while(getline(ss,str,','))
                {
                    T data_tmp = stringToNum<T>(str);
                    data.push_back(data_tmp);
                }
            }
            return true;
        }
        
        //row从第0行开始
        template <typename T>
        bool LoadDataFromFile(std::vector<std::vector<T>> &data, bool table_head_flag)
        {
            std::ifstream inFile(file_name,std::ios::in);
            std::string lineStr;
            if(table_head_flag)
            {
                getline(inFile,lineStr);
            }
            while(getline(inFile,lineStr))
            {
                std::vector<T> data_row;
                //        std::cout<<lineStr<<std::endl;
                std::stringstream ss(lineStr);
                std::string str;
                while(getline(ss,str,','))
                {
                    T data_tmp = stringToNum<T>(str);
                    data_row.push_back(data_tmp);
                }
                data.push_back(data_row);
            }
            return true;
        }

        //row从第0行开始
        template <typename T>
        bool LoadDataFromFile(std::vector<T> &data, int row,bool table_head_flag)
        {
            std::ifstream inFile(file_name,std::ios::in);
            std::string lineStr;
            if(table_head_flag)
            {
                getline(inFile,lineStr);
            }

            for(int i=0;i<row;i++)
            {
                getline(inFile,lineStr);
            }
            getline(inFile,lineStr);
//        std::cout<<lineStr<<std::endl;
            std::stringstream ss(lineStr);
            std::string str;
            while(getline(ss,str,','))
            {
                T data_tmp = stringToNum<T>(str);
                data.push_back(data_tmp);
            }
            return true;
        }


        template <typename T>
        bool SaveDataToFile(const T &data, const std::string &operation="append")
        {
            std::ofstream out_file;
            if (operation == "new") out_file.open(file_name, std::ios::out);
            else if(operation == "append") out_file.open(file_name, std::ios::app);
            else return false;

            if(!out_file.is_open()) return false;

            out_file << data << ","<<std::endl;
            out_file.close();
            return true;
        }

        template <typename T>
        bool SaveDataToFile(const std::vector<T> &data, const std::string &operation="append")
        {
            std::ofstream out_file;
            if (operation == "new") out_file.open(file_name, std::ios::out);
            else if(operation == "append") out_file.open(file_name, std::ios::app);
            else return false;

            if(!out_file.is_open()) return false;

            for (auto s : data)
            {
                out_file << s << ",";
            }
            out_file << std::endl;

            out_file.close();
            return true;
        }


    };



}


#endif //TOOL_KIT_HPP__