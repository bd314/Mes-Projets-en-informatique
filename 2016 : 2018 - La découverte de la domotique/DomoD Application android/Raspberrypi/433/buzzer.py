import RPi.GPIO as GPIO
import time
import sys
GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)

#RED = 13 ; YELLOW = 19 ; GREEN = 26

GPIO.setup(13, GPIO.OUT)

GPIO.output(13, 1)
time.sleep(int(sys.argv[1]))
GPIO.output(13, 0)
