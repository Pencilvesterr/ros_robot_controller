execute_process(COMMAND "/home/hrigroup2/projects/ros_cws_planner/build/python_utilities/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/hrigroup2/projects/ros_cws_planner/build/python_utilities/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
