/*
  RF_Sniffer

  Hacked from http://code.google.com/p/rc-switch/

  by @justy to provide a handy RF code sniffer
*/

#include "RCSwitch.h"
#include <stdlib.h>
#include <stdio.h>
RCSwitch mySwitch;


int main(int argc, char *argv[]) {

     // This pin is not the first pin on the RPi GPIO header!
     // Consult https://projects.drogon.net/raspberry-pi/wiringpi/pins/
     // for more information.
     int PIN = 2;

     if(wiringPiSetup() == -1)
       return 0;

     mySwitch = RCSwitch();
     mySwitch.enableReceive(PIN);  // Receiver on inerrupt 0 => that is pin #2


     while(1) {

      if (mySwitch.available()) {

        int value = mySwitch.getReceivedValue();

        if (value == 0) {
          printf("Unknown encoding\n");
        }if(value == 5510485 || value == 5510484 || value == 5522773 || value == 5522772 || value == 5525845 || value == 5525844 || value == 1070396 || value == 1070387){

			if (value == 5510485){
				printf("SalonOn %i\n", mySwitch.getReceivedValue() );
				system("433write 1 1"); 
			}if(value == 5510484){
				printf("SalonOff %i\n", mySwitch.getReceivedValue() );
				system("433write 1 0");	
		    }if(value == 5522773){
				printf("BureauOn %i\n", mySwitch.getReceivedValue() );
				system("433write 2 1");
		    }if(value == 5522772){
				printf("BureauOff %i\n", mySwitch.getReceivedValue() );
				system("433write 2 0");
		    }if(value == 5525845){
				printf("LampeTeleOn %i\n", mySwitch.getReceivedValue() );
				system("433write 3 1");
		    }if(value == 5525844){
				printf("LampeTeleOff %i\n", mySwitch.getReceivedValue() );
				system("433write 3 0");
		    }if(value == 1070387){
				printf("LampesON %i\n", mySwitch.getReceivedValue() );
				system("codesend 5510485");
				system("codesend 5522773");
		    }if(value == 1070396){
				printf("LampesOFF %i\n", mySwitch.getReceivedValue() );
				system("codesend 5510484");
				system("codesend 5522772");
		    }

		}else {

          printf("Received %i\n", mySwitch.getReceivedValue() );
          printf("Bit lenght %i\n", mySwitch.getReceivedBitlength() );
          printf("Protocol %i\n\n", mySwitch.getReceivedProtocol() );
        }

        mySwitch.resetAvailable();

      }
 
  }
  exit(0);
}
