
void collisionDetection() {
  asteroidLaserCollisions();
  shipRingCollisions();
  asteroidShipCollisions();  
}

void asteroidShipCollisions() {
  for(int a = 0; a < totalAsteroids; a++) {
    Asteroid asteroid = asteroids[a];
    // AABB METHOD
    if(asteroid.position.z + asteroid.size >= ship.position.z - 2*ship.size) {
      if(asteroid.position.x + asteroid.size > ship.position.x - ship.size 
      && asteroid.position.x - asteroid.size < ship.position.x + ship.size
      && asteroid.position.y + asteroid.size > ship.position.y - ship.size 
      && asteroid.position.y - asteroid.size < ship.position.y + ship.size) {
        asteroid.alive = false;
        if(ship.invulnerable) ship.setInvulnerable();
        else ship.takeDamage(0.15*asteroid.size);
      }
    }
  }
}

void asteroidLaserCollisions() {
  for(int a = 0; a < totalAsteroids; a++) {
    Asteroid asteroid = asteroids[a];
    for(int l = 0; l < totalLasers; l++) {
      Laser laser = lasers[l];
      // DISTANCE FORMULA SPHERE METHOD
      float xDiff = asteroid.position.x - laser.position.x;
      float yDiff = asteroid.position.y - laser.position.y;
      float zDiff = asteroid.position.z - laser.position.z;
      float distance = (float)Math.sqrt(xDiff*xDiff + yDiff*yDiff + zDiff*zDiff);
      float sumOfRadii = asteroid.size + laser.size;
      if(distance < sumOfRadii) {
        laser.alive = false;
        score += round((1500/asteroid.size)/10)*10;
        int reduction = 50;
        if(asteroid.size <= 1.4*reduction) {
          asteroid.alive = false;
        }
        else {
          asteroid.setSize(asteroid.size - reduction);
        }
        println("COLLISION " + a + " " + l);
      }
    }
    noStroke();
    fill(200);
  }
}

void shipRingCollisions() {
  for(int a = 0; a < totalRings; a++) {
    Ring ring = rings[a];
    if(ring.position.z >= ship.position.z + 200) {
      if(ring.position.x + ring.size > ship.position.x - ship.size
      && ring.position.x - ring.size < ship.position.x  - ship.size
      && ring.position.y + ring.size > ship.position.y - ship.size 
      && ring.position.y - ring.size < ship.position.y - ship.size) {
        ring.alive = false;
        ship.addHealth(0.15*ring.size);
        score += 20;
        println("COLLISION with ring");
      }
    }
  }
}
