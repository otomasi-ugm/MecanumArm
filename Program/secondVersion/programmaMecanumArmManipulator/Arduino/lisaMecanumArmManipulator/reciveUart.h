void readDataUart() {
  static unsigned char data[255] = {0};
  int i, msg;
  msg = Serial5.available();

  if(msg<0)serial_connect = 0;

  if (msg > 255) msg = 0; //protection buffer
  if (msg > 0) {
    serial_connect = 1;
    for (i = 0; i < msg; i++) {
      data[i] = Serial5.read();
    }
  }

  if (data[0] == 255 && data[2] == 254) //packet data
  {
//    serial_connect = 1;
    buzzerLogic = bool(data[1]); // degree data
  }

  Serial5.flush();
}
