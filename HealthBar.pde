class healthBar{
float health;
float MAX_HEALTH;
float rectWidth;
  
healthBar(){
health = 100;
MAX_HEALTH = 100;
rectWidth = 300;
}

void update(){
  // Change color
  if (health < 25){
    fill(255, 0, 0);
  }  
  else if (health < 50){
    fill(255, 200, 0);
  }
  else{
    fill(0, 255, 0);
  }
 
  // Draw bar
  noStroke();
  // Get fraction 0->1 and multiply it by width of bar
  float drawWidth = (health / MAX_HEALTH) * rectWidth;
  rect(-400, -170, drawWidth, 50);

}

void takeHealth (float subtractedHealth){
  health -= subtractedHealth;
}

void addHealth(float addedHealth){
  health += addedHealth;
}

}
