float rad2deg(float radians) {
  float degrees = radians * (180 / PI);
  return degrees;
}

float* mecanumInverse(float vx, float vy) {
  matrix[0] = 0;
  matrix[1] = 0;
  matrix[2] = 0;
  matrix[3] = 0;
  float m_a[5][5] = {{ 1, -1, 0},
    /*             */{ 1, 1, 0},
    /*             */{ 1, 1, 0},
    /*             */{ 1, -1, 0}
  };
  float m_b[3] = {vx, vy, 0};
  for (int z = 0; z <= 3; z++) {
    for (int ax = 0; ax <= 2; ax++) {
      matrix[z] += m_a[z][ax] * m_b[ax];
    }
  }
  return matrix;
}

ARMData armInverse(float x, float y, float z) {
  ARMData returnValue;
  float xa = sqrt(pow(x, 2) + pow(z, 2));
  float alpha = rad2deg(atan(abs(z) / x));
  if (z < 0) {
    alpha -= 90;
  }
  else {
    alpha += 90;
  }
  returnValue.alpha = abs(alpha); // Alpha angle
  float c = sqrt(pow(xa, 2) + pow(ARM_L0 - y, 2));
  float b1 = rad2deg(atan(xa / (ARM_L0 - y)));
  float b2 = rad2deg(acos((pow(ARM_L1, 2) + pow(c, 2) - pow(ARM_L2, 2)) / (2 * ARM_L1 * c)));
  float beta = b1 + b2;
  returnValue.beta = beta; // Beta angle
  float gamma = rad2deg(acos((pow(ARM_L1, 2) + pow(ARM_L2, 2) - pow(c, 2)) / (2 * ARM_L1 * ARM_L2)));
  returnValue.gamma = gamma; // Gamma angle
  float delta;
  if (c > ARM_L1) {
    float d = ((beta + gamma) - 180.0) / 2.0;
    delta = 180.0 - (90.0 + d);
  }
  else {
    delta = 90;
  }
  returnValue.delta = delta; // Delta angle
  return returnValue;
}
