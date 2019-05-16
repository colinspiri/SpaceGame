import de.voidplus.leapmotion.*;
LeapMotion leap;

import processing.sound.*;
SoundFile laserBlast;

PVector cameraPos;
Asteroid[] asteroids;
int totalAsteroids;
Ship ship;
Laser[] lasers;
int totalLasers;
int LEAP = 0;
int MOUSE = 1;
int mode = MOUSE;
int backgroundImageX = 5000;
int backgroundImageY = 3648;
float backgroundZ = 4676; // but negative
float imgScale = 0.00062*backgroundZ;
PImage backgroundimg;

void setup() {
  laserBlast = new SoundFile(this, "laserBlast.mp3");
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
  ship = new Ship();
  lasers = new Laser[500];
  totalLasers = 0;
}

void draw() {
  // Pause Menu
  background(0);
  pushMatrix();
  translate(0, 0, -backgroundZ);
  image(backgroundimg, width/2, height/2, backgroundImageX*imgScale, backgroundImageY*imgScale);
  popMatrix();
  if(leap.getHands().size() == 0 && mode == LEAP) {
    pushMatrix();
    translate(width/2, height/2, 0);
    textSize(50);
    textAlign(CENTER, CENTER);
    fill(255);
    text("GAME PAUSED", 0, 0);
    popMatrix();
    return;
  }
  lights();

  // Leap
  if(mode == LEAP) leapLogic();

  // Camera
  moveCamera();

  // Asteroids
  for(int i = 0; i < totalAsteroids; i++) {
    asteroids[i].update();
    asteroids[i].display();
    if(!asteroids[i].alive) {
      asteroids[i] = new Asteroid();
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

          pushMatrix();
          fill(255);
          translate(width/2, height/2, -100);
          text("X: " + nf(fingerDirection.x, 0, 1) + " Y: " + nf(fingerDirection.y, 0, 1) + " Z: " + nf(fingerDirection.z, 0, 1), 100, 100);
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
