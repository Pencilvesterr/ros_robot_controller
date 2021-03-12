# Setup
Install [ROS Melodic](http://wiki.ros.org/melodic/Installation/Ubuntu) and ensure that it is sourced as the current ROS distro environment (using the source command)

``` shell
# Ensure the correct ROS distro has been sourced first
# Then source this workspace
$ cd ~/projects/cws_ws
$ source ~/projects/cws_ws/devel/setup.bash
```
If you do not want to have to source the workspace each time you open a terminal, run the following
``` shell
$ echo 'source ~/projects/cws_ws/devel/setup.bash' >> ~/.bashrc
```
Ensure that libfranka and franka_ros are installed so that you can control the Panda robot (assuming you're using the core Python install on your computer?)
``` shell
$ sudo apt install ros-melodic-libfranka ros-melodic-franka-ros
```
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
All information about the PandaSimulator can be found [here.](https://github.com/justagist/panda_simulator) (including setup). You will need to go through the install process as the repos couldn't be added to this repo.

## Usage
Use argument load_gripper:=false for starting without gripper for both commands. More options listed in their launch files. 
``` shell
# Start the MoveIt server and roscore
$ roslaunch panda_sim_moveit sim_move_group.launch 

# Start the simulator
$ roslaunch panda_gazebo panda_world.launch

# Can test with demo showing the task-space control using Franka ROS Interface
$ roslaunch panda_simulator_examples demo_task_space_control.launch
```

# Notes
- Use `catkin build` rather than catkin_make. Explination [here.](https://answers.ros.org/question/320613/catkin_make-vs-catkin_make_isolated-which-is-preferred/)

