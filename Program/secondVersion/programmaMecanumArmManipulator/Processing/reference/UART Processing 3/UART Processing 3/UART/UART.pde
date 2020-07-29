
int posxcom = (width/2)+540;
int posycom = 300;

void setup_UART()
{ 
  //Comport List Selection                   
  commListbox = cp5.addListBox("portComList", posxcom+5, posycom+85, 150, 240); // make a listbox and populate it with the available comm ports

  commListbox.setCaptionLabel("PORT COM");
  commListbox.setColorBackground(red_);
  commListbox.close();

  for (int i=0; i<Serial.list ().length; i++) 
  {

    String pn = shortifyPortName(Serial.list()[i], 13);
    if (pn.length() >0 ) commListbox.addItem(pn, i); // addItem(name,value)
    commListMax = i;
  }

  commListbox.addItem("Close Comm", ++commListMax); // addItem(name,value)
  // text label for which comm port selected
  txtlblWhichcom = cp5.addTextlabel("txtlblWhichcom", "No Port Selected", posxcom+5, posycom+62); // textlabel(name,text,x,y)
}

void Tuning_PID_param()
{

  //   byte out[]=new byte[6];
  //   out[0]=byte(255);
  //   out[1]=byte(SP);
  //   out[2]=byte(KP);
  //   out[3]=byte(KI);
  //   out[4]=byte(KD);
  //   out[5]=byte(254);
  //   serial.write(out);

  //  serial.write("k "+KP+" "+KI+" "+KD+" "+SP);
  //  println("k "+KP+" "+KI+" "+KD+" "+SP);
}


void Send_To_Arduino()
{

  if (serial_conect==1) 
  {  

    //indicator connect
    fill(0, 255, 0);
    ellipse(posxcom+130, posycom+67, 10, 10);
    noFill();
    //
    //    if (TuningPID==true) {
    //      Tuning_PID_param();
    //    }
  } else 
  {//indicator no connect
    fill(128, 0, 0);
    ellipse(posxcom+130, posycom+67, 10, 10);
    noFill();
  }
}


void serialEvent (Serial usbPort) 
{
  try {
    String usbString = usbPort.readStringUntil ('\n');

    if (usbString != null) 
    {
      usbString = trim(usbString);
      println(usbString); //--> for debuging
    }

    float data[] = float(split(usbString, ','));
    //for (int sensorNum = 1; sensorNum < data.length; sensorNum++) { println(sensorNum + " " + data[sensorNum]);  } //--> for debuging

    roll=data[2];
    pitch=data[3];
    yaw=data[1];
  }
  catch(RuntimeException e)
  {
    println("Serial event is not null");
  }
}


//initialize the serial port selected in the listBox
void InitSerial(float portValue) 
{
  if (portValue < commListMax) {
    String portPos = Serial.list()[int(portValue)];
    txtlblWhichcom.setValue("Connected = " + shortifyPortName(portPos, 8));
    serial = new Serial(this, portPos, 115200);
    serial.bufferUntil('\n');
    serial_conect=1;
  } else 
  {
    txtlblWhichcom.setValue("Not Connected");
    serial.clear();
    serial.stop();
    serial_conect=0;
  }
}

void controlEvent(ControlEvent theControlEvent)
{
  if (theControlEvent.isController()) {
    if (theControlEvent.getController().getName()=="portComList") {
      println("smile");
      InitSerial(theControlEvent.getController().getValue());
    }
  }
}
