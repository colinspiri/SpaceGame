import de.voidplus.leapmotion.*;
LeapMotion leap;

import processing.sound.*;
SoundFile laserBlast;

PVector cameraPos;
Asteroid[] asteroids;
int totalAsteroids;
Ring[] rings;
int totalRings;
Ship ship;
Laser[] lasers;
int totalLasers;
int LEAP = 0;
int MOUSE = 1;
int backgroundImageX = 5000;
int backgroundImageY = 3648;
float backgroundZ = 4676; // but negative
float imgScale = 0.00062*backgroundZ;
PImage backgroundimg;

int mode = LEAP;

void setup() {
  laserBlast = new SoundFile(this, "Sounds/laserBlast.mp3");
  imageMode(CENTER);
  backgroundimg = loadImage("Images/realimage.jpg");
  //image dimensions: 4992x3648
  size(1000, 600, P3D);
  leap = new LeapMotion(this);
  textSize(36);
  cameraPos = new PVector(width/2, height/2);
  totalAsteroids = 60;
  asteroids = new Asteroid[totalAsteroids];
  for(int i = 0; i < totalAsteroids; i++) {
    asteroids[i] = new Asteroid();
  }

  totalRings = 10;
  rings = new Ring[totalRings];
  for(int i = 0; i < totalRings; i++) {
    rings[i] = new Ring();
  }

  ship = new Ship();
  lasers = new Laser[500];
  totalLasers = 0;
}

void draw() {
  background(0);
  // Game Over Screen
  if(ship.health <= 0) {
    camera(width/2, height/2, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
    pushMatrix();
    translate(width/2, height/2, 0);
    textSize(50);
    textAlign(CENTER, CENTER);
    fill(255);
    text("GAME OVER", 0, 0);
    popMatrix();
    return;
  }
  // Pause Menu
  if(leap.getHands().size() == 0 && mode == LEAP) {
    camera(width/2, height/2, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
    pushMatrix();
    translate(width/2, height/2, 0);
    textSize(50);
    textAlign(CENTER, CENTER);
    fill(255);
    text("GAME PAUSED", 0, 0);
    popMatrix();
    return;
  }
  // Draw image background
  pushMatrix();
  translate(0, 0, -backgroundZ);
  image(backgroundimg, width/2, height/2, backgroundImageX*imgScale, backgroundImageY*imgScale);
  popMatrix();
  lights();

  // Leap logic
  if(mode == LEAP) leapLogic();

  // Camera
  moveCamera();

  // Collision Detection
  collisionDetection();

  // Asteroids
  for(int i = 0; i < totalAsteroids; i++) {
    asteroids[i].update();
    asteroids[i].display();
    if(!asteroids[i].alive) {
      asteroids[i] = new Asteroid();
    }
  }

//Rings
for(int i = 0; i < totalRings; i++) {
    rings[i].update();
    rings[i].display();
    if(!rings[i].alive) {
      rings[i] = new Ring();
    }
  }

  // Ship
  ship.update();
  ship.display();

  // Lasers
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

  // Foreground
  displayForeground();

}

void displayForeground() {
  pushMatrix();
  translate(cameraPos.x, cameraPos.y, ship.position.z);
  textSize(20);
  fill(ship.shipColor);
  textAlign(LEFT, CENTER);
  text("Health: " + Math.round(ship.health), -0.3*width, -0.3*height);
  popMatrix();
}

void leapLogic() {
  for(Hand hand : leap.getHands()) {
    if(hand.isRight()) {
      PVector handPosition = hand.getStabilizedPosition();
      cameraPos = new PVector(2*handPosition.x, 2*handPosition.y);

      ship.yaw = -hand.getYaw();
      ship.pitch = -hand.getPitch();
      ship.roll = hand.getRoll();
      for(Finger finger : hand.getOutstretchedFingers()) {
        // Thumb
        if(finger.getType() == 0) {
          ship.shooting = false;
        }
        // Index
        else if(finger.getType() == 1) {
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
        }
      }
    }
  }
}

void moveCamera() {
  if(mode == MOUSE) {
    cameraPos = new PVector(2*mouseX, 2*mouseY);
  }
  camera(cameraPos.x, cameraPos.y, (height/2) / tan(PI/6), cameraPos.x, cameraPos.y, 0, 0, 1, 0);
}
