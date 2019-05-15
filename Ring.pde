class Ring {
  PVector position;
  PVector velocity;
  boolean alive;
  int size;
 
  Ring() {
    float xDiff = random(-width/2, width/2);
    float yDiff = random(-height/2, height/2);
    float z = -5000 + random(0, 300);
    position = new PVector(width/2 + xDiff, height/2 + yDiff, z);
    int xSpeedMax = 4;
    float xSpeed = random(-xSpeedMax, xSpeedMax);
    //int ySpeedMax = 4;
    //float ySpeed = random(-ySpeedMax, ySpeedMax);
    float zSpeedDiff = 2;
    float zSpeed = random(gameSpeed - zSpeedDiff, gameSpeed + zSpeedDiff);
    velocity = new PVector(0, 0, zSpeed);
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
    noFill();
    stroke(225, 255, 0);
    strokeWeight(3);
    ellipse(position.x, position.y, size, size);
    popMatrix();
  }
}
