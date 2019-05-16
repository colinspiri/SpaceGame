class Ship {
  PVector position;
  PVector facingDirection;
  int size;
  float speed;
  boolean shooting;
  PShape shape;
  float yaw, pitch, roll;
  float health;
  color shipColor; 
  boolean invulnerable;
  int invulTimerMax, invulTimer, flashTime;
  boolean flash;
  
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
    health = 100;
    shipColor = color(0, 255, 0);
    invulnerable = false;
    invulTimer = invulTimerMax = 60;
    flashTime = Math.round(invulTimerMax/10);
    flash = false;
  }
  
  void takeDamage(float damageAmount) {
    health -= damageAmount;
    if(health < 0) health = 0;
    setInvulnerable();
    println("Ship takes " + Math.round(damageAmount) + " damage and has " + health + " health remaining.");
  }
  
  void addHealth(float healthAmount){
    health+=healthAmount;
    if(health > 100) health = 100;
    println("Ship gains " + Math.round(healthAmount));
  }
  
  void setInvulnerable() {
    invulnerable = true;
    flash = true;
  }
  
  void update() {
    position = new PVector(cameraPos.x - width, cameraPos.y - height);
    position.mult(1.1);
    position.add(new PVector(width, height));
    if(shooting && totalLasers < lasers.length && frameCount%15==1) {
      lasers[totalLasers] = new Laser(position, facingDirection);
      totalLasers++;
      laserBlast.play();
    }
    shooting = false;
    if(mode == LEAP || mousePressed) shooting = true;
    
    // ship health
    if(health <= 25) shipColor = color(255, 0, 0);
    else if(health <= 50) shipColor = color(244, 200, 60);
    else shipColor = color(0, 255, 0);
    
    // invulnerable
    if(invulnerable) {
      invulTimer--;
      if(invulTimer <= 0) {
        invulTimer = invulTimerMax;
        invulnerable = false;
        flash = false;
      }
      if(invulTimer % flashTime == 0) {
        flash = !flash;
      }
    }
  }
  
  
  void display() {
    pushMatrix();
    translate(position.x, position.y, position.z);
    rotateX(PI*pitch/180);
    rotateY(PI*yaw/180);
    rotateZ(PI*roll/180);
    color c;
    if(invulnerable && flash) c = color(255);
    else c = shipColor;
    shape.setFill(c);
    shape.setStroke(c);
    shape(shape, 0, 0);
    popMatrix();
  }
}
