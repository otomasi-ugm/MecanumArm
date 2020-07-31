void obj() {
  pushMatrix();
  smooth();
  lights();
  noStroke();


  translate(1130, 400);

//  rotateX(4.52);
//  rotateY(-2.98);

  rotateX(1.5499997);
  rotateZ(-2.9899976);
  
//X=4.520005
//Y=-2.9899976

//X=1.5499997
//Y=-2.5699987
  
  //rotateX(rotX);
  //rotateZ(rotY);

  scale(0.4);

  fill(white_);
  translate(0, 0, 0);
  shape(mecanumArm);


  pushMatrix();
  fill(white_);
  translate(0, 140, 37);
  scale(12);
  shape(arm0);


  fill(white_);
  translate(0, 3.2, 5);
  rotateZ(0);
  shape(arm1);


  fill(white_);
  translate(0, 0.3, 1.7);
  rotateX(-0.77);
  rotateX(0);
  shape(arm2);


  fill(white_);
  translate(0, -7.5, 6.8);
  rotateX(1.77);
  rotateX(0);
  shape(arm3);


  fill(white_);
  translate(-0.8, 8.1, 5);
  rotateX(0.77);
  rotateX(angle);
  shape(arm4);


  popMatrix();


  angle += speed + angleDirection;
  if ((angle > PI) || (angle < 0)) {
    angleDirection *= 0.05;
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
