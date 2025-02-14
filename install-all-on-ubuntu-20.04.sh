#!/bin/bash

locale # check for UTF-8

sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

locale # verify settings

sudo apt update && sudo apt install curl gnupg2 lsb-release
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(source /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list >/dev/null

sudo apt update
sudo apt upgrade
sudo apt install ros-foxy-desktop

sudo apt install -y python3-rosdep
sudo rosdep init
rosdep update

echo "source /opt/ros/foxy/setup.bash" >>~/.bashrc

# install pip3 and vim
apt-get update
apt-get install -y \
  python3-pip \
  vim
apt-get install -y ppl-dev libarmadillo-dev

# install python packages using pip3
pip install --no-cache-dir --upgrade pip
pip install --no-cache-dir -r requirements.txt

source ~/.bashrc

# launch ros package to test installation
ros2 launch demo_nodes_cpp talker_listener.launch.py
