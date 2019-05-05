class Ship {
  PVector position;
  PVector facingDirection;
  int size;
  float speed;
  boolean shooting;
  PShape shape;
  float yaw, pitch, roll;
  
  Ship() {
    float x = width/2;
    float y = height/2;
    float z = 200;
    position = new PVector(x, y, z);
    facingDirection = new PVector(0, 0, -1);
    size = 30;
    speed = 0.4;
    shape = getShipShape();
    yaw = 0;
    pitch = 0;
    roll = 0;
  }
  
  void update() {
    position = new PVector(cameraPos.x - width, cameraPos.y - height);
    position.mult(1.1);
    position.add(new PVector(width, height));
    //println("position: " + position.x + " " + position.y);
    if(shooting && totalLasers < lasers.length && frameCount%15==1) {
      lasers[totalLasers] = new Laser(position, facingDirection);
      totalLasers++;
    }
    shooting = false;
    if(mode == LEAP || mousePressed) shooting = true;
  }
  
  void display() {
    pushMatrix();
    translate(position.x, position.y, position.z);
    rotateX(PI*pitch/180);
    rotateY(PI*yaw/180);
    rotateZ(PI*roll/180);
    shape.setStroke(color(0, 255, 0));
    shape.setFill(color(255));
    shape(shape, 0, 0);
    popMatrix();
  }
}
