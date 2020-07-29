PShape mecanumArm, arm0, arm1, arm2, arm3, arm4;
float rotX, rotY;
float angle3 = 0;
Float angleDirection3=1.0;
float speed3 = 0.005;

float angle1 = 0;
Float angleDirection1 =1.0;
float speed1 = 0.005;

float angle2 = 0;
Float angleDirection2 =1.0;
float speed2 = 0.005;



void obj() {
  pushMatrix();
  smooth();
  lights();
  noStroke();

  translate(1130, 400);
  
  rotateY(radians(-compassDeg-30));
  //rotateX(4.52);
  //rotateY(-2.98);
  
  rotateX(1.5499997);
  rotateZ(-2.9899976);

  //  rotateX(rotX);
  //  rotateZ(rotY);

  scale(0.4);
  
  fill(light_);
  translate(0, 0, 0);
  shape(mecanumArm);

  pushMatrix();
  fill(light_);
  translate(0, 140, 37);
  scale(12);
  shape(arm0);


  fill(light_);
  translate(0, 3.2, 5);
  rotateZ(radians(-degDyna0-750));
  shape(arm1);


  fill(light_);
  translate(0, 0.3, 1.7);
  rotateX(-0.77);
  rotateX(radians(degDyna1+200));
  shape(arm2);


  fill(light_);
  translate(0, -7.5, 6.8);
  rotateX(1.77);
  rotateX(radians(degDyna2-130));
  shape(arm3);


  fill(light_);
  translate(0.8, 8.1, 5);
  rotateX(0.77);
  rotateY(3.14);
  rotateX(radians(-degDyna3+180));
  shape(arm4);
  popMatrix();

  angle3 += speed3 + angleDirection3;
  if ((angle3 > PI) || (angle3 < 0)) {
    angleDirection3 *= 0.05;
  } 

  angle1 += speed1 + angleDirection1;
  if ((angle1 > PI) || (angle1 < 0)) {
    angleDirection1 *= 1.0;
  } 

  angle2 -= speed2 + angleDirection2;
  if ((angle2 > PI/2) || (angle2 < 0)) {
    angleDirection2 *= -0.05;
  }

  popMatrix();
}
