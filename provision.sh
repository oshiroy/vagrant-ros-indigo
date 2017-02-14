#!/bin/bash

if [ $OSTYPE == linux-gnu ]; then
    # Install Ubuntu Desktop for X-window
    ret=`dpkg -l |grep ubuntu-desktop |awk '{print $1}'`
    if [ ! "${ret}" == ii ]; then
        sudo apt-get update -y
        sudo apt-get install ubuntu-desktop
    # Install ROS
    ret=`dpkg -l |grep ros-indigo-desktop-full |awk '{print $1}'`
    if [ ! "${ret}" == ii ]; then
        sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu trusty main" > /etc/apt/sources.list.d/ros-latest.list'
        wget http://packages.ros.org/ros.key -O - | sudo apt-key add -
        sudo apt-get update -y
        sudo apt-get install ros-indigo-desktop-full  python-rosinstall -y
        # initialize rosdep
        sudo rosdep init
        rosdep update
    fi
fi

sh -c 'echo "export LC_ALL="C"" > ~/.bashrc'

