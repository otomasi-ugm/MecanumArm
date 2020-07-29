void checkNegativeValue(float q1, float q2, float q3, float q4) {
  if (q1 < 0) {
    digitalWrite(LED1, 1);
  }
  else if (q2 < 0) {
    digitalWrite(LED2, 1);
  }
  else if (q3 < 0) {
    digitalWrite(LED3, 1);
  }
  else if (q4 < 0) {
    digitalWrite(LED4, 1);
  }
}

void refreshLED() {
  for (i = 0; i < 5; i++) {
    digitalWrite(LED[i], 0);
  }
}
