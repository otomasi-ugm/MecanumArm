
/* Last Update : 13.05.2020 */

#include <DynamixelSerial.h>
#include <LiquidCrystal.h>
#include "Wire.h"
#include "Adafruit_Sensor.h"
#include "Adafruit_HMC5883_U.h" //Library for HMC5883L compass
Adafruit_HMC5883_Unified mag = Adafruit_HMC5883_Unified(12345);
#include "TinyGPS++.h"
#include "Kalman.h"
#include "PWM.hpp" //Library pulse using Interrupt
#include "global.h" 
#include "initialize.h"
#include "inverse.h"
#include "remote.h"
#include "compassRead.h"
#include "gpsRead.h"
#include "sendUart.h"
#include "reciveUart.h"
#include "readDynamixel.h"

void setup() {
  Serial.begin(115200);  //for usb
  Serial5.begin(57600);  //for telemetri 915Mhz data
  Serial4.begin(9600);   //for GPS data

  initializePwmInterrupt();
  initializeLCD();
  initializeCompass();
  initializeButton();
  initializeLedRgb();
  initializeBuzzer();
  initializeMotor();
  initializeDynamixel();
  setup_kalman();
  delay(1000);
  lcd.clear();
}

void loop() {
//  testValueRemote();
//  return 0;
  readDataUart();
  readGps();
  if(serial_connect==1){
    lcd.setCursor(0,1);
    lcd.print("GUI_CONNECTED___");
    readCompass();
    Read_Sensor_IMU();
    readDegrees();
    readTemperatures();
  }
  if(serial_connect==0){
    lcd.setCursor(0,1);
    lcd.print("GUI_NOTCONNECTED");
  }

  lcd.setCursor(0,0);lcd.print(gpsDay);
  lcd.setCursor(2,0);lcd.print(".");
  lcd.setCursor(3,0);lcd.print(gpsMonth);
  lcd.setCursor(5,0);lcd.print(".");
  lcd.setCursor(6,0);lcd.print(gpsYear);
  
  sendDataUart();
  digitalWrite(BUZZER,buzzerLogic);
  
  mapRemoteData();
//  return 0;


  if (remoteData[SELECTOR] == 1) { // ARM Control Activated
    controlArm();
    for (i = 0; i < 3; i++) {
      analogWrite(ledRgb[i], 0);
    }
    digitalWrite(28, HIGH);
    lcd.setCursor(12,0);lcd.print("Arm_");
    return;
  }

  lcd.setCursor(12,0);lcd.print("Meca");
  float yaw = (float)remoteData[YAW];
  if (abs(yaw) > 5) {
    yawRotate(yaw);
    for (i = 0; i < 3; i++) {
      analogWrite(ledRgb[i], 0);
    }
    digitalWrite(29, HIGH);
    return;
  }
  float x = (float)remoteData[PITCH] / 100.0;
  float y = (float)remoteData[ROLL] / 100.0;
  gain = remoteData[THROTTLE];
  move(x, y);
  for (i = 0; i < 3; i++) {
    analogWrite(ledRgb[i], 0);
  }
  analogWrite(29, 50);
  analogWrite(28, 200);
}

void controlArm() {
  float dX = (float)remoteData[PITCH] / 400.0;
  float dY = (float)remoteData[THROTTLE];
  float dZ = (float)remoteData[ROLL] / 400.0;
  coordX += dX;
  coordZ += dZ;
  coordY = constrain(dY, 30, 120);
  coordZ = constrain(coordZ, -88, 88);
  ARMData arm = armInverse(coordX, coordY, coordZ);
  arm.delta = remoteData[VRD];
  moveArm(arm);
  int vra = constrain(remoteData[VRA], 20, 144);
  if (torque) {
    Dynamixel.moveSpeed(4, deg2dyna(vra), 50);
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
  Dynamixel.moveSpeed(0, deg2dyna(alpha), 50);
  Dynamixel.moveSpeed(1, deg2dyna(beta),  50);
  Dynamixel.moveSpeed(2, deg2dyna(gamma), 50);
  Dynamixel.moveSpeed(3, deg2dyna(delta), 50);
}

int deg2dyna(float deg) {
  int dyna = map(deg, 0, 300, 0, 1023);
  return dyna;
}
