/* Last Update : 18.05.2020 */

void setup() {
  smooth();
  initialize();
  initializeObj();
  initializeIpCapture();
  initializeMap();
  size(1280, 720, P3D); //window size in HD
  font();
  controlP5Setup();
  setup_UART();
}

void draw() {
  background(background); //active design background

  if (!cameraGpsShow) {
    loadMap();
  }

  if (cameraGpsShow) {//logic for showing the cammera
    ipCammeraRunning();
  }

  clock(); //activated clock in above the middle
  //mouse(); //print the coordinate of mouse
  
  info();
  compass();
  imu();

  obj();

  Send_To_Arduino();
}
