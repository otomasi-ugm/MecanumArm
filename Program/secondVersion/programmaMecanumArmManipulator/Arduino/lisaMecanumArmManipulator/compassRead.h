void readCompass() {
  sensors_event_t event;
  mag.getEvent(&event);
  heading = atan2(event.magnetic.y, event.magnetic.x);
  heading += declinationAngle;
  if (heading < 0)
    heading += 2 * PI;
  if (heading > 2 * PI)
    heading -= 2 * PI;
  headingDegrees = heading * 180 / M_PI;
  //  lcd.setCursor(0, 1);
  //  lcd.print(360 - headingDegrees);
  //  Serial.println(360 - headingDegrees);
  //  delay(10);
  //  lcd.clear();
}
