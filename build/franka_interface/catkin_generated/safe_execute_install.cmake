execute_process(COMMAND "/home/morgan/projects/cws_ws/build/franka_interface/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/morgan/projects/cws_ws/build/franka_interface/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
