class Asteroid {
  float x, y, z;
  float zSpeed;
  
  Asteroid(float tempX, float tempY, float tempZ) {
    x = tempX;
    y = tempY;
    z = tempZ;
    zSpeed = random(2, 7);
  }
  
  void update() {
    z += zSpeed;
  }
  
  void display() {
    pushMatrix();
    translate(width/2 + x, height/2 + y, z);
    stroke(255);
    noFill();
    box(100);
    popMatrix();
  }
  
}
