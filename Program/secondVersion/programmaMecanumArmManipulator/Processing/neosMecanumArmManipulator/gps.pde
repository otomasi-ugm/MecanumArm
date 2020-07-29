void loadMap() {
  //map1.zoomAndPanTo(10, new Location(latitude,longitude));
  //MapUtils.createDefaultEventDispatcher(this, map1);

  map1.draw();
  noStroke();
  fill(215, 0, 0, 100);
  //Location loc = new Location(-7.76568, 110.374886);
  Location loc = new Location(latitude, longitude);
  mapMarker = new SimplePointMarker(loc);
  ScreenPosition mapPos = mapMarker.getScreenPosition(map1);
  //ellipse(mapPos.x, mapPos.y, 20, 20);

  //pushMatrix();
  //pushMatrix();
  //rotate(radians(compassDeg));
  //rectMode(CENTER);
  //triangle(mapPos.x, mapPos.y, mapPos.x+25, mapPos.y, mapPos.x+12, mapPos.y-40);
  //popMatrix();
  //popMatrix();
  
  pushMatrix();
  imageMode(CENTER);
  translate(mapPos.x,mapPos.y);
  rotate(radians(compassDeg));
  image(triagle,0,0);
  popMatrix();
  imageMode(CORNER);

  pushMatrix();
  pushMatrix();

  translate(960, 60);
  compassMap.draw();

  popMatrix();
  popMatrix();
}
