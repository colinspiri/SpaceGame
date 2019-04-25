import de.voidplus.leapmotion.*;
LeapMotion leap;

PVector cameraPos;
Asteroid[] asteroids;
int totalAsteroids = 20;
Ship ship;
Laser[] lasers;
int totalLasers = 0;

void setup() {
  size(1000, 600, P3D);
  leap = new LeapMotion(this);
  textSize(36);
  cameraPos = new PVector(width/2, height/2);
  asteroids = new Asteroid[totalAsteroids];
  for(int i = 0; i < totalAsteroids; i++) {
    asteroids[i] = new Asteroid();
  }
  ship = new Ship();
  lasers = new Laser[500];
}

void draw() {
  background(0);
  if(leap.getHands().size() == 0) {
    textSize(50);
    textAlign(CENTER, CENTER);
    fill(255);
    text("GAME PAUSED", width/2, height/2);
    return;
  }
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
  for(Hand hand : leap.getHands()) {
    if(hand.isRight()) {
      PVector handPosition = hand.getPosition();
      cameraPos = new PVector(handPosition.x, handPosition.y);
      for(Finger finger : hand.getOutstretchedFingers()) {
        // index
        if(finger.getType() == 1) {
          PVector fingerDirection = finger.getDirection();
          ship.facingDirection = new PVector(fingerDirection.x, fingerDirection.y, fingerDirection.z);
          
          pushMatrix();
          PVector add = fingerDirection.copy();
          add.setMag(500);
          PVector crosshairPos = ship.position.copy();
          crosshairPos.add(add);
          translate(crosshairPos.x, crosshairPos.y, crosshairPos.z);
          stroke(0, 255, 0);
          noFill();
          sphere(20);
          popMatrix();
          
          pushMatrix();
          fill(255);
          translate(width/2, height/2, -100);
          text("X: " + nf(fingerDirection.x, 0, 1) + " Y: " + nf(fingerDirection.y, 0, 1) + " Z: " + nf(fingerDirection.z, 0, 1), 100, 100);
          popMatrix();
        }
        else if(finger.getType() == 0) {
          ship.shooting = false;
        }
      }
    }
  }
  //cameraPos = new PVector(mouseX, mouseY);
  camera(cameraPos.x, cameraPos.y, (height/2) / tan(PI/6), cameraPos.x, cameraPos.y, 0, 0, 1, 0);
  fill(255);
  //text("CamX: " + nf(cameraPos.x, 0, 1) + " CamY: " + nf(cameraPos.y, 0, 1), 100, 100);
}
