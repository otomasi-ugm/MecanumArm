void initializeMotor() {
  for (int i = 0; i < 4; i++) {
    pinMode(motorPin[i][0], OUTPUT);
    pinMode(motorPin[i][1], OUTPUT);
  }
}
