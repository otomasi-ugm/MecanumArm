/*
 * This tab contain all function for check the robot
*/

void motorTest() {
  for (int i = 0; i < 4; i++) {
    digitalWrite(motorPin[i][1], HIGH);
    analogWrite(motorPin[i][0], 100);
    delay(2000);
    digitalWrite(motorPin[i][1], LOW);
    analogWrite(motorPin[i][0], 0);
  }
  delay(5000);
}

void moveRectangleTest(){
  move(1,0);  // Forward
  delay(2000);
  move(0,1);  // Right
  delay(2000);
  move(-1,0); // Backward
  delay(2000);
  move(0,-1); // Left
  delay(2000);
}
