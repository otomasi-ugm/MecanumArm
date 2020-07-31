import controlP5.*;
ControlP5 cp5; 

color yellow_ = color(200, 200, 20), green_ = color(46, 209, 2), red_ = color(120, 30, 30), blue_ = color (0, 102, 200);
color white_ = color(255, 255, 255), black_ = color(0, 0, 0), pink_ = color(255, 0, 255), grey_ = color(200, 200, 200);


PShape mecanumArm, arm0, arm1, arm2, arm3, arm4;

float rotX, rotY, rotZ;
float angle = 0;
Float angleDirection=1.0;
float speed = 0.005;

float angle1 = 0;
Float angleDirection1 =1.0;
float speed1 = 0.005;

float angle2 = 0;
Float angleDirection2 =1.0;
float speed2 = 0.005;

int sliderValue, sliderValue1, sliderValue2;

int servo0 = 300;
int servo1 = 124;
int servo2 = 224; //nilai sudut awal servo
int servo3 = 221;
int servo4 = 100;

int x,y,z;
