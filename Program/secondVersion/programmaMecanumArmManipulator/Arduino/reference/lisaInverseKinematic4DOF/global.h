const int remoteChannel = 8;
int remoteValue[remoteChannel];
int remotePin[remoteChannel] = {14, 15, 16, 17, 20, 21, 22, 23};
int remoteData[remoteChannel];
#define ROLL 0
#define PITCH 1
#define THROTTLE 2
#define YAW 3
#define SELECTOR 4
#define VRD 5
#define SWD 6
#define VRA 7

const float ARM_L0 = 150;
const float ARM_L1 = 100;
const float ARM_L2 = 100;

struct ARMData {
  float Q1;
  float Q2;
  float Q3;
  float Q4;
};

float coordX = 50.0;
float coordY = 50.0;
float coordZ = 0.0;
bool torque = false;

int i, j, k; // For iteration
