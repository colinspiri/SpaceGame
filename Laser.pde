class Laser {
  PVector position;
  PVector velocity;
  int size;
  float speed;
  boolean alive;
  
  Laser(PVector startPos, PVector direction) {
    position = new PVector(startPos.x, startPos.y, startPos.z);
    velocity = new PVector(direction.x, direction.y, direction.z);
    speed = 40;
    velocity.setMag(speed);
    size = 100;
    alive = true;
  }
  
  void update() {
    position.add(velocity);
    
    if(position.z <= -6000) alive = false;
  }
  
  void display() {
    pushMatrix();
    translate(position.x, position.y, position.z);
    fill(255, 0, 0);
    noStroke();
    box(size);
    popMatrix();
  }
}
