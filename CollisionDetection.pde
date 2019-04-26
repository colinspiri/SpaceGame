
void collisionDetection() {
  asteroidLaserCollisions();
}

void asteroidLaserCollisions() {
  for(int a = 0; a < totalAsteroids; a++) {
    Asteroid asteroid = asteroids[a];
    for(int l = 0; l < totalLasers; l++) {
      Laser laser = lasers[l];
      float xDiff = asteroid.position.x - laser.position.x;
      float yDiff = asteroid.position.y - laser.position.y;
      float zDiff = asteroid.position.z - laser.position.z;
      float distance = (float)Math.sqrt(Math.pow(xDiff, 2) + Math.pow(yDiff, 2) + Math.pow(zDiff, 2));
      float sumOfRadii = asteroid.size + laser.size;
      println(distance + " " + sumOfRadii);
      if(distance < sumOfRadii) {
        asteroid.alive = false;
        println("COLLISION " + a + " " + l);
      }
    }
  }
}
