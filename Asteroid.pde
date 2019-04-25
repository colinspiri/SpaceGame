class Asteroid {
  PVector position;
  float speed;
  boolean alive;
  int size;
 
  Asteroid() {
    float x = random(-width, width);
    float y = random(-height, height);
    float z = -5000 + random(0, 300);
    position = new PVector(x, y, z);
    speed = random(5, 30);
    alive = true;
    size = Math.round(random(50, 150));
  }
  
  void update() {
    position.z += speed;
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
