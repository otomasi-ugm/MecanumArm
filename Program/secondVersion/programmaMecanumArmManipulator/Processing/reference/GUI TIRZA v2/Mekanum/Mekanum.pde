color yellow_ = color(200, 200, 20), green_ = color(46, 209, 2), red_ = color(120, 30, 30), blue_ = color (0, 102, 200);
color white_ = color(255, 255, 255), black_ = color(0, 0, 0), pink_ = color(255, 0, 255), abu_ = color(200, 200, 200);

PShape mecanumArm, arm0, arm1, arm2, arm3, arm4;
PImage background;
float rotX, rotY;
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
import controlP5.*;
ControlP5 cp5;

void setup() {
  size(1280, 720, OPENGL);
  background=loadImage("desainGUI.png");
  cp5 = new ControlP5(this);
  mecanumArm  = loadShape("mecanumArm1.obj");
  arm0        = loadShape("01.obj");
  arm1        = loadShape("11.obj");
  arm2        = loadShape("22.obj");
  arm3        = loadShape("31.obj");
  arm4        = loadShape("41.obj");

  mecanumArm.disableStyle();
  arm0.disableStyle();
  arm1.disableStyle();
  arm2.disableStyle();
  arm3.disableStyle();
  arm4.disableStyle();
  
    cp5.addSlider("sliderValue")
    .setPosition(10, 50)
    .setRange(-90, 90)
    ;
  cp5.addSlider("sliderValue1")
    .setPosition(10, 70)
    .setRange(-90, 90)
    ;
  cp5.addSlider("sliderValue2")
    .setPosition(10, 90)
    .setRange(-90, 90)
    ;
}

void draw() {

  background(background);

  obj();
}

void mouseDragged() {
  rotY -= (mouseX - pmouseX) * 0.01;
  rotX -= (mouseY - pmouseY) * 0.01;
  println("X="+rotX);
  println("Y="+rotY);
}
