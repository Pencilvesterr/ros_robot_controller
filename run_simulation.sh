#!/bin/bash
echo "Starting Rosbridge"
gnome-terminal --tab -- roslaunch rosbridge_server rosbridge_websocket.launch 
sleep 1
echo "Starting MoveIt"
gnome-terminal --tab -- roslaunch panda_moveit_config demo.launch
echo "Starting ROS nodes"
gnome-terminal --tab -- roslaunch hrca_decision cws_nodes.launch
read
exit 0
