void motorTestForward() {
  for (int i = 0; i < 4; i++) {
    digitalWrite(motorPin[i][1], HIGH);
    analogWrite(motorPin[i][0], 100);
    lcd.setCursor(0, 1);
    lcd.print(i);
    delay(1000);
    digitalWrite(motorPin[i][1], LOW);
    analogWrite(motorPin[i][0], 0);
  }
  delay(1000);
}

void motorTestBackward() {
  for (int i = 0; i < 4; i++) {
    digitalWrite(motorPin[i][1], LOW);
    analogWrite(motorPin[i][0], 255-100);
    lcd.setCursor(0, 1);
    lcd.print(i);
    delay(1000);
    digitalWrite(motorPin[i][1], LOW);
    analogWrite(motorPin[i][0], 0);
  }
  delay(1000);
}
