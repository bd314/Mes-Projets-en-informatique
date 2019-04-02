import RPi.GPIO as GPIO
import time
GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)

#RED = 18 ; YELLOW = 23 ; GREEN = 24
R = 18
Y = 24
G = 23
GPIO.setup(R, GPIO.OUT)
GPIO.setup(Y, GPIO.OUT)
GPIO.setup(G, GPIO.OUT)

GPIO.output(R, 1)
time.sleep(2)
GPIO.output(R, 0)
GPIO.output(G, 1)
time.sleep(2)
GPIO.output(G, 0)
GPIO.output(Y, 1)
time.sleep(2)
GPIO.output(Y, 0)
time.sleep(1)
GPIO.output(R, 1)
GPIO.output(Y, 1)
GPIO.output(G, 1)
time.sleep(2)
GPIO.output(R, 0)
GPIO.output(Y, 0)
GPIO.output(G, 0)
