void initializeLCD() {
  lcd.begin(16, 2);
  lcd.setCursor(0, 0);
  lcd.print("___MecanumArm___");
  lcd.setCursor(0, 1);
  lcd.print("__Manipulator___");
}

void initializeMotor() {
  for (int i = 0; i < 4; i++) {
    pinMode(motorPin[i][0], OUTPUT);
    pinMode(motorPin[i][1], OUTPUT);
  }
}

void initializePwmInterrupt() {
  ch1.begin(true);
  ch2.begin(true);
  ch3.begin(true);
  ch4.begin(true);
  ch5.begin(true);
  ch6.begin(true);
  ch7.begin(true);
  ch8.begin(true);
}

void initializeDynamixel() {
  Dynamixel.setSerial(&Serial1); // &Serial1 - Arduino Mega
  Dynamixel.begin(1000000, 13); // Initialize the servo at 1 Mbps and Pin Control 13
  delay(1000);
  for (int i = 0; i < 5; i++) {
    Dynamixel.torqueStatus(i, OFF);
  }
}

void initializeButton() {
  for (i = 0; i < 4; i++) {
    pinMode(button[i], INPUT);
    digitalWrite(button[i], HIGH);
  }
}

void initializeLedRgb() {
  for (i = 0; i <= 3; i++) {
    pinMode(ledRgb[i], OUTPUT);
  }
}

void initializeCompass(){
  mag.begin();
}

void initializeBuzzer(){
  pinMode(BUZZER,OUTPUT);
}
