
void setup() {
  size(1280, 720, OPENGL);
  cp5 = new ControlP5(this);

  arm0 = loadShape("01.obj");
  arm1 = loadShape("11.obj");
  arm2 = loadShape("22.obj");
  arm3 = loadShape("31.obj");
  arm4 = loadShape("41.obj");
  arm0.disableStyle();
  arm1.disableStyle();
  arm2.disableStyle();
  arm3.disableStyle();
  arm4.disableStyle();

  cp5.addSlider("x")
    .setPosition(10, 50)
    .setRange(-360, 360)
    .setSize(400,20)
    ;
  cp5.addSlider("y")
    .setPosition(10, 70)
    .setRange(-360, 360)
    .setSize(400,20)
    ;
  cp5.addSlider("z")
    .setPosition(10, 90)
    .setRange(-360, 360)
    .setSize(400,20)
    ;
}

void draw() {
  background(169, 194, 206, 210);
  objTopView();
  objSideView();
}
