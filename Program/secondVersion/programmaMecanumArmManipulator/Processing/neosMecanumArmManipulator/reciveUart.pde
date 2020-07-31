void setup_UART()
{
  //Comport List Selection                   
  commListbox = cp5.addListBox("portComList", 14, 110, 110, 240); // make a listbox and populate it with the available comm ports130

  commListbox.setCaptionLabel("PORT COM");
  commListbox.setColorBackground(grey_);
  commListbox.setColorLabel(dark_);
  commListbox.setColorForeground(transform_);
  commListbox.setColorActive(yellow_);

  for (int i=0; i<Serial.list ().length; i++) 
  {

    String pn = shortifyPortName(Serial.list()[i], 13);
    if (pn.length() >0 ) commListbox.addItem(pn, i); // addItem(name,value)
    commListMax = i;
  }

  commListbox.addItem("Close Comm", ++commListMax); // addItem(name,value)
  // text label for which comm port selected
  txtlblWhichcom = cp5.addTextlabel("txtlblWhichcom", "No Port Selected", 14, 95); // textlabel(name,text,x,y)115
  txtlblWhichcom
    .setColorValue(dark_)
    ;
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

    compassDeg=(int)data[1];
    angy=data[2];
    angx=data[3];
    degDyna0=(int)data[4];
    degDyna1=(int)data[5];
    degDyna2=(int)data[6];
    degDyna3=(int)data[7];
    degDyna4=(int)data[8];
    tempDyna0=(int)data[9];
    tempDyna1=(int)data[10];
    tempDyna2=(int)data[11];
    tempDyna3=(int)data[12];
    tempDyna4=(int)data[13];
    latitude=data[14];
    longitude=data[15];
    //cur0=data[16];
    //cur1=data[17];
    //cur2=data[18];
    //cur3=data[19];
    //cur4=data[20];
    //angy=data[21];
    //angx=data[22];
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
    serial = new Serial(this, portPos, 57600);
    serial.bufferUntil('\n');
    serial_conect=1;
  } else 
  {
    txtlblWhichcom
      .setValue("Not Connected")
      .setColorValue(dark_)
      ;
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
  //if (theControlEvent.isGroup()) if (theControlEvent.name()=="portComList") InitSerial(theControlEvent.group().value()); // initialize the serial port selected

  if (theControlEvent.isTab()) {
    //println("got an event from tab : "+theControlEvent.getTab().getName()+" with id "+theControlEvent.getTab().getId());
    statustab=theControlEvent.getTab().getId(); 
    //    println("statustab:"+statustab);
  }
}
