# Unitree-Go1

This repository setups a ROS environment for Unitree Go1 using Docker.

## Dependencies

- [rocker](https://github.com/osrf/rocker)
- [docker](https://www.docker.com/)

## Usage

```console
$ git clone --recursive https://github.com/ruke1ire/unitree_go1
$ cd unitree_go1
$ docker build -t unitree_go1 .
$ rocker --x11 --nvidia --privileged unitree_go1
```
To start a gazebo simulation run:
```console
root@<id>:/home/catkin_ws# roslaunch unitree_gazebo normal.launch rname:=go1 wname:=stairs
```

