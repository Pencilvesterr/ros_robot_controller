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

echo_and_run cd "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/morgan/projects/ros_cws_planner/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/morgan/projects/ros_cws_planner/install/lib/python2.7/dist-packages:/home/morgan/projects/ros_cws_planner/build/hrca_decision/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/morgan/projects/ros_cws_planner/build/hrca_decision" \
    "/usr/bin/python2" \
    "/home/morgan/projects/ros_cws_planner/src/hri_framework/hrca_decision/setup.py" \
     \
    build --build-base "/home/morgan/projects/ros_cws_planner/build/hrca_decision" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/morgan/projects/ros_cws_planner/install" --install-scripts="/home/morgan/projects/ros_cws_planner/install/bin"
