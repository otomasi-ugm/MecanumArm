#include <DynamixelSerial.h>
#include "global.h"
#include "initialize.h"
#include "inverse.h"
#include "remote.h"

void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  Serial5.begin(57600);
  initializeDynamixel();
  initializeRemote();
}

void loop() {
  // put your main code here, to run repeatedly:
  mapRemoteData();
  if (remoteData[SELECTOR] == 1) { // ARM Control Activated
    controlArm();
    return;
  }
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
  arm.Q4 = remoteData[VRD];
  moveArm(arm);
  int vra = constrain(remoteData[VRA], 20, 144);
  if (torque) {
    Dynamixel.moveSpeed(4, deg2dyna(vra), 100);
  }
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

  float Q1 = map(arm.Q1, 180, 0, 60, 238);
  float Q2 = map(arm.Q2, 180, 0, 145, 325);
  float Q3 = map(arm.Q3, 180, 0, 145, 325);
  float Q4 = map(arm.Q4, 180, 0, 57, 240);
  Q4 = constrain(Q4, 60, 185);
  Dynamixel.moveSpeed(0, deg2dyna(Q1), 100);
  Dynamixel.moveSpeed(1, deg2dyna(Q2), 100);
  Dynamixel.moveSpeed(2, deg2dyna(Q3), 100);
  Dynamixel.moveSpeed(3, deg2dyna(Q4), 100);
}

int deg2dyna(float deg) {
  int dyna = map(deg, 0, 300, 0, 1023);
  return dyna;
}
