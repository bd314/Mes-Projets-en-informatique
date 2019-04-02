# -*- coding: utf-8 -*-
import sys, os


if sys.argv[1]=="on":
	print("Turn on switch433 2. ( Leds Auxiliaires )")
	os.system("sudo /domod/module/433/codesend 5525845")
	os.system("echo 1 > /domod/module/433/eta_switch2")
elif sys.argv[1]=="off":
	print("Turn off switch433 2. ( Leds Auxiliaires )")
	os.system("sudo /domod/module/433/codesend 5525844")
	os.system("echo 0 > /domod/module/433/eta_switch2")
elif sys.argv[1]=="status":
	eta = open("/domod/module/433/eta_switch2","r") 
	print (eta.read())
else:
    print("Not a valid choice.")