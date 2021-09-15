#!/bin/bash
echo "Starting franka control"
gnome-terminal --tab -- roslaunch franka_control franka_control.launch robot_ip:=172.16.0.2
sleep 5
echo "Starting MoveIt"
gnome-terminal --tab -- roslaunch panda_moveit_config panda_moveit.launch load_gripper:=true
sleep 5
echo "Starting Rviz"
gnome-terminal --tab -- roslaunch panda_moveit_config moveit_rviz.launch
sleep 1
echo "Starting Rosbridge"
gnome-terminal --tab -- roslaunch rosbridge_server rosbridge_websocket.launch 
echo "Starting ROS nodes"
gnome-terminal --tab -- roslaunch hrca_decision lab_real_robot.launch 
read