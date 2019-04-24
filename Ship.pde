class Ship {
  float x, y, z;
  int size;
  float speed;
  
  Ship() {
    x = width/2;
    y = height/2;
    z = 200;
    size = 30;
    speed = 0.4;
  }
  
  void update() {
    x += (camX - x) * speed;
    y += (camY - y) * speed;
    pushMatrix();
    translate(width/2, height/2, -500);
    fill(255);
    text("shipX: " + nf(x, 0, 1) + " shipY: " + nf(y, 0, 1), 0, 0);
    popMatrix();
  }
  
  void display() {
    pushMatrix();
    translate(x, y, z);
    fill(255);
    noStroke();
    box(size);
    popMatrix();
  }
}
