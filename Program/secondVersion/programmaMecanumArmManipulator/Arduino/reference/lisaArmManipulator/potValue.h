void readPotValue() {
  xVal = map(analogRead(XPOT), 0, 1023, -100, 100);
  yVal = map(analogRead(YPOT), 0, 1023, 0, 100);
  zVal = map(analogRead(ZPOT), 0, 1023, 0, 100);
}

void printPotValue() {
  Serial.print(xVal); Serial.print("\t");
  Serial.print(yVal); Serial.print("\t");
  Serial.print(zVal); Serial.print("\t");
  Serial.print("\t");
}
