#include <ESP8266WiFi.h>
#include <ESP8266mDNS.h>
#include <WiFiUdp.h>
#include <ArduinoOTA.h>
#include <Arduino.h>
#include <EEPROM.h>
extern "C" {
#include "user_interface.h"
}

#include <IRremoteESP8266.h>
#include "ESPWifiDriver.h"
#include "ESPFastLedDriver.h"
#include "ESPWebDriver.h"



const String hostname = "Hauteur";


/*
Wireless access point settings
*/
// Operate as a standalone AccessPoint ? (set false for wifi client)
const bool apMode = false;
// Set a PreSharedKey to connect to the AP ? (leave blank for no PSK)
const char apWifiPSK[] = "HelloHowAreYu";


/*
Wireless client settings (apMode = false)
*/
const char* ssid = "PRIVATE";
const char* password = "PRIVATE";

const bool clientUseDHCP = true;

// ip, gateway, netmask, only used if ClientUseDHCP = true
IPAddress ip(192, 168, 6, 243);
IPAddress gateway(192, 168, 6, 253);
IPAddress netmask(255, 255, 255, 0);




/*
Config End
*/




ESPWifiDriver wifidriver(hostname);
ESPFastLedDriver leddriver;
ESPWebDriver webdriver(&leddriver);


void setup() {
  // Start the serial connection
  Serial.begin(115200);
  EEPROM.begin(512);

  Serial.println();
  Serial.print( F("Heap: ") ); Serial.println(system_get_free_heap_size());
  Serial.print( F("Boot Vers: ") ); Serial.println(system_get_boot_version());
  Serial.print( F("CPU: ") ); Serial.println(system_get_cpu_freq());
  Serial.print( F("SDK: ") ); Serial.println(system_get_sdk_version());
  Serial.print( F("Chip ID: ") ); Serial.println(system_get_chip_id());
  Serial.print( F("Flash ID: ") ); Serial.println(spi_flash_get_id());
  Serial.print( F("Flash Size: ") ); Serial.println(ESP.getFlashChipRealSize());
  Serial.print( F("Vcc: ") ); Serial.println(ESP.getVcc());
  Serial.println();

  SPIFFS.begin();
  {
    Dir dir = SPIFFS.openDir("/");
    while (dir.next()) {
      String fileName = dir.fileName();
      size_t fileSize = dir.fileSize();
      Serial.printf("FS File: %s, size: %s\n", fileName.c_str(), String(fileSize).c_str());
    }
    Serial.printf("\n");
  }

  // Start the wifi driver in either AP or Client mode
  if (apMode) {
    wifidriver.setupAP(apWifiPSK);
  } else {
    if (!clientUseDHCP) {
      wifidriver.setupClientNetwork(ip, gateway, netmask);
    }
    wifidriver.setupClient(ssid, password);
  }
  // wifidriver.setupMDNS();
  leddriver.setup();
  webdriver.setRoutes();
  webdriver.begin();
  Serial.print(leddriver.getStatus());
  
  //OTA
  Serial.println("BootingOTA");
  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid, password);
  while (WiFi.waitForConnectResult() != WL_CONNECTED) {
    Serial.println("Connection Failed! Rebooting...");
    delay(5000);
    ESP.restart();
  }

  // Port defaults to 8266
  // ArduinoOTA.setPort(8266);

  // Hostname defaults to esp8266-[ChipID]
   ArduinoOTA.setHostname("Hauteur");

  // No authentication by default
  // ArduinoOTA.setPassword((const char *)"123");

  ArduinoOTA.onStart([]() {
    Serial.println("Start");
  });
  ArduinoOTA.onEnd([]() {
    Serial.println("\nEnd");
  });
  ArduinoOTA.onProgress([](unsigned int progress, unsigned int total) {
    Serial.printf("Progress: %u%%\r", (progress / (total / 100)));
  });
  ArduinoOTA.onError([](ota_error_t error) {
    Serial.printf("Error[%u]: ", error);
    if (error == OTA_AUTH_ERROR) Serial.println("Auth Failed");
    else if (error == OTA_BEGIN_ERROR) Serial.println("Begin Failed");
    else if (error == OTA_CONNECT_ERROR) Serial.println("Connect Failed");
    else if (error == OTA_RECEIVE_ERROR) Serial.println("Receive Failed");
    else if (error == OTA_END_ERROR) Serial.println("End Failed");
  });
  ArduinoOTA.begin();
  Serial.println("Ready");
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());
  
    
  
}

void loop() {
  ArduinoOTA.handle();
  leddriver.run(30);
}


