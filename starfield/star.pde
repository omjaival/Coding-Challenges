class Star {
  float x;
  float y;
  float z;
  float pz; // Previous z position for warp-speed motion lines

  Star() {
    x = random(-width/2, width/2);
    y = random(-height/2, height/2);
    z = random(width);
    pz = z;
  }

  void update() {
    z = z - speed;
    if (z < 1) {
      z = width;
      x = random(-width/2, width/2);
      y = random(-height/2, height/2);
      pz = z;
    }
  }

  void show() {
    fill(255);
    noStroke();

    // Project 3D space (x, y, z) into 2D screen coordinates
    float sx = map(x / z, 0, 1, 0, width);
    float sy = map(y / z, 0, 1, 0, height);

    // Dynamic star sizing based on depth
    float r = map(z, 0, width, 16, 0);
    ellipse(sx, sy, r, r);

    // Calculate tail positions using previous z
    float px = map(x / pz, 0, 1, 0, width);
    float py = map(y / pz, 0, 1, 0, height);

    pz = z;

    stroke(255);
    line(px, py, sx, sy);
  }
}
