/*
 * Usage: ./send <numéro prise><command>
 * Command is 0 for OFF and 1 for ON
 * 
1 on - 1070387
100000101010100110011
1 off - 1070396
100000101010100111100
2 on - 
01001111111101101100
2 off - 
01001111111101111101
3 on - 
01001111111110101111
3 off - 
01001111111110111110
 *
 *    
 */
 
#include "RCSwitch.h"
#include <stdlib.h>
#include <stdio.h>
 
int main(int argc, char *argv[]) {
 
  /*
   * output PIN is hardcoded for testing purposes
   * see https://projects.drogon.net/raspberry-pi/wiringpi/pins/
   * for pin mapping of the raspberry pi GPIO connector
   */
  int i = 0;
  int PIN = 0;
  int command  = atoi(argv[1]);
 
  if (wiringPiSetup () == -1) return 1;
  RCSwitch mySwitch = RCSwitch();
  mySwitch.setProtocol(3);
  mySwitch.enableTransmit(PIN);
 
    
  switch(command) {
        case 11:  // 1 a ON
            for (i=1; i<10; i++) {
            mySwitch.send("100000101010100110011");
            delayMicroseconds(810);
            }
            break;
        case 10:  // 1 a Off
            for (i=1; i<10; i++) {
            mySwitch.send("100000101010100111100");
            delayMicroseconds(810);
            }
            break;
        case 21:  // 2 a On
            for (i=1; i<10; i++) {
            mySwitch.send("01001111111101101100");
            delayMicroseconds(810);
            }
            break;
        case 20:  // 2 a Off
            for (i=1; i<10; i++) {
            mySwitch.send("01001111111101111101");
            delayMicroseconds(810);
            }
            break;
        case 31:  // 3 a ON
            for (i=1; i<10; i++) {
            mySwitch.send("01001111111110101111");
            delayMicroseconds(810);
            }
            break;
        case 30:  // 3 a Off
            for (i=1; i<10; i++) {
            mySwitch.send("01001111111110111110");
            delayMicroseconds(810);
            }
            break;
        default:
            printf("./send Numéro Prise+1=On ou 0=Off");
            return -1;
    }
      
      
  return 0;
}