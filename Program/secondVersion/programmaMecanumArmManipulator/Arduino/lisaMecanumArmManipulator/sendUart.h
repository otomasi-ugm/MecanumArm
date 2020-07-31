int dyna2deg(float dyna) {
  int deg = map(dyna, 0, 1023, 0, 300);
  return deg;
}

void sendDataUart() {
  Serial5.write(START_BYTE); Serial5.print(DELIMITER);
  /*------------------Compass HMC5883L Data-------------------------*/
  Serial5.print(int(360 - headingDegrees)); Serial5.print(DELIMITER);
  /*-----------------Imu Data------------------------*/
  Serial5.print(compAngleY); Serial5.print(DELIMITER);
  Serial5.print(compAngleX); Serial5.print(DELIMITER);
  /*-----------------Dynamixel Data----------------------*/
  Serial5.print(dyna2deg(rDeg0)); Serial5.print(DELIMITER);
  Serial5.print(dyna2deg(rDeg1)); Serial5.print(DELIMITER);
  Serial5.print(dyna2deg(rDeg2)); Serial5.print(DELIMITER);
  Serial5.print(dyna2deg(rDeg3)); Serial5.print(DELIMITER);
  Serial5.print(dyna2deg(rDeg4)); Serial5.print(DELIMITER);
  Serial5.print(int(temp0)); Serial5.print(DELIMITER);
  Serial5.print(int(temp1)); Serial5.print(DELIMITER);
  Serial5.print(int(temp2)); Serial5.print(DELIMITER);
  Serial5.print(int(temp3)); Serial5.print(DELIMITER);
  Serial5.print(int(temp4)); Serial5.print(DELIMITER);
  /*-----------------GPS Data----------------------*/
  Serial5.print(latitude, 6); Serial5.print(DELIMITER);
  Serial5.print(longitude, 6); Serial5.print(DELIMITER);
  /*-----------------Buzzer Ping Data----------------------*/
  Serial5.print(int(buzzerLogic)); Serial5.print(DELIMITER);

  Serial5.write(END_BYTE); Serial5.println();
//  delay(10);
}
