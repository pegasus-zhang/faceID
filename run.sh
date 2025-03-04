SCRIPT_DIR=$(dirname "$0")
source $SCRIPT_DIR/ros1_interface/devel/setup.bash
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:../lib
taskset -c 5,6 ./workspace/face_id_app --host_name none --suspend