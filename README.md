# Unitree-Go1

This repository setups a ROS environment for Unitree Go1 using Docker.

## Dependencies

- [rocker](https://github.com/osrf/rocker)

```console
$ cd unitree_go1
$ docker build -t unitree_go1 .
$ rocker --x11 --nvidia --privileged unitree_go1
root@<id>:/home/catkin_ws# roslaunch unitree_gazebo normal.launch rname:=go1 wname:=stairs
```
