/*------------------Serial Library-------------------------*/
import processing.serial.Serial;
Serial serial;
/*------------------ControlP5 Library-------------------------*/
import controlP5.*;
ControlP5 cp5;
/*------------------IpCapture Library-------------------------*/
import ipcapture.*;
IPCapture cam;
/*------------------Unfolding Library-------------------------*/
import de.fhpotsdam.unfolding.mapdisplay.*;
import de.fhpotsdam.unfolding.utils.*;
import de.fhpotsdam.unfolding.marker.*;
import de.fhpotsdam.unfolding.tiles.*;
import de.fhpotsdam.unfolding.interactions.*;
import de.fhpotsdam.unfolding.ui.*;
import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.core.*;
import de.fhpotsdam.unfolding.mapdisplay.shaders.*;
import de.fhpotsdam.unfolding.data.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.texture.*;
import de.fhpotsdam.unfolding.events.*;
import de.fhpotsdam.utils.*;
import de.fhpotsdam.unfolding.providers.*;

CompassUI compassMap;

PImage background;
PImage compass;
PImage triagle;


/*------------------UART Variable-------------------------*/
int serial_conect = 0;
int commListMax;
int[] data = null;
Textlabel txtlblWhichcom; 
ListBox commListbox;
ListBox portlist;
// coded by Eberhard Rensch
// Truncates a long port name for better (readable) display in the GUI
String shortifyPortName(String portName, int maxlen)  
{
  String shortName = portName;
  if (shortName.startsWith("/dev/")) shortName = shortName.substring(5);  
  if (shortName.startsWith("tty.")) shortName = shortName.substring(4); // get rid off leading tty. part of device name
  if (portName.length()>maxlen) shortName = shortName.substring(0, (maxlen-1)/2) + "~" +shortName.substring(shortName.length()-(maxlen-(maxlen-1)/2));
  if (shortName.startsWith("cu.")) shortName = "";// only collect the corresponding tty. devices
  return shortName;
}

int statustab=1;

/*------------Toggle Button ControlP5 Logic------------*/
boolean buzzerLogic=false;
boolean cameraGpsShow=false;

/*------------Degree of Dynamixel------------*/
int degDyna0,degDyna1,degDyna2,degDyna3,degDyna4;
int tempDyna0,tempDyna1,tempDyna2,tempDyna3,tempDyna4;

/*------------IMU MPU6050 Variable------------*/
int i, j;

int xLevelObj   = 1630; //mouseX x 10/7     
int yLevelObj   = 821; //mouseY x 10/7  


//angx-->Roll
//angy-->Pitch
float degAngX,degAngY, h, head, angx, angy, angCalc;

float angx_no_filter, angy_no_filter;
float gyro_x, gyro_y;
int GPS_directionToHome=0;

float size=0.5;

int X_robot=415; 
int Y_robot=360;

int Time=0;
float angle_step=0;
float exp_step=0;

float X_pos, Y_pos, headingerror;

/*------------Compass HMC5883L Variable------------*/
int compassDeg;

/*------------GPS Variable------------*/
float latitude,longitude;
//float latitude=-7.765687;
//float longitude=110.374886;
UnfoldingMap map1;
UnfoldingMap map2;
UnfoldingMap map3;

SimplePointMarker mapMarker;
