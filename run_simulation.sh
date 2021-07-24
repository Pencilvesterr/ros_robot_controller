#!/bin/bash
echo "Starting Rosbridge"
gnome-terminal --tab -- roslaunch rosbridge_server rosbridge_websocket.launch 
sleep 1
echo "Starting ROS nodes"
gnome-terminal --tab -- roslaunch cws_planning cws_nodes.launch
read
