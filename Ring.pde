class Ring {
  PVector position;
  PVector velocity;
  boolean alive;
  int size;

  Ring() {
    float xDiff = random(-width, width);
    float yDiff = random(-height, height);
    float z = -5000 + random(0, 300);
    position = new PVector(width + xDiff, height + yDiff, z);
    int xSpeedMax = 4;
    float zSpeed = random(gameSpeed + 10, gameSpeed + 30);
    velocity = new PVector(0, 0, zSpeed);
    alive = true;
    size = Math.round(random(20, 70));
  }

  void update() {
    position.add(velocity);
   if(position.z >= 400) alive = false;
  }

  void display() {
    pushMatrix();
    translate(0,0, position.z);
    noFill();
    stroke(255, 255, 0);
    strokeWeight(3);
    ellipseMode(RADIUS);
    ellipse(position.x, position.y, size, size);
    popMatrix();
  }
}
