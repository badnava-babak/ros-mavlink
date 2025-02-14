#!/bin/bash

source "${ROS1_PATH}"/setup.bash

source "${ROS2_PATH}"/setup.bash

export ROS_MASTER_URI=http://localhost:11311
ros2 run ros1_bridge dynamic_bridge
