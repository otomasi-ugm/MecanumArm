int RGB[3] = {28,29,30};
int RGB2[3] = { 30,28,29};
int i, j;

void setup() {
  Serial.begin(115200);
  for (i = 0; i <= 3; i++) {
    pinMode(RGB[i], OUTPUT);
  }
}

void loop() {
  for (i = 0; i < 3; i++) {
    for (j = 0; j <= 255; j = j + 1) {
      analogWrite(RGB[i], j);
      analogWrite(RGB2[i], 255 - j);
      delay(25);
    }
  }
}
