#! /usr/bin/env python2.7
# DEPENDENCIES 
from gtts import gTTS

# I split 
tts = gTTS('I', slow = True)
tts.save('I.mp3')

# Demo
tts = gTTS('will pack an object.', slow = True)
tts.save('demo.mp3')

# Scanning

tts = gTTS('Moving to scanning pose.', slow = True)
tts.save('scanning.mp3')

tts = gTTS('Please give me a moment while I prepare.', slow = True)
tts.save('scanning_wait.mp3')

# General pick and place

tts = gTTS('will now start by packing my first object.', slow = True)
tts.save('first_object.mp3')

tts = gTTS('am going to pack my second object.', slow = True)
tts.save('second_object.mp3')

tts = gTTS('am going to pack my third object.', slow = True)
tts.save('third_object.mp3')

tts = gTTS('am going to pack my last object.', slow = True)
tts.save('last_object.mp3')

tts = gTTS('have packed all my items.', slow = True)
tts.save('finish.mp3')

# Human packing prompt
tts = gTTS('It is now your turn to pack. We can alternate packing throughout our task today.')
tts.save('human_propmt.mp3')

# Mistake and apology 
tts = gTTS('have made a mistake. I am sorry for missing the box. I will do better next time. It would be great if you could pack it for me. I will now move out of the way.', slow = True)
tts.save('mistake.mp3')

# Unintended error 
tts = gTTS('am sorry. I am unable to pack this object. It would be great if you could pack it for me. I will now move out of the way.', slow = True)
tts.save('unintended_error.mp3')

# move boxes 
tts = gTTS('Remember to move the box to the storage area when you finish packing and to place a new box on the table.')
tts.save('box_reminder.mp3')


