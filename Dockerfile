FROM osrf/ros:melodic-desktop-full

RUN apt-get update && apt-get install -y ros-melodic-controller-interface\
    ros-melodic-gazebo-ros-control\
    ros-melodic-joint-state-controller\
    ros-melodic-effort-controllers\
    ros-melodic-joint-trajectory-controller

RUN apt-get update && apt-get install -y cmake python-catkin-pkg python-empy python-nose libgtest-dev python3-pip python-catkin-tools

RUN pip3 install --no-cache-dir --upgrade pip && \
    pip3 install --no-cache-dir catkin_pkg

RUN apt-get install ros-melodic-catkin

RUN mkdir -p /home/catkin_ws/src
WORKDIR /home/catkin_ws

COPY ./unitree_ros/ /home/catkin_ws/src/unitree_ros
COPY ./unitree_ros_to_real/ /home/catkin_ws/src/unitree_ros_to_real
COPY ./unitree_legged_sdk/ /home/catkin_ws/src/unitree_legged_sdk

RUN rosdep update --include-eol-distros && rosdep install -y --from-paths . --ignore-src --rosdistro melodic

RUN apt-get install -y g++-8 && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 700 --slave /usr/bin/g++ g++ /usr/bin/g++-7 && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 800 --slave /usr/bin/g++ g++ /usr/bin/g++-8

WORKDIR /home/catkin_ws/src/unitree_legged_sdk
RUN mkdir build && cd build && cmake ../ && make

WORKDIR /home/catkin_ws
RUN /bin/bash -c '. /opt/ros/melodic/setup.bash; catkin_make'
