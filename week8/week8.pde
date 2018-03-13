int attackRad;                              // radius of attacker
int defendRad;                              // radius of defender
int attackSpeed, attackPosY;                // speed and y for attacker
boolean attack = false;                     // user has clicked to attack
boolean attacked = false;                   // game has been played
boolean defend = true;                      // defender should bounce
int defendPosX, defendPosY, defendSpeed;    // x, y and speed of defender
boolean verticalMovement = true;            // defender should move down if true up if false
boolean horizontalMovement = false;         // defender should move right if true left if false
boolean easy, medium, hard;                 // game difficulty


void setup() {
  size(200, 200);
  smooth();
  //initial game conditions
  attackRad = width/10;
  defendRad = width/10;
  attackSpeed = 2;
  attackPosY = 7*height/8;
  defendPosX = width/2;
  defendPosY = height/6; 
  defendSpeed = 2;
  easy = true;
  rectMode(CORNERS);
}

void draw() {
  window();            // setup the window elements  
  defender();          // display the defender
  attacker();          // display the attacker
}

void mousePressed() {
  // if the mouse is clicked on the buttons change the game conditions
  if (mouseX >= width/20 && mouseX <= 2*width/20) {
    // easy button
    if (mouseY >= 18*height/20 && mouseY <= 19*height/20) {
      easy = true;
      medium = false;
      hard = false;
      defendRad = width/10;
      attackRad = width/10;
      attackPosY = 7*height/8;
      defendPosX = width/2;
      defendPosY = height/6;
      // medium button
    } 
    else if (mouseY >= 16*height/20 && mouseY <= 17*height/20) {
      easy = false;
      medium = true;
      hard = false;
      defendRad = width/15;
      attackRad = width/15;
      attackPosY = 7*height/8;
      defendPosX = width/2;
      defendPosY = height/6;    
      // hard button
    } 
    else if (mouseY >= 14*height/20 && mouseY <= 15*height/20) {
      easy = false;
      medium = false;
      hard = true;
      defendRad = width/20;
      attackRad = width/20;
      attackPosY = 7*height/8;
      defendPosX = width/2;
      defendPosY = height/6;
    } 
    else {
      // if outside the button area attack you havent reset if you have
      if (!attack && attacked) {
        attackPosY = 7*height/8;
        defend = true;
        attacked = false;
      } 
      else {
        attack = true;
        attacked = true;
      }
    }
  } 
  else {
    // if outside the button area attack you havent reset if you have
    if (!attack && attacked) {
      attackPosY = 7*height/8;
      defend = true;
      attacked = false;
    } 
    else {
      attack = true;
      attacked = true;
    }
  }
}
/* controls the movement and drawing of the defender */
void defender() {
  // if the defender should move
  if (defend) {
    // when hitting a wall flip the vertical or horizontal movement
    if (defendPosY + defendRad >= height/3 || defendPosY - defendRad <= 0)
      verticalMovement = !verticalMovement;
    if (defendPosX + defendRad >= width || defendPosX - defendRad <= 0)
      horizontalMovement = !horizontalMovement;

    // moves the ball down when verticalMovement is true otherwise down
    if (verticalMovement)
      defendPosY += defendSpeed;
    else
      defendPosY -= defendSpeed;
    // moves the ball right when horizontalMovement is true otherwise left
    if (horizontalMovement)
      defendPosX += defendSpeed;
    else
      defendPosX -= defendSpeed;
  }
  // draw defender
  fill(255, 0, 0);
  ellipse(defendPosX, defendPosY, defendRad*2, defendRad*2);
}

/* controls the movement and drawing of the attacker */
void attacker() {
  // if the attacker should move, move it up
  if (attack)
    attackPosY -= attackSpeed;
  // if the balls hit show you win and stop the game
  if (dist(width/2, attackPosY, defendPosX, defendPosY) - (attackRad + defendRad) <= 0) {
    textAlign(CENTER, CENTER);
    textSize(24);
    text("You Win!", width/2, height/2);
    attack = false;
    defend = false;
  } 
  // if the ball goes out of bounds show game over and stop the game
  else if (attackPosY + attackRad <= 0) {
    attack = false;
    defend = false;
    textAlign(CENTER, CENTER);
    textSize(24);
    text("Game Over!", width/2, height/2);
  }
  // draw attacker
  fill(0);
  ellipse(width/2, attackPosY, attackRad*2, attackRad*2);
}

/* draws all other window elements */
void window() {
  background(255);
  // boundry line
  strokeWeight(height/100);
  line(0, height/3, width, height/3);
  // show the difficulty level each button represents when moused over
  if (mouseX >= width/20 && mouseX <= 2*width/20) {
    // easy
    if (mouseY >= 18*height/20 && mouseY <= 19*height/20) {
      fill(0);
      textAlign(LEFT, TOP);
      textSize(10);
      text("EASY", 3*width/20, 18*height/20);
    } 
    // medium
    else if (mouseY >= 16*height/20 && mouseY <= 17*height/20) {
      fill(0);
      textAlign(LEFT, TOP);
      textSize(10);
      text("MEDIUM", 3*width/20, 16*height/20);
    } 
    // hard
    else if (mouseY >= 14*height/20 && mouseY <= 15*height/20) {
      fill(0);
      textAlign(LEFT, TOP);
      textSize(10);
      text("HARD", 3*width/20, 14*height/20);
    }
  }
  fill(255);
  if (easy)    // make the box green if easy
      fill(0, 255, 0);
  rect(width/20, 18*height/20, 2*width/20, 19*height/20);
  fill(255);
  if (medium)    // make the box yellow if medium
      fill(255, 255, 0);
  rect(width/20, 16*height/20, 2*width/20, 17*height/20);
  fill(255);
  if (hard)    // make the box red if hard
      fill(255, 0, 0);
  rect(width/20, 14*height/20, 2*width/20, 15*height/20);
}

