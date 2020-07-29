//                                       ROLL, PITCH, THROTTLE,  YAW, SELECTOR,  VRD,  SWD,  VRA
int remoteMapping[4][remoteChannel] = {{ 1085,  1895,     1050, 1070,     1850, 1920, 1900, 1087},
  /*                                 */{ 1910,  1100,     1950, 1920,     1090, 1080, 1090, 1920},
  /*                                 */{ -100,  -100,        0,  100,        0,   60,    0,   20},
  /*                                 */{  100,   100,      200, -100,        1,  185,    1,  144}
};

void mapRemoteData() {
  unsigned int remotePWM[remoteChannel] = {
    /*                        */ ch1.getValue(), ch2.getValue(),
    /*                        */ ch3.getValue(), ch4.getValue(),
    /*                        */ ch5.getValue(), ch6.getValue(),
    /*                        */ ch7.getValue(), ch8.getValue()
  };
  for (int i = 0; i < remoteChannel; i++) {
    int ch = remotePWM[i];
    remoteData[i] = map(ch, remoteMapping[0][i], remoteMapping[1][i], remoteMapping[2][i], remoteMapping[3][i]);
    Serial.print(remoteData[i]); Serial.print("\t");
  }
    Serial.println();
}
