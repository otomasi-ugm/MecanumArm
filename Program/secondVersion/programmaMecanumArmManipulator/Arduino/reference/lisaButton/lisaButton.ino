#include "global.h"
#include <LiquidCrystal.h>

LiquidCrystal lcd(10, 11, 26, 24, 25, 12);

void setup() {
  Serial.begin(115200);
  lcd.begin(16, 2);

  for (i = 0; i < 4; i++) {
    pinMode(button[i], INPUT);
    digitalWrite(button[i], HIGH);
  }
}

void loop() {
  for (i = 0; i < 4; i++) {
    valButton[i] = digitalRead(button[i]);
    Serial.print(valButton[i]); Serial.print("\t");
    if (valButton[i] == 0) {
      Serial.print("\n"); Serial.print(button[i]); Serial.print("\t");
      lcd.setCursor(0, 1);
      lcd.print(button[i]);
      while (digitalRead(button[i]) == 0) delay(1);
    }
  }
  lcd.clear();
  Serial.print("\n");
}
