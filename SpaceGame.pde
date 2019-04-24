float camX, camY;
int speed, moveX;
Asteroid[] asteroids;
int totalAsteroids = 10;

void setup() {
  size(1000, 600, P3D);
  camX = width/2;
  camY = height/2;
  speed = 5;
  moveX = 0;
  asteroids = new Asteroid[totalAsteroids];
  for(int i = 0; i < totalAsteroids; i++) {
    float x = random(-width/2, width/2);
    float y = random(-height/2, height/2);
    float zDiff = random(-100, 100);
    float z = -1000 + zDiff;
    asteroids[i] = new Asteroid(x, y, z);
  }
}

void draw() {
  background(0);
  camX = mouseX;
  camY = mouseY;
  camera(camX, camY, (height/2) / tan(PI/6), camX, camY, 0, 0, 1, 0);
  for(int i = 0; i < totalAsteroids; i++) {
    asteroids[i].update();
    asteroids[i].display();
  }
}

void keyPressed() {
  if(keyCode == LEFT) {
    moveX = -1;
  }
  if(keyCode == RIGHT) {
    moveX = 1;
  }
}
void keyReleased() {
  if(keyCode == LEFT) {
    moveX = 0;
  }
  if(keyCode == RIGHT) {
    moveX = 0;
  }
}
