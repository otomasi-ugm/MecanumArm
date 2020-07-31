#include <DynamixelSerial.h>
#include "global.h"
#include "initialize.h"
#include "inverse.h"
#include "remote.h"

void setup() {
  Serial.begin(115200);
  initializeMotor();
  initializeRemote();
  initializeDynamixel();
}

void loop() {
//  testValueRemote();
//  return 0;
  mapRemoteData();
//  return 0;
  if (remoteData[SELECTOR] == 1) { // ARM Control Activated
    controlArm();
    return;
  }
  float yaw = (float)remoteData[YAW];
  if (abs(yaw) > 5) {
    yawRotate(yaw);
    return;
  }
  float x = (float)remoteData[PITCH] / 100.0;
  float y = (float)remoteData[ROLL] / 100.0;
  gain = remoteData[THROTTLE];
  move(x, y);

}

void controlArm() {
  float dX = (float)remoteData[PITCH] / 25.0;
  float dY = (float)remoteData[THROTTLE];
  float dZ = (float)remoteData[ROLL] / 25.0;
  coordX += dX;
  coordZ += dZ;
  coordY = constrain(dY, 30, 120);
  coordZ = constrain(coordZ, -88, 88);
  ARMData arm = armInverse(coordX, coordY, coordZ);
  arm.delta = remoteData[VRD];
  moveArm(arm);
  int vra = constrain(remoteData[VRA], 20, 144);
  if (torque) {
    Dynamixel.moveSpeed(4, deg2dyna(vra), 100);
  }
}

void move(float x, float y) {
  outPWM = mecanumInverse(x, y);
  for (i = 0; i < 4; i++) {
    int pwm = (*(outPWM + i)) * gain;
    motor(i, constrain(pwm, -255, 255));
  }
}

void motor(int id, int speed) {
  if (speed >= 0) {
    analogWrite(motorPin[id][0], speed);
    digitalWrite(motorPin[id][1], 0);
  } else {
    speed *= -1;
    analogWrite(motorPin[id][0], 255 - speed);
    digitalWrite(motorPin[id][1], 1);
  }
}

void yawRotate(float yaw) {
  float yawSpeed = (yaw / 100.0) * gain;
  motor(0, yawSpeed);
  motor(2, yawSpeed);
  motor(1, -1 * yawSpeed);
  motor(3, -1 * yawSpeed);
}

void moveArm(ARMData arm) {
  if (remoteData[SWD] != torque) {
    torque = (bool)remoteData[SWD];
    for (int i = 0; i < 5; i++) {
      Dynamixel.torqueStatus(i, torque);
    }
  }
  if (!torque) {
    return;
  }

  float alpha = map(arm.alpha, 180, 0, 60, 238);
  float beta = map(arm.beta, 180, 0, 145, 325);
  float gamma = map(arm.gamma, 180, 0, 145, 325);
  float delta = map(arm.delta, 180, 0, 57, 240);
  delta = constrain(delta, 60, 185);
  Dynamixel.moveSpeed(0, deg2dyna(alpha), 100);
  Dynamixel.moveSpeed(1, deg2dyna(beta), 100);
  Dynamixel.moveSpeed(2, deg2dyna(gamma), 100);
  Dynamixel.moveSpeed(3, deg2dyna(delta), 100);
}

int deg2dyna(float deg) {
  int dyna = map(deg, 0, 300, 0, 1023);
  return dyna;
}
