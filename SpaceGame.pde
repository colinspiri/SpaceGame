float camX, camY;
Asteroid[] asteroids;
int totalAsteroids = 20;
Ship ship;

void setup() {
  size(1000, 600, P3D);
  textSize(36);
  camX = width/2;
  camY = height/2;
  asteroids = new Asteroid[totalAsteroids];
  for(int i = 0; i < totalAsteroids; i++) {
    asteroids[i] = new Asteroid();
  }
  ship = new Ship();
}

void draw() {
  background(0);
  lights();
  moveCamera();
  
  for(int i = 0; i < totalAsteroids; i++) {
    asteroids[i].update();
    asteroids[i].display();
    
    if(!asteroids[i].alive) {
      asteroids[i] = new Asteroid();
    }
  }
  ship.update();
  ship.display();
}

void moveCamera() {
  camX = mouseX;
  camY = mouseY;
  camera(camX, camY, (height/2) / tan(PI/6), camX, camY, 0, 0, 1, 0);
  fill(255);
  text("CamX: " + nf(camX, 0, 1) + " CamY: " + nf(camY, 0, 1), 100, 100);
}
