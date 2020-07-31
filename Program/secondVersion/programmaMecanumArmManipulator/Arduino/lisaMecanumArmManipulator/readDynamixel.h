void readDegrees() {
  rDeg0 = Dynamixel.readPosition(0);
  rDeg1 = Dynamixel.readPosition(1);
  rDeg2 = Dynamixel.readPosition(2);
  rDeg3 = Dynamixel.readPosition(3);
  rDeg4 = Dynamixel.readPosition(4);
}

void readTemperatures(){
  temp0 = Dynamixel.readTemperature(0);
  temp1 = Dynamixel.readTemperature(1);
  temp2 = Dynamixel.readTemperature(2);
  temp3 = Dynamixel.readTemperature(3);
  temp4 = Dynamixel.readTemperature(4);
}

void readVoltages(){
  vDyna0 = Dynamixel.readVoltage(0);
  vDyna1 = Dynamixel.readVoltage(1);
  vDyna2 = Dynamixel.readVoltage(2);
  vDyna3 = Dynamixel.readVoltage(3);
  vDyna4 = Dynamixel.readVoltage(4);
}

void readCurrents(){
  iDyna0 = Dynamixel.readLoad(0);
  iDyna1 = Dynamixel.readLoad(1);
  iDyna2 = Dynamixel.readLoad(2);
  iDyna3 = Dynamixel.readLoad(3);
  iDyna4 = Dynamixel.readLoad(4);
}
