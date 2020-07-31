void objTopView() {
  pushMatrix();
  smooth();
  lights();
  noStroke();


  translate(width/2, (height/2)+100);



  //rotateX(-3.1299975);
  rotateZ(3.14);


  //rotateZ(rotY);
  //rotateX(rotX);
  //rotateZ(rotY);

  scale(0.8);

   pushMatrix();
  fill(white_);
  translate(0, 140, 37);
  scale(12);
  shape(arm0);

  fill(white_);
  translate(0, 3.2, 5);
  rotateZ(radians(-servo0-750));
  shape(arm1);

  fill(white_);
  translate(0, 0.3, 1.7);
  rotateX(-0.77);
  rotateX(radians(servo1+200));
  shape(arm2);

  fill(white_);
  translate(0, -7.5, 6.8);
  rotateX(1.77);
  rotateX(radians(servo2-130));
  shape(arm3);

  fill(white_);
  translate(0.8, 8.1, 5);
  rotateX(0.77);
  rotateY(3.14);
  rotateX(radians(-servo3+180));
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

void objSideView() {
  pushMatrix();
  smooth();
  lights();
  noStroke();

  translate(width-200, (height/2+90));

//X=1.4400005
//Y=0.84999967

  rotateX(radians(97));
  rotateY(radians(0));
  rotateZ(radians(114));
  
  //rotateX(rotX);
  //rotateZ(rotY);
  
  scale(0.7);

  pushMatrix();
  fill(white_);
  translate(0, 140, 37);
  scale(12);
  shape(arm0);

  fill(black_);
  translate(0, 3.2, 5);
  rotateZ(radians(-servo0-750));
  shape(arm1);


  fill(white_);
  translate(0, 0.3, 1.7);
  rotateX(-0.77);
  rotateX(radians(servo1+200));
  shape(arm2);

  fill(white_);
  translate(0, -7.5, 6.8);
  rotateX(1.77);
  rotateX(radians(servo2-130));
  shape(arm3);

  fill(white_);
  translate(0.8, 8.1, 5);
  rotateX(0.77);
  rotateY(3.14);
  rotateX(radians(-servo3+180));
  shape(arm4);



  popMatrix();

  popMatrix();
}
