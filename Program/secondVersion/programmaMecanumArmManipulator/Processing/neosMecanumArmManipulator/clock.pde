void clock() {
  int ox = width/2; //set this variabel (ox,oy) to change clock position
  int oy = height / 15;
  int h = hour();
  int m = minute();
  int s = second();

  stroke(255); 
  fill(100); 
  //strokeWeight(1);
  //line(0, oy, width, oy);
  //line(ox, 0, ox, height);
  

  for (int i = 0; i < 60; i++) { //make dot inside clock    
    float xx = 35 * cos(radians(90/15.0 * i));
    float yy = 35 * sin(radians(90/15.0 * i));
    int sz = i % 5 == 0 ? 2 : 0; //a:b|size a for big dot, size b for small dot
    ellipse(ox + xx, oy - yy, sz, sz);
  }

  stroke(255); //make second hand
  int slen = 40;
  noFill();
  ellipse(ox, oy, slen*2, slen*2);
  float sdeg = 90 - s * 6.0;
  float sx = slen * cos(radians(sdeg));
  float sy = slen * sin(radians(sdeg));
  strokeWeight(0.5);
  line(ox, oy, ox + sx, oy - sy);

  int mlen = 35; //make minute hand
  float mdeg = (90 - m * 6.0) - 6.0*s/60.0;
  float mx = mlen * cos(radians(mdeg));
  float my = mlen * sin(radians(mdeg));
  strokeWeight(1);
  line(ox, oy, ox + mx, oy - my);


  int hlen = 20; //make hour hand
  float hdeg = (90 - h * 30) - 30.0*m/60.0;
  float hx = hlen * cos(radians(hdeg));
  float hy = hlen * sin(radians(hdeg));
  strokeWeight(2);
  line(ox, oy, ox + hx, oy - hy);

  //fill(255);
  //textFont(gamaSansLight12);
  //text(h+":"+m+":"+s, ox+5, oy-45);
}
