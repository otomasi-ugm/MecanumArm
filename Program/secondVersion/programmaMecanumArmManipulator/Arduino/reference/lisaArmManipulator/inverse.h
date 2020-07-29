float rad2deg(float radians) {
  float degrees = radians * (180 / PI);
  return degrees;
}

ARMData armInverse(float x, float y, float z){
    ARMData returnValue; 
    float Q1= rad2deg(atan(y/x)); //1
    returnValue.Q1=Q1;
    float r1= sqrt(pow(x,2)+(y,2)); //2
    float a4=100;
    float r4=r1-a4; //3
    float a1=80;
    float a2=100;
    float a3=100;
    float r2= z-a1; //4
    float q1= rad2deg(atan(r2/r4)); //5
    float r3= sqrt(pow(r4,2)+pow(r2,2)); //6
    float q2= rad2deg(acos((pow(r3,2)+pow(a2,2)-pow(a3,2))/(2*r3*a2))); //7
    float Q2= q1+q2; //8
    returnValue.Q2=Q2;
    float Q3= rad2deg(acos((pow(a2,2)+pow(a3,2)-pow(r3,2))/(2*a2*a3))); //9
    returnValue.Q3=Q3;
    float Q4= 360-Q2-Q3; //10
    returnValue.Q4=Q4;
    return returnValue;
}
