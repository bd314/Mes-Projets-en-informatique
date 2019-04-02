#include <ESP8266WiFi.h>
#include <WiFiClient.h>
#include <ESP8266WebServer.h>
#include <ESP8266mDNS.h>
#include "Adafruit_WS2801.h"
#include "SPI.h" // Comment out this line if using Trinket or Gemma
#ifdef __AVR_ATtiny85__
#include <avr/power.h>
#endif


uint8_t dataPin  = D7;    // Green wire 
uint8_t clockPin = D8;    // Red wire 
uint32_t c;
uint32_t off;

const char* ssid = "PRIVATE";
const char* password = "PRIVATE";

Adafruit_WS2801 strip = Adafruit_WS2801(74, dataPin, clockPin, WS2801_GRB);

MDNSResponder mdns;

ESP8266WebServer server(80);

String webPage = "";

int gpio0_pin = 0;

void setup(void){
  #if defined(__AVR_ATtiny85__) && (F_CPU == 16000000L)
  clock_prescale_set(clock_div_1); // Enable 16 MHz on Trinket
  #endif

  strip.begin();
  //startup(500);
  strip.show();


  
  webPage += "<h1>DomoD - Led Web Server</h1><p>Etat  <a href=\"on\"><button>ON</button></a>&nbsp;<a href=\"off\"><button>OFF</button></a></p>";
  //webPage += "<p>Socket #2 <a href=\"socket2On\"><button>ON</button></a>&nbsp;<a href=\"socket2Off\"><button>OFF</button></a></p>";
  

  
  delay(1000);
  Serial.begin(115200);
  WiFi.begin(ssid, password);
  Serial.println("");

  // Wait for connection
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.print("Connected to ");
  Serial.println(ssid);
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());
  
  if (mdns.begin("esp8266", WiFi.localIP())) {
    Serial.println("MDNS responder started");
  }
  
  server.on("/", [](){
    server.send(200, "text/html", webPage);
  });
  server.on("/on", [](){
    c = Color(255,0,0);
    colorWipe(c, 5);
    server.send(200, "text/html", webPage);
    delay(100);
  });
  server.on("/off", [](){
    c = Color(0,0,0);
    colorWipe(c, 5);
    server.send(200, "text/html", webPage);
    delay(100); 
  });

  server.on("/set", setColorRGB);
  server.begin();
  Serial.println("HTTP server started");
  
}
 
void loop(void){
  server.handleClient();
  //rainbowCycle(20);
  
} 

void setColorRGB() {
int r,g,b;
r=server.arg('r').toInt();
g=server.arg('g').toInt();
b=server.arg('b').toInt();
c = Color(r,g,b);
    colorWipe(c, 5);
}

void startup(uint8_t wait) {
  
  int i,fadeSteps, colorFade, nbLeds;
  nbLeds = ((strip.numPixels())/3);


  for(i=0;i < ((strip.numPixels())/3); i++) {
    
    c = Color(0, 1, 0);
    strip.setPixelColor(i, c);
    strip.show();
    
    
    if (i<= ((strip.numPixels())/3)){
      
      for(fadeSteps=(strip.numPixels()/3);fadeSteps < strip.numPixels()-nbLeds; fadeSteps) {
        colorFade=255/strip.numPixels()*i;
        c = Color(0, colorFade, 0);
        // colorWipe(c,wait); erreur allume tout
        delay(1000);
        }
        
    }
    else{
      
      delay(wait);
    }
       
  }
  for(i=(strip.numPixels()/3);i < strip.numPixels()-nbLeds; i++) {
    c = Color(0, 0, 150);
    //colorFade=255/strip.numPixels()*i;
    strip.setPixelColor(i, c);
    strip.show();
    delay(wait); 
  }
  for(i=(strip.numPixels()/3)*2;i < strip.numPixels(); i++) {
    c = Color(150, 0, 0);
    //colorFade=255/strip.numPixels()*i;
    strip.setPixelColor(i, c);
    strip.show();
    delay(wait); 
  }
delay(2500); 
  /*OLD
  for (i=0; i < strip.numPixels(); i++) {
      colorFade=255/strip.numPixels()*i;
      c = Color(0, 150, 0);
      off = Color(0, 0, 0);

      for(i2=0; i2 < strip.numPixels(); i2++){
        //strip.setPixelColor(i, c);
        if (i2>0){
          //strip.setPixelColor(i-i2, off); 
          //strip.setPixelColor(i2, c);
         }
        strip.show();
      }
      
      
      //strip.setPixelColor(i + (strip.numPixels()/3), c);
      //strip.setPixelColor(i + (strip.numPixels()/3)*2, c);
      
      delay(wait);    
    
    */ 
  }





void rainbow(uint8_t wait) {
  int i, j;
   
  for (j=0; j < 256; j++) {     // 3 cycles of all 256 colors in the wheel
    for (i=0; i < strip.numPixels(); i++) {
      strip.setPixelColor(i, Wheel( (i + j) % 255));
    }  
    strip.show();   // write all the pixels out
    delay(wait);
  }
}

// Slightly different, this one makes the rainbow wheel equally distributed 
// along the chain
void rainbowCycle(uint8_t wait) {
  int i, j;
  
  for (j=0; j < 256 * 5; j++) {     // 5 cycles of all 25 colors in the wheel
    for (i=0; i < strip.numPixels(); i++) {
      // tricky math! we use each pixel as a fraction of the full 96-color wheel
      // (thats the i / strip.numPixels() part)
      // Then add in j which makes the colors go around per pixel
      // the % 96 is to make the wheel cycle around
      strip.setPixelColor(i, Wheel( ((i * 256 / strip.numPixels()) + j) % 256) );
    }  
    strip.show();   // write all the pixels out
    delay(wait);
  }
}

// fill the dots one after the other with said color
// good for testing purposes
void colorWipe(uint32_t c, uint8_t wait) {
  int i;
  
  for (i=0; i < strip.numPixels(); i++) {
      strip.setPixelColor(i, c);
      strip.show();
      delay(5);
  }
}

/* Helper functions */

// Create a 24 bit color value from R,G,B
uint32_t Color(byte r, byte g, byte b)
{
  uint32_t c;
  c = r;
  c <<= 8;
  c |= g;
  c <<= 8;
  c |= b;
  return c;
}

//Input a value 0 to 255 to get a color value.
//The colours are a transition r - g -b - back to r
uint32_t Wheel(byte WheelPos)
{
  if (WheelPos < 85) {
   return Color(WheelPos * 3, 255 - WheelPos * 3, 0);
  } else if (WheelPos < 170) {
   WheelPos -= 85;
   return Color(255 - WheelPos * 3, 0, WheelPos * 3);
  } else {
   WheelPos -= 170; 
   return Color(0, WheelPos * 3, 255 - WheelPos * 3);
  }
}



