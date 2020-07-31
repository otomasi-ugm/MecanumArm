void initializeDynamixel() {
  Dynamixel.setSerial(&Serial1); // &Serial1 - Arduino Mega
  Dynamixel.begin(1000000, 13); // Initialize the servo at 1 Mbps and Pin Control 13
  delay(1000);
  for (int i = 0; i < 5; i++) {
    Dynamixel.torqueStatus(i, OFF);
  }
}

void initializeRemote() {
  for (int i = 0; i < remoteChannel; i++) {
    pinMode(remotePin[i], INPUT);
  }
}
