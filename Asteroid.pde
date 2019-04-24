class Asteroid {
  float x, y, z;
  float speed;
  boolean alive;
  int size;
 
  Asteroid() {
    x = random(-width, width);
    y = random(-height, height);
    z = -5000 + random(0, 300);
    speed = random(5, 30);
    alive = true;
    size = Math.round(random(50, 150));
  }
  
  void update() {
    z += speed;
    if(z >= 0) alive = false;
  }
  
  void display() {
    pushMatrix();
    translate(width/2 + x, height/2 + y, z);
    fill(200);
    noStroke();
    sphere(size);
    popMatrix();
  }
}
