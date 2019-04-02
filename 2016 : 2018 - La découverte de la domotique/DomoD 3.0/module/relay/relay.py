#!/usr/bin/env python
import sys, os
import RPi.GPIO as GPIO
import time

RelayPin = 13    # pin13 physical

GPIO.setmode(GPIO.BOARD)       # Numbers GPIOs by physical location
GPIO.setup(RelayPin, GPIO.OUT)
GPIO.output(RelayPin, GPIO.HIGH)

if sys.argv[1]=="off":
	print '...relayd off'
	GPIO.output(RelayPin, GPIO.LOW)
elif sys.argv[1]=="on":
	print 'relay on...'
	GPIO.output(RelayPin, GPIO.HIGH)
else:
	print("Not a valid choice.")
