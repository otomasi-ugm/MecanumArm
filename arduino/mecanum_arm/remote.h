//                                       ROLL, PITCH, THROTTLE,  YAW, SELECTOR,  VRD,  SWD,  VRA
int remoteMapping[4][remoteChannel] = {{ 1085,  1895,     1050, 1070,     1913, 1913, 1913, 1082},
  /*                                 */{ 1910,  1100,     1950, 1920,     1083, 1083, 1083, 1909},
  /*                                 */{ -100,  -100,        0,  100,        0,   60,    0,   20},
  /*                                 */{  100,   100,      200, -100,        1,  185,    1,  144}
};

void mapRemoteData() {
  for (int i = 0; i < remoteChannel; i++) {
    int ch = pulseIn(remotePin[i], HIGH);
    remoteData[i] = map(ch, remoteMapping[0][i], remoteMapping[1][i], remoteMapping[2][i], remoteMapping[3][i]);
  }
}
