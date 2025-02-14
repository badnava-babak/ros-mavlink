FROM ros:foxy-ros-base-focal

# install ros package
RUN apt-get update && apt-get install -y \
      ros-${ROS_DISTRO}-demo-nodes-cpp \
      ros-${ROS_DISTRO}-demo-nodes-py && \
    rm -rf /var/lib/apt/lists/*


# install pip3 and vim
RUN apt-get update && apt-get install -y \
    python3-pip \
    vim


# install python packages using pip3
WORKDIR /usr/work-dir
COPY requirements.txt ./
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt


RUN apt-get install ros-foxy-mavros ros-foxy-mavros-extras
RUN apt-get install -y ppl-dev libarmadillo-dev


# launch ros package
CMD ["ros2", "launch", "demo_nodes_cpp", "talker_listener.launch.py"]
