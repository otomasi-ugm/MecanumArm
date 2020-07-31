#include "global.h"
#include "initialize.h"
#include <LiquidCrystal.h>

LiquidCrystal lcd(10, 11, 26, 24, 25, 12);

void setup() {
  lcd.begin(16, 2);
  initializeMotor();
}

void loop() {
  // put your main code here, to run repeatedly:
  motorTestForward();
  motorTestBackward();
}
