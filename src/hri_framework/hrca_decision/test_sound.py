import os
import subprocess
import time

PREFIX_PATH = "/home/hrigroup2/"
devnull = open('/dev/null', 'w')
p1 = subprocess.Popen(["mpg321", "--gain", "20", PREFIX_PATH + "I.mp3"], shell=False, stdout=subprocess.PIPE, stderr=devnull)
time.sleep(0.5)
p2 = subprocess.Popen(["mpg321", "--gain", "20", PREFIX_PATH + "second_object.mp3"], shell=False, stdout=subprocess.PIPE, stderr=devnull)

while p2.poll() is None:
    time.sleep(0.1)

print("hello there, General Kenobi")
