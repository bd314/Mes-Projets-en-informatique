# -*- coding: utf-8 -*-
import sys, os


if sys.argv[1]=="on":
	print("Turn on switch433 1. ( Meuble )")
	os.system("sudo /domod/module/433/codesend 5510485")
	os.system("echo 1 > /domod/module/433/eta_switch1")
elif sys.argv[1]=="off":
	print("Turn off switch433 1. ( Meuble )")
	os.system("sudo /domod/module/433/codesend 5510484")
	os.system("echo 0 > /domod/module/433/eta_switch1")
elif sys.argv[1]=="status":
	eta = open("/domod/module/433/eta_switch1","r") 
	print (eta.read())
else:
    print("Not a valid choice.")