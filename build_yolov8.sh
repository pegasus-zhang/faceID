#获得发布版本号信息
mainVersion=`git tag --sort=-taggerdate | head -n 1`

#获得编译时间
current=`date "+%Y-%m-%d %H:%M:%S"`
timeStamp=`date -d "$current" +%s | sed -r 's/^0+//'`
nsTime=`date "+%N" | sed -r 's/^0+//'`

#获得编译时的commit ID号和log描述信息
gitHeadVersion=`git log --oneline -1|awk '{print $1}'`
gitHeadLog=`git log --oneline -1|awk '{print $0}'`

#
installRootPath="/opt/opt_control/"

echo "build app version:"$mainVersion
echo "build git version:"$gitHeadVersion
echo "build git log:"$gitHeadLog
echo "install root path:"$installRootPath

#生成makefile
module_build_dir="build"
mkdir $module_build_dir
cd $module_build_dir
cmake -D_app_version_=$mainVersion  -D_git_version_=$gitHeadVersion -D_git_log_="$gitHeadLog" -D_install_root_path_=$installRootPath  -DGTEST_OPTION=OFF ..

#编译
make -j8
