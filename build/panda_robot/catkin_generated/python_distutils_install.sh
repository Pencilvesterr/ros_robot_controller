#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/hrigroup2/projects/ros_cws_planner/src/panda_robot"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/hrigroup2/projects/ros_cws_planner/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/hrigroup2/projects/ros_cws_planner/install/lib/python2.7/dist-packages:/home/hrigroup2/projects/ros_cws_planner/build/panda_robot/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/hrigroup2/projects/ros_cws_planner/build/panda_robot" \
    "/usr/bin/python2" \
    "/home/hrigroup2/projects/ros_cws_planner/src/panda_robot/setup.py" \
     \
    build --build-base "/home/hrigroup2/projects/ros_cws_planner/build/panda_robot" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/hrigroup2/projects/ros_cws_planner/install" --install-scripts="/home/hrigroup2/projects/ros_cws_planner/install/bin"
