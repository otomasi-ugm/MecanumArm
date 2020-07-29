void mouseDragged() {
  rotX -= (mouseX - pmouseX) * 0.01;
  rotY -= (mouseY - pmouseY) * 0.01;
  rotZ = sqrt(pow(rotX,2)+pow(rotY,2));
  println("X="+rotX);
  println("Y="+rotY);
}
