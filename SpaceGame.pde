PVector cameraPos;
Asteroid[] asteroids;
int totalAsteroids = 20;
Ship ship;
Laser[] lasers;
int totalLasers = 0;

void setup() {
  size(1000, 600, P3D);
  textSize(36);
  cameraPos = new PVector(width/2, height/2);
  asteroids = new Asteroid[totalAsteroids];
  for(int i = 0; i < totalAsteroids; i++) {
    asteroids[i] = new Asteroid();
  }
  ship = new Ship();
  lasers = new Laser[100];
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
  
  int aliveLasers = 0;
  Laser[] newLasers = new Laser[100];
  for(int i = 0; i < totalLasers; i++) {
    if(lasers[i].alive) {
      newLasers[aliveLasers] = lasers[i];
      aliveLasers++;
    }
  }
  lasers = newLasers;
  totalLasers = aliveLasers;
  
  for(int i = 0; i < totalLasers; i++) {
    lasers[i].update();
    lasers[i].display();
  }
}

void moveCamera() {
  cameraPos = new PVector(mouseX, mouseY);
  camera(cameraPos.x, cameraPos.y, (height/2) / tan(PI/6), cameraPos.x, cameraPos.y, 0, 0, 1, 0);
  fill(255);
  text("CamX: " + nf(cameraPos.x, 0, 1) + " CamY: " + nf(cameraPos.y, 0, 1), 100, 100);
}
