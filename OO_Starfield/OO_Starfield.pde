Star[] stars = new Star[800];
float speed;

void setup() {
  size(800, 800);
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
}

void draw() {
  // Map mouse horizontal position to speed
  speed = map(mouseX, 0, width, 0, 50);
  background(0);
  
  // Translate origin to screen center for perspective calculation
  translate(width / 2, height / 2);
  
  for (int i = 0; i < stars.length; i++) {
    stars[i].update();
    stars[i].show();
  }
}
