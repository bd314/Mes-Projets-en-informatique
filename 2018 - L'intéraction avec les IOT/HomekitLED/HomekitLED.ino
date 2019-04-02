#include <ESP8266WiFi.h>
#include <OneWire.h>
#include <DallasTemperature.h>


const char* ssid = "PRIVATE";
const char* password = "PRIVATE";


#define ONE_WIRE_BUS D4


OneWire oneWire(ONE_WIRE_BUS);


DallasTemperature DS18B20(&oneWire);
char temperatureCString[6];
char temperatureFString[6];


WiFiServer server(80);


void setup() {

 Serial.begin(115200);
 delay(10);

DS18B20.begin(); 

 Serial.println();
 Serial.print("Connecting to ");
 Serial.println(ssid);
 
 WiFi.begin(ssid, password);
 
 while (WiFi.status() != WL_CONNECTED) {
 delay(500);
 Serial.print(".");
 }
 Serial.println("");
 Serial.println("WiFi connected");

 server.begin();
 Serial.println("Web server running. Waiting for the Wemos D1 mini IP...");
 delay(10000);

 Serial.println(WiFi.localIP());
}

void getTemperature() {
 float tempC;
 float tempF;
 do {
 DS18B20.requestTemperatures(); 
 tempC = DS18B20.getTempCByIndex(0);
 dtostrf(tempC, 2, 2, temperatureCString);
 tempF = DS18B20.getTempFByIndex(0);
 dtostrf(tempF, 3, 2, temperatureFString);
 delay(100);
 } while (tempC == 85.0 || tempC == (-127.0));
}


void loop() {

 WiFiClient client = server.available();
 
 if (client) {
 Serial.println("New client");

 boolean blank_line = true;
 while (client.connected()) {
 if (client.available()) {
 char c = client.read();
 
 if (c == '\n' && blank_line) {
 getTemperature();
 client.println("HTTP/1.1 200 OK");
 client.println("Content-Type: text/html");
 client.println("Connection: close");
 client.println();

 client.println("<!DOCTYPE HTML>");
 client.println("<html>");
 client.println("<head><meta http-equiv=refresh content=15></head><body bgcolor=33363B><center><h1><font face=Ubuntu color=FFFFFF>Wemos D1 Mini DS18B20</h1><h3>Temperatur in Celsius: ");
 client.println(temperatureCString);
 client.println("&deg;C</font></h3></center></body></html>"); 
 break;
 }
 if (c == '\n') {

 blank_line = true;
 }
 else if (c != '\r') {

 blank_line = false;
 }
 }
 } 

 delay(1);
 client.stop();
 Serial.println("Client disconnected.");
 }
}
