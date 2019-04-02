#!/usr/bin/env python
import RPi.GPIO as GPIO, os

BtnPin = 15     # pin15 --- button

def setup():
	GPIO.setmode(GPIO.BOARD)       # Numbers GPIOs by physical location
	GPIO.setup(BtnPin, GPIO.IN, pull_up_down=GPIO.PUD_UP)    # Set BtnPin's mode is input, and pull up to high level(3.3V)

def oscommand(ev=None):
	os.system("/etc/init.d/networking restart")

def loop():
	GPIO.add_event_detect(BtnPin, GPIO.FALLING, callback=oscommand) # wait for falling
	while True:
		pass   # Don't do anything

def destroy():
	GPIO.cleanup()                     # Release resource

if __name__ == '__main__':     # Program start from here
	setup()
	try:
		loop()
	except KeyboardInterrupt:  # When 'Ctrl+C' is pressed, the child program destroy() will be  executed.
		destroy()
