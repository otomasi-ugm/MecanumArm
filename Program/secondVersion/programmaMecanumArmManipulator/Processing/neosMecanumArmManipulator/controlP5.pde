void controlP5Setup() {

  cp5.addToggle("buzzerLogic") 
    .setLabel("Buzzer")
    .setColorLabel(100)
    .setPosition(342, 720-85)
    .setSize(30, 30)
    .setColorActive(yellow_)
    .setColorBackground(orange_)
    .setColorForeground(transform_)
    .setLabelVisible(false)
    ;

    cp5.addToggle("cameraGpsShow") 
    .setLabel("Camera GPS")
    .setColorLabel(100)
    .setPosition(427, 720-83)
    .setSize(245, 35)
    .setColorActive(yellow_)
    .setColorBackground(orange_)
    .setColorForeground(transform_)
    .setValue(false)
    .setMode(ControlP5.SWITCH)
    .setLabelVisible(false)
    ;
}
