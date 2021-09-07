execute_process(COMMAND "/home/morgan/projects/ros_cws_planner/build/hrca_action/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/morgan/projects/ros_cws_planner/build/hrca_action/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
