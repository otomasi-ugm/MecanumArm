#include "Wire.h"
#include "Adafruit_Sensor.h"
#include "Adafruit_HMC5883_U.h"
Adafruit_HMC5883_Unified mag = Adafruit_HMC5883_Unified(12345);
#include <LiquidCrystal.h>
LiquidCrystal lcd(10, 11, 26, 24, 25, 12);

#include "global.h"

void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  lcd.begin(16, 2);
  mag.begin();
}

void loop() {
  sensors_event_t event;
  mag.getEvent(&event);
  heading = atan2(event.magnetic.y, event.magnetic.x);
  heading += declinationAngle;
  if (heading < 0)
    heading += 2 * PI;
  if (heading > 2 * PI)
    heading -= 2 * PI;
  float headingDegrees = heading * 180 / M_PI;
  lcd.setCursor(0, 1);
  lcd.print(360 - headingDegrees);
  Serial.println(360 - headingDegrees);
  delay(10);
  lcd.clear();
}
