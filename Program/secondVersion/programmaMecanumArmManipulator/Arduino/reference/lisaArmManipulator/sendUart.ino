void sendDataUart(float Q1,float Q2,float Q3,float Q4) {
  Serial.write(START_BYTE); Serial.print(DELIMITER);
  /*--------------Degree data-----------------*/
  Serial.print(Q1); Serial.print(DELIMITER);
  Serial.print(Q2); Serial.print(DELIMITER);
  Serial.print(Q3); Serial.print(DELIMITER);
  Serial.print(Q4); Serial.print(DELIMITER);
  
  Serial.write(END_BYTE); Serial.println();
  delay(10);
}
