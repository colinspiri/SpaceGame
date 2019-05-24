# The Conceit

* Maneuver a spaceship as it zooms faster and faster through space
* Take damage if you crash into an asteroid
* Recover health by flying through rings
* Shoot asteroids and fly through rings to gain points
* Accrue as many points before dying to earn your chance at a high score (that persists from game to game)

# The Controls

* Use your right hand with the Leap Motion Controller to control the wireframe ship
* Move your hand in the X-Y plane parallel with the Leap to maneuver the ship
* Rotate your hand with 3 degrees of freedom to rotate the ship
* Point your index finger in a direction to aim the ship's lasers
* Leave your thumb extended by default; Hide your thumb underneath your hand to fire lasers at a fixed fire rate

# The Code

* SpaceGame.pde contains the main method; Run this file
* Ensure that the int variable "mode" is initialized to "LEAP" to use the Leap Motion Controller; set it to "MOUSE" to instead use the mouse controls (for developing purposes)
* The file todo.txt is a record of feature ideas and bugs to fix
* Make sure that line 65 of Ship.pde is uncommented and says laserBlast.play();
  * Christian's computer for some reason wouldn't work with the sound files so we had to comment that line out in testing

# The Commits
* Colin worked on the ship, the asteroids, some collision detection, and the score system
* Luke worked on the rings, the laser-firing, some collision detection, and the health bar
* Christian worked on the background, camera, implementing images, and fixing (many) coloring issues
