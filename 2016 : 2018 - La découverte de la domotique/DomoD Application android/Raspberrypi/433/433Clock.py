import time, os

def wakeup():
    print("It's time to wake up, starting the light program.")
    os.system(command + code_switch3_on)
    print("LampeTele on.")
    time.sleep(20)
    os.system(command + code_switch2_on)
    print("Bureau on.")
    time.sleep(70)
    os.system(command + code_switch3_off + " && " + command + code_switch2_off )
    print("Lampetele off, bureau off.")
    time.sleep(420)
    os.system(command + code_switch3_on)
    print("Lampetele on.")
    time.sleep(1800)
    os.system(command + code_switch3_off + " && " + command + code_switch2_off + " && " + command + code_switch1_off )
    print("All is off.")
    
def checktime():
    while 1: 
        now = time.localtime()
        print(time.strftime("%A %d %B %Y %H:%M:%S"))              #show current time
    
        if now.tm_wday == 0 or now.tm_wday == 1  or now.tm_wday == 3 :    #Monday #Tuesday #Thursday
            if now.tm_hour == 5:
                if now.tm_min == 30:
                    wakeup()
                else:
                    break
            else:
                break
                print("Nop1")
        elif now.tm_wday == 4:  #Friday
            if now.tm_hour == 6:
                if now.tm_min == 30:
                    wakeup()
                else:
                    break
            else:
                break
                print("Nop2")
        elif now.tm_wday == 5:  #Saturday
            
            if now.tm_hour == 6:
                if now.tm_min == 45:
                    wakeup()
                else:
                    break
            else:
                print("Nop3")
                break
                
                
        else:
            print("Sleeping is a good thing")
            break

command = "sudo /433/433Utils/RPi_utils/codesend "


code_switch1_on = "5510485"
code_switch1_off = "5510484"


code_switch2_on = "5522773"
code_switch2_off = "5522772"


code_switch3_on = "5525845"
code_switch3_off = "5525844"


while 1:
    checktime()
    time.sleep(60)
    

