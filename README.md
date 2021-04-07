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
Ensure that libfranka and franka_ros are installed so that you can control the Panda robot (assuming you're using the core Python install on your computer?) (dont do this on lab computers)
``` shell
$ sudo apt install ros-melodic-libfranka ros-melodic-franka-ros
```
If you're running this at the lab, ensure that you dont install a new libfranka with the code above! They currently use version 3.0 located @ ~/git/libfranka 

If setting up a new environment, you'll want to follow the Franka Ros Interface [setup instructions](https://www.saifsidhik.page/franka_ros_interface/instructions.html#installation) too. 

## Running a node
### Single Node
``` shell
# Setup the main node that coordinates other nodes
$ roscore
$ rosrun <package> <your_script.py>  
```
If you're getting 'permission densied', try first running $ sudo bash to run the shell from your super user account. 

### Running a Launch file
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

# Running Simulation
``` shell 
# Launch the Rviz simulation with 
$ roslaunch panda_moveit_config demo.launch
```

# Setting up nodes for CWS Planning
``` shell
$ rosrun cws_planning moveit_listener.py

# Can also launch this if you want to send CWS zones manually during testing 
$ rosrun cws_planning talker_demo.py
```

# Running with real robot
## Building at Lab
If you're using this at the lab for the first time, make sure you build the project and use libfranka that is compatible with the server running the panda arm. Follow the instrucitons [here](https://frankaemika.github.io/docs/installation_linux.html) from "Buildind the ROS Package". Do not install libfranka with sudo apt! 

``` shell
$ catkin build -DCMAKE_BUILD=Release -DFranka_DIR:PATH=~/git/libfranka/build
```

# Running at Lab
``` shell
# Connect to the robot. Ensure that both ethernet connections are setup
$ roslaunch franka_control franka_control.launch robot_ip:=172.16.0.2
$ roslaunch panda_moveit_config panda_moveit.launch load_gripper:=true

# Launch the rosconnector bridge to communicate with the robot
$ roslaunch rosbridge_server rosbridge_websocket.launch

# Then launch the listener node that controls the robot
$ rosrun cws_planning moveit_listener.py

# If you want Rviz too
$ roslaunch panda_moveit_config moveit_rviz.launch
```

## Setting Up ROS Bridge
To connect the HoloLens to the ROS nodes, you have to go through a ros bridge connector. Please clone the following package into your workspace's ./src directory 

For running the rosbridge, please refer to [this link](http://wiki.ros.org/rosbridge_suite/Tutorials/RunningRosbridge). Then ensure within the unity project ROS Connector > ROS Connector (Script) > ROS Brdige Server Url starts with the first IP address when you run 'hostname -I' in a terminal window. 

``` shell
# The launch the ros connector with 
$ roslaunch rosbridge_server rosbridge_websocket.launch
```

# Notes
- Use `catkin build` rather than catkin_make. Explination [here.](https://answers.ros.org/question/320613/catkin_make-vs-catkin_make_isolated-which-is-preferred/)

