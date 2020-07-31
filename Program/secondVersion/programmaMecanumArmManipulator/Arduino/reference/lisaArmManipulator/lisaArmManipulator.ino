#include "global.h"
#include "initialize.h"
#include "inverse.h"
#include "potValue.h"
#include "led.h"


void setup() {
  Serial.begin(115200);
  initializeLED();
}

void loop() {
  readPotValue();

  coordX = xVal;
  coordY = yVal;
  coordZ = zVal;
  ARMData arm = armInverse(coordX, coordY, coordZ);
  checkNegativeValue(arm.Q1, arm.Q2, arm.Q3, arm.Q4);

//  printPotValue();
//  showValue(arm.Q1, arm.Q2, arm.Q3, arm.Q4);
  sendDataUart(arm.Q1, arm.Q2, arm.Q3, arm.Q4);

  digitalWrite(LED5,LedYellowLogic);
  refreshLED();
  delay(10);
}
