void compass(){
  pushMatrix();
  imageMode(CENTER);
  translate(1215,150);
  rotate(radians(compassDeg));
  image(compass,0,0);
  popMatrix();
  imageMode(CORNER);
}



void IMU_Graph()
{
  // ---------------------------------------------------------------------------------------------
  // Fly Level Control Instruments
  // ---------------------------------------------------------------------------------------------
  // info angles
  fill(dark_);
  textFont(font12);
  text((int)-angy + "°", xLevelObj+38, yLevelObj+78); //pitch
  text((int)angx + "°", xLevelObj-62, yLevelObj+78); //roll

  pushMatrix();
  translate(xLevelObj-34, yLevelObj+112);
  fill(50, 50, 50);
  noStroke();
  ellipse(0, 0, 66, 66);
  rotate(degAngX);
  fill(255, 255, 127);
  textFont(font12);
  text("ROLL", -13, 15);
  strokeWeight(1.5);
  stroke(127, 127, 127);
  line(-30, 1, 30, 1);
  stroke(255, 255, 255);
  line(-30, 0, +30, 0);
  line(0, 0, 0, -10);
  popMatrix();

  pushMatrix();
  translate(xLevelObj+34, yLevelObj+112);
  fill(50, 50, 50);
  noStroke();
  ellipse(0, 0, 66, 66);
  rotate(degAngY);
  fill(255, 255, 127);
  textFont(font12);
  text("PITCH", -18, 15);
  strokeWeight(1.5);
  stroke(127, 127, 127);
  line(-30, 1, 30, 1);
  stroke(255, 255, 255);
  line(-30, 0, 30, 0);
  line(30, 0, 30-size/6, size/6);
  line(+30, 0, 30-size/6, -size/6);  
  popMatrix();
}

void Level_Graph()
{
  float horizonInstrSize;
  float angyLevelControl;

  // ---------------------------------------------------------------------------------------------
  // Magnetron Combi Fly Level Control
  // ---------------------------------------------------------------------------------------------
  horizonInstrSize=68;
  angyLevelControl=((angy<-horizonInstrSize) ? -horizonInstrSize : (angy>horizonInstrSize) ? horizonInstrSize : angy);
  pushMatrix();
  translate(xLevelObj, yLevelObj);
  noStroke();
  // instrument background
  fill(50, 50, 50);
  ellipse(0, 0, 150, 150);
  // full instrument
  rotate(degAngX);
  rectMode(CORNER);
  // outer border
  strokeWeight(1);
  stroke(90, 90, 90);
  //border ext
  arc(0, 0, 140, 140, 0, TWO_PI);
  stroke(190, 190, 190);
  //border int
  arc(0, 0, 138, 138, 0, TWO_PI);
  // inner quadrant
  strokeWeight(1);
  stroke(255, 255, 255);
  fill(124, 73, 31);
  //earth
  float angle = acos(angyLevelControl/horizonInstrSize);
  arc(0, 0, 136, 136, 0, TWO_PI);
  fill(38, 139, 224); 
  //sky 
  arc(0, 0, 136, 136, HALF_PI-angle+PI, HALF_PI+angle+PI);
  float x = sin(angle)*horizonInstrSize;
  if (angy>0) 
    fill(124, 73, 31);
  noStroke();   
  triangle(0, 0, x, -angyLevelControl, -x, -angyLevelControl);
  // inner lines
  strokeWeight(1);
  for (i=0; i<8; i++) {
    j=i*15;
    if (angy<=(35-j) && angy>=(-65-j)) {
      stroke(255, 255, 255); 
      line(-30, -15-j-angy, 30, -15-j-angy); // up line
      fill(255, 255, 255);
      textFont(font9);
      text("+" + (i+1) + "0", 34, -12-j-angy); //  up value
      text("+" + (i+1) + "0", -48, -12-j-angy); //  up value
    }
    if (angy<=(42-j) && angy>=(-58-j)) {
      stroke(167, 167, 167); 
      line(-20, -7-j-angy, 20, -7-j-angy); // up semi-line
    }
    if (angy<=(65+j) && angy>=(-35+j)) {
      stroke(255, 255, 255); 
      line(-30, 15+j-angy, 30, 15+j-angy); // down line
      fill(255, 255, 255);
      textFont(font9);
      text("-" + (i+1) + "0", 34, 17+j-angy); //  down value
      text("-" + (i+1) + "0", -48, 17+j-angy); //  down value
    }
    if (angy<=(58+j) && angy>=(-42+j)) {
      stroke(127, 127, 127); 
      line(-20, 7+j-angy, 20, 7+j-angy); // down semi-line
    }
  }
  strokeWeight(2);
  stroke(255, 255, 255);
  if (angy<=50 && angy>=-50) {
    line(-40, -angy, 40, -angy); //center line
    fill(255, 255, 255);
    textFont(font9);
    text("0", 34, 4-angy); // center
    text("0", -39, 4-angy); // center
  }

  // lateral arrows
  strokeWeight(1);
  // down fixed triangle
  stroke(60, 60, 60);
  fill(180, 180, 180, 255);

  triangle(-horizonInstrSize, -8, -horizonInstrSize, 8, -55, 0);
  triangle(horizonInstrSize, -8, horizonInstrSize, 8, 55, 0);

  // center
  strokeWeight(1);
  stroke(255, 0, 0);
  line(-20, 0, -5, 0); 
  line(-5, 0, -5, 5);
  line(5, 0, 20, 0); 
  line(5, 0, 5, 5);
  line(0, -5, 0, 5);
  popMatrix();
}

void imu(){
  pushMatrix();
  scale(0.7);
  degAngX=radians(angx);
  degAngY=radians(angy);
  IMU_Graph();
  Level_Graph();
  popMatrix();
}
