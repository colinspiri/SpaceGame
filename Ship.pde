class Ship {
  PVector position;
  int size;
  float speed;
  
  Ship() {
    float x = width/2;
    float y = height/2;
    float z = 200;
    position = new PVector(x, y, z);
    size = 30;
    speed = 0.4;
  }
  
  void update() {
    position.x += (cameraPos.x - position.x) * speed;
    position.y += (cameraPos.y - position.y) * speed;
    pushMatrix();
    translate(width/2, height/2, -500);
    fill(255);
    text("shipX: " + nf(position.x, 0, 1) + " shipY: " + nf(position.y, 0, 1), 0, 0);
    popMatrix();
    
    if(mousePressed && totalLasers < lasers.length) {
      lasers[totalLasers] = new Laser(position, new PVector(0, 0, -1));
      totalLasers++;
    }
  }
  
  void display() {
    pushMatrix();
    translate(position.x, position.y, position.z);
    fill(255);
    noStroke();
    box(size);
    popMatrix();
  }
}
