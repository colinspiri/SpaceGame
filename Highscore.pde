// Taken from one of my old, old projects in 8th grade -Colin
void importHighscore() {
  // Open the file from the createWriter()
  reader = createReader(highscoreFile);
  if (reader == null) {
    highscore = 0;
    return;
  }
  String line;
  try {
    line = reader.readLine();
  } 
  catch (IOException e) {
    e.printStackTrace();
    line = null;
  }
  if (line != null) {
    highscore = int(line);
    println("line != null then highscore = " + highscore);
  }
  try {
    reader.close();
  } 
  catch(IOException e) {
    e.printStackTrace();
  }
}
void updateHighscore() {
  if (highscore < score) {
    highscore = score;
    // Create a new file in the sketch directory
    output = createWriter(highscoreFile);
    output.println(highscore);
    output.close(); // Writes the remaining data to the file & Finishes the file
  }
}

void importHighscoreName() {
  // Open the file from the createWriter()
  reader = createReader(highscoreNameFile);
  if (reader == null) {
    highscoreName = currentPlayer; // If there is no high scorer listed, then
    return;// currentPlayer will be the new high scorer
  }
  String name;
  try {
    name = reader.readLine();
  } 
  catch (IOException e) {
    e.printStackTrace();
    name = null;
  }
  if (name != null) {
    highscoreName = name;
    println(highscoreName);
  }
  try {
    reader.close();
  } 
  catch (IOException e) {
    e.printStackTrace();
  }
}

void updateHighscoreName() {
    //println("UpdateHighScoreName");
  if (highscore <= score) {
    //println("TRUE: new highscore!");
    highscoreName = currentPlayer;
    //println ("currentPlayer =" + currentPlayer);
    //println("HighscoreName =" + HighscoreName);
    // Create a new file in the sketch directory
    output = createWriter(highscoreNameFile);
    output.println(highscoreName);
    output.close(); // Writes the remaining data to the file & Finishes the file
  }//else println("else score = " + score + "and highscore = " + highscore);
}
