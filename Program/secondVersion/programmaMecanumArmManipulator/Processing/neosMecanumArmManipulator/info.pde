float xInfo=10;
float yInfo=340;

void info() {
  fill(dark_);
  textFont(gamaSansLight30);
  //arm0
  text("Arm0", xInfo, yInfo);
  text(degDyna0+"\u2103", (xInfo+90), yInfo);
  text(tempDyna0+"°C", (xInfo+160), yInfo); 
  //arm1
  text("Arm1", xInfo, (yInfo+(1*45)));
  text(degDyna1+"°", (xInfo+90), (yInfo+(1*45)));
  text(tempDyna1+"°C", (xInfo+160), (yInfo+(1*45)));
  //arm2
  text("Arm2", xInfo, (yInfo+(2*45)));
  text(degDyna2+"°", (xInfo+90), (yInfo+(2*45)));
  text(tempDyna2+"°C", (xInfo+160), (yInfo+(2*45)));
  //arm3
  text("Arm3", xInfo, (yInfo+(3*45)));
  text(degDyna3+"°", (xInfo+90), (yInfo+(3*45)));
  text(tempDyna3+"°C", (xInfo+160), (yInfo+(3*45)));
  ////arm4
  text("Arm4", xInfo, (yInfo+(4*45)));
  text(degDyna4+"°", (xInfo+90), (yInfo+(4*45)));
  text(tempDyna4+"°C", (xInfo+160), (yInfo+(4*45))); 

  //compass
  text("Compass", xInfo, (yInfo+(5*45)));
  text(compassDeg+"°", (xInfo+160), (yInfo+(5*45)));

  //pitch
  text("Pitch", xInfo, (yInfo+(6*45)));
  text(int(-angy)+"°", (xInfo+160), (yInfo+(6*45)));

  //roll
  text("Roll", xInfo, (yInfo+(7*45)));
  text(int(angx)+"°", (xInfo+160), (yInfo+(7*45)));
  
  textFont(gamaSansLight20);
  text(nf(latitude,3,6), 740, 675);
  text(nf(longitude,3,6), 860, 675);
}
