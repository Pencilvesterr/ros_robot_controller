# Setup
Install [ROS Melodic](http://wiki.ros.org/melodic/Installation/Ubuntu) and ensure that it is sourced as the current ROS distro environment (using the source command)

``` shell
# Ensure the correct ROS distro has been sourced first
# Then source this workspace
$ cd ~/projects/cws_ws
$ source ~/projects/cws_ws/devel/setup.bash
```
If you do not want to have to source the workspace each time you open a terminal, run the following (not on the lab computer though)
``` shell
$ echo 'source ~/projects/cws_ws/devel/setup.bash' >> ~/.bashrc
```
Ensure that libfranka and franka_ros are installed so that you can control the Panda robot (assuming you're using the core Python install on your computer?)
``` shell
$ sudo apt install ros-melodic-libfranka ros-melodic-franka-ros
```
If you're running this at the lab, ensure that you dont install a new libfranka with the code above! They currently use version 3.0 located @ ~/git/libfranka 

If setting up a new environment, you'll want to follow the Franka Ros Interface [setup instructions](https://www.saifsidhik.page/franka_ros_interface/instructions.html#installation) too. 

# Basic ROS Operations

## Basics of building the package
When you pull the repo down into a new environement (e.g. from windows to linux), things will usually break and this can be quickly fixed by rebuilding the catkin package.

``` shell
$ catkin clean
$ catkin build
```


## Running a node
### Single Node
``` shell
# Setup the main node that coordinates other nodes
$ roscore
$ rosrun <package> <your_script.py>  
```
If you're getting 'permission densied', try first running $ sudo bash to run the shell from your super user account. 

## Running a Launch file
This should start all nodes needed for your application (if the launch file is configured correctly)
``` shell
$ roslaunch <package> <filename.launch>
```
## Adding a Python script for a node
To add a python script to your packages ./scripts directory, you need to:
1. Ensure the file starts with: #!/usr/bin/env python
2. Add the file to the CMakeLists.txt 

    catkin_install_python(PROGRAMS scripts/my_script.py
    DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
    )

3. Mark the file as an executable file
``` shell
$ chmod +x my_script.py
```

# Running Robot Simulation
```shell
 ~/projects/ros_cws_planner/run_simulation.sh
```
### Under the hood
``` shell 
# Only needed if communicating with Unity. Make sure to add port at end of ip x.x.x.x:9090
roslaunch rosbridge_server rosbridge_websocket.launch

# Launch the Rviz simulation with 
$ roslaunch panda_moveit_config demo.launch

# Seperate terminal
$ rosrun cws_planning moveit_robot.py

# Seperate terminal 
$ rosrun cws_planning robot_manager.py

# Use to alternatively send CWS zones manually instead of running robot_manager.py
$ rosrun cws_planning talker_demo.py
```

# Running with real robot
## Ensuring franka control is ready (will have to do each time build on lab pc)
Franka control is what actually commands the real robot and is required as a package in this workspace on the lab computer to work. Ensure that it's connected to the lab computer's libfranka install. If you get error with franka_control, refer to [building ros package](https://frankaemika.github.io/docs/installation_linux.html). Make sure to instead use the commands:


``` shell
$ rosdep install --from-paths src --ignore-src --rosdistro melodic -y --skip-keys libfranka
$ catkin build -DCMAKE_BUILD_TYPE=Release -DFranka_DIR:PATH=~/git/libfranka/build
```

## Running in the lab
To get Panda Robot package to control the robot through the Franka ROS interface, you will first need to ensure that the interface is running and connected with the robot. The ./franka.sh file may need to be updated with your computer's IP address.

```shell
# Run the following script to run all necessary launch files 
$ ~/projects/ros_cws_planner/run_lab.sh
```
### Under the hood
``` shell
$ roslaunch franka_control franka_control.launch robot_ip:=172.16.0.2
$ roslaunch panda_moveit_config panda_moveit.launch load_gripper:=true
$ roslaunch panda_moveit_config moveit_rviz.launch

# Launch the rosconnector bridge to communicate with the robot
$ roslaunch rosbridge_server rosbridge_websocket.launch

# Then launch the node that commands the robot with franka control
$ rosrun cws_planning moveit_robot.py

# To start, run the node that actually does the planning
$ roslaunch cws_planning robot_manager.py
```

## Running user study
``` shell 
$ roslaunch rosbridge_server rosbridge_websocket.launch
$ roslaunch panda_moveit_config demo.launch
$ rosrun cws_planning moveit_robot.py
$ rosrun cws_planning robot_manager.py
```

## Setting Up ROS Bridge
To connect the HoloLens to the ROS nodes, you have to go through a ros bridge connector. Please clone the following package into your workspace's ./src directory 

For running the rosbridge, please refer to [this link](http://wiki.ros.org/rosbridge_suite/Tutorials/RunningRosbridge). Then ensure within the unity project ROS Connector > ROS Connector (Script) > ROS Brdige Server Url starts with the first IP address when you run 'hostname -I' in a terminal window. 

Note: The lab computer is 192.168.1.69 for the rosbridge

``` shell
# The launch the ros connector with 
$ roslaunch rosbridge_server rosbridge_websocket.launch
```

# Notes
- Use `catkin build` rather than catkin_make. Explination [here.](https://answers.ros.org/question/320613/catkin_make-vs-catkin_make_isolated-which-is-preferred/)
- Resolve the "robot model parameter not found", add the following to the launch file and make sure that the launch file has been run atleast once so that the param server has the correct values
``` xml
<include file="$(find panda_moveit_config)/launch/planning_context.launch">
    <arg name="load_robot_description" value="true"/>
</include>
```
- Adding additional python modules that aren't runnable scripts [link](https://roboticsbackend.com/ros-import-python-module-from-another-package/)

## Calling a ROS Service from CLI
```shell
$ rosservice call /move_robot "1"
$ rosservice call /move_block "{block_number: 22, block_zone: 1}"
$ rostopic pub /ar_selection cws_planning/TrafficLight '{block_selected: 11, block_status: 2, zone_status: 1, zone_selected: 2}'
$ rostopic echo /gaze_object_selection

# 1: All, 2: Traffic Light Shown, 3: Eye Gaze Published, 4: None
$ rostopic pub /study_condition std_msgs/Int32 '1'
```