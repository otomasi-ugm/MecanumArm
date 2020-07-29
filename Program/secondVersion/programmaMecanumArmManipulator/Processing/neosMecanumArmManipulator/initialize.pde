void initialize() {
  cp5 = new ControlP5(this);
  background=loadImage("desainGUI1.png");
  compass=loadImage("compass.png");
  triagle=loadImage("triagle.png");
}

void initializeIpCapture() {
  cam = new IPCapture(this, "http://10.39.58.80:8081/", "", "");
  //cam = new IPCapture(this, "http://192.168.43.247:8081/", "", "");
  cam.start();
}

void initializeObj() {
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
}

void initializeMap() {
  //map1 = new UnfoldingMap(this);
  map1 = new UnfoldingMap(this, "Map 1", 320, 110, 640, 480);
  MapUtils.createDefaultEventDispatcher(this, map1);
  //map1.setTweening(true);
  //map1.setZoomRange(3, 19);
  map1.zoomAndPanTo(new Location(latitude, longitude), 10);

  compassMap = new CompassUI(this, map1);
  //compassMap = new CompassUI(this, map1.mapDisplay, compass, 700, 100, 1);
}
