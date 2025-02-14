#!/bin/bash

./run-roscore.sh &
./run-dynamic-bridge.sh &

./run-ros1-talker.sh & ./run-ros2-listener.sh