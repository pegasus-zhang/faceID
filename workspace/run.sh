SCRIPT_DIR=$(dirname "$0")
source $SCRIPT_DIR/../ros1_interface/devel/setup.bash
taskset -c 5,6 ./face_id_app --host_name none --suspend