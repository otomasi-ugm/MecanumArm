void readGps() {
  while (Serial4.available() > 0) {
    if (gps.encode(Serial4.read())) {
      if (gps.location.isValid()) {
        latitude = gps.location.lat(), 6;
        longitude = gps.location.lng(), 6;
      }
      else {
        latitude = 0;
        longitude = 0;
      }
      if (gps.date.isValid()) {
        gpsMonth = gps.date.month();
        gpsDay = gps.date.day();
        gpsYear = gps.date.year();
      }
      else {
        gpsMonth = 0;
        gpsDay = 0;
        gpsYear = 0;
      }
    }
  }
}
