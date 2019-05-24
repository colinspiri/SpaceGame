class Asteroid {
  PVector position;
  PVector velocity;
  boolean alive;
  int size;
  PImage surfaceImg;
  PShape shape;
  float yaw, pitch, roll;
  PVector asteroidSpin;

  Asteroid() {
    noStroke();
    fill(255);
    float x = random(-2*width, 2*width);
    float y = random(-2*height, 2*height);
    float z = -5000 + random(0, 300);
    position = new PVector(width/2 + x, height/2 + y, z);
    int xSpeedMax = 4;
    float xSpeed = random(-xSpeedMax, xSpeedMax);
    int ySpeedMax = 4;
    float ySpeed = random(-ySpeedMax, ySpeedMax);
    float zSpeedDiff = 5;
    float zSpeed = random(gameSpeed - zSpeedDiff, gameSpeed + zSpeedDiff);
    velocity = new PVector(xSpeed, ySpeed, zSpeed);
    alive = true;
    size = Math.round(random(50, 150));
    surfaceImg = loadImage("images/asteroid.jpg");
    shape = createShape(SPHERE, size);
    shape.setTexture(surfaceImg);
    yaw = random(-10,10);
    pitch = random(-10,10);
    roll = random(-10,10);
    float spinFactor = .01;
    asteroidSpin = new PVector(random(-spinFactor, spinFactor), random(-spinFactor, spinFactor), random(-spinFactor, spinFactor));
    fill(255);
  }
  
  void setSize(int newSize) {
    size = newSize;
    shape = createShape(SPHERE, size);
    shape.setTexture(surfaceImg);
  }
  
  void update() {
    position.add(velocity);
    if(position.z >= 400) alive = false;
    pitch +=asteroidSpin.x;
    yaw += asteroidSpin.y;
    roll += asteroidSpin.z;
  }

  void display() {
    pushMatrix();
    translate(position.x, position.y, position.z);
    rotateX(pitch);
    rotateY(yaw);
    rotateZ(roll);
    noStroke();
    fill(200);
    shape(shape);
    popMatrix();
  }
}
