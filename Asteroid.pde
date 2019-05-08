class Asteroid {
  PVector position;
  PVector velocity;
  boolean alive;
  int size;
 
  Asteroid() {
    float xDiff = random(-2*width, 2*width);
    float yDiff = random(-2*height, 2*height);
    float z = -5000 + random(0, 300);
    position = new PVector(width/2 + xDiff, height/2 + yDiff, z);
    int xSpeedMax = 4;
    float xSpeed = random(-xSpeedMax, xSpeedMax);
    int ySpeedMax = 4;
    float ySpeed = random(-ySpeedMax, ySpeedMax);
    float zSpeed = random(5, 30);
    velocity = new PVector(xSpeed, ySpeed, zSpeed);
    alive = true;
    size = Math.round(random(50, 150));
  }
  
  void update() {
    position.add(velocity);
    if(position.z >= 400) alive = false;
  }
  
  void display() {
    pushMatrix();
    translate(position.x, position.y, position.z);
    fill(200);
    noStroke();
    sphere(size);
    popMatrix();
  }
}
