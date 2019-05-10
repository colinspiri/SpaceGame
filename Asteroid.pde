class Asteroid {
  PVector position;
  PVector velocity;
  boolean alive;
  int size;
  PImage surfaceImg;
  PShape shape;

  Asteroid() {
    float x = random(-2*width, 2*width);
    float y = random(-2*height, 2*height);
    float z = -5000 + random(0, 300);
    position = new PVector(width/2 + x, height/2 + y, z);
    int xSpeedMax = 4;
    float xSpeed = random(-xSpeedMax, xSpeedMax);
    int ySpeedMax = 4;
    float ySpeed = random(-ySpeedMax, ySpeedMax);
    float zSpeed = random(5, 30);
    velocity = new PVector(xSpeed, ySpeed, zSpeed);
    alive = true;
    size = Math.round(random(50, 150));
    surfaceImg = loadImage("images/asteroid.jpg");
    shape = createShape(SPHERE, size);
    shape.setTexture(surfaceImg);
  }
  
  void setSize(int newSize) {
    size = newSize;
    shape = createShape(SPHERE, size);
    shape.setTexture(surfaceImg);
  }
  
  void update() {
    position.add(velocity);
    if(position.z >= 400) alive = false;
  }

  void display() {
    pushMatrix();
    translate(position.x, position.y, position.z);
    noStroke();
    fill(200);
    shape(shape);
    popMatrix();
  }
}
