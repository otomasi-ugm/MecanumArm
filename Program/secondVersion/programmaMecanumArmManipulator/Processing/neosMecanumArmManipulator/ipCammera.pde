void ipCammeraRunning() {
  //if (cam.isAvailable()) {
  pushMatrix();
  //translate(320,240);
  cam.read();
  image(cam, 320, 110);
  popMatrix();
  //  }
}
