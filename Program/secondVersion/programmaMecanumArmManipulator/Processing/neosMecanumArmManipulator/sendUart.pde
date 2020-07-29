void sendData()
{

  byte out[]=new byte[3];
  out[0]=byte(255);
  out[1]=byte(buzzerLogic);
  out[2]=byte(254);

  serial.write(out);
}


void Send_To_Arduino()
{

  if (serial_conect==1) 
  {  
    if (statustab==1) //TAB MAIN 
    {
      //indicator connected
      fill(yellow_);
      noStroke();
      ellipse(114, 100, 11, 11);
      noFill();
    }
    sendData();
  } else 
  {
    if (statustab==1) //TAB MAIN 
    {
      //indicator not connected
      fill(orange_);
      noStroke();
      ellipse(114, 100, 11, 11);
      noFill();
    }
  }
}
