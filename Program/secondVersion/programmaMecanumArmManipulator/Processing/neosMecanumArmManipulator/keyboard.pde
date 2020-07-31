void keyPressed() {
  if (key == ' ') {
    if (cam.isAlive()) cam.stop();
    else cam.start();
  }
  if (key == 'w')
    map1.zoomIn();
  if (key == 's')
    map1.zoomOut();
  if (key == 'd')
    map1.rotate(0.1f);
  if (key == 'a')
    map1.rotate(-0.1f);
}
