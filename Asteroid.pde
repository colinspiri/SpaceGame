class Asteroid {
  PVector position;
  PVector velocity;
  boolean alive;
  int size;
 
  Asteroid() {
    float x = random(-2*width, 2*width);
    float y = random(-2*height, 2*height);
    float z = -5000 + random(0, 300);
    position = new PVector(x, y, z);
    int xSpeedMax = 4;
    int ySpeedMax = 4;
    float zSpeed = random(5, 30);
    velocity = new PVector(random(-xSpeedMax, xSpeedMax), random(-ySpeedMax, ySpeedMax), zSpeed);
    alive = true;
    size = Math.round(random(50, 150));
  }
  
  void update() {
    position.add(velocity);
    if(position.z >= 400) alive = false;
  }
  
  void display() {
    pushMatrix();
    translate(width/2 + position.x, height/2 + position.y, position.z);
    fill(200);
    noStroke();
    sphere(size);
    popMatrix();
  }
}
