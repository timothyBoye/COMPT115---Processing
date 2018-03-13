/*
  COMP115 Workshops
  Bouncing Rectangles with wall and other object collisions.
  By Timothy Boye
*/

// box size
int size1 = 100;
// initial colour
int R1 = 127, R2 = 127, G1 = 127, G2 = 127, B1 = 127, B2 = 127;
// box positions
int X1, Y1, X2, Y2;
// change in position speeds
int speedX1 = 5, speedX2 = -5, speedY1 = 5, speedY2 = -5;

//easter egg variables
String keyString = "";
boolean message = false;
PFont font;


void setup() {
  size(800,600);
  background(75);
  X1 = (int)(width*0.25);
  Y1 = (int)(height*0.5);
  X2 = (int)(width*0.75);
  Y2 = (int)(height*0.5);
  rectMode(CENTER);
  font = loadFont("Serif-48.vlw");
  textFont(font, 28.0F);
}


// moves the boxes around, checks for collisions and draws the screne.
void draw() {
  // clear previous screen 
  background(75);
  
  // Check for collisions and move rectangles
  adjustMovementSpeedAndDirection();
    
  // Draw the scene
  X1 = X1 + speedX1;
  Y1 = Y1 + speedY1;
  X2 = X2 + speedX2;
  Y2 = Y2 + speedY2; 
  rectMode(CENTER);
  fill(R1, G1, B1);
  rect(X1,Y1, size1, size1);
  fill(R2, G2, B2);
  rect(X2,Y2, size1, size1);
  
  // if the easter egg has been unlocked display the result.
  if (message) {
    textAlign(CENTER);
    text("ROCKS!", width / 2, height / 2);
  }
  
}


void adjustMovementSpeedAndDirection() {
  // Check for collisions and move rectangles
  if (X1 <= X2 && X2 - X1 <= size1 && Y1 <= Y2 && Y2 - Y1 <= size1) {
    rand();
    rand();
    speedX1 = (-1)*(speedX1);
    speedX2 = (-1)*(speedX2);
    speedY1 = (-1)*(speedY1);
    speedY2 = (-1)*(speedY2);
  }
  if (X1 >= X2 && X1 - X2 <= size1 && Y1 >= Y2 && Y1 - Y2 <= size1) {
    rand();
    rand();    
    speedX1 = (-1)*(speedX1);
    speedX2 = (-1)*(speedX2);
    speedY1 = (-1)*(speedY1);
    speedY2 = (-1)*(speedY2);
  }
  if (X1 >= X2 && X1 - X2 <= size1 && Y1 <= Y2 && Y2 - Y1 <= size1) {
    rand();
    rand();
    speedX1 = (-1)*(speedX1);
    speedX2 = (-1)*(speedX2);
    speedY1 = (-1)*(speedY1);
    speedY2 = (-1)*(speedY2);
  }
  if (X1 <= X2 && X2 - X1 <= size1 && Y1 >= Y2 && Y1 - Y2 <= size1) {
    rand();
    rand();
    speedX1 = (-1)*(speedX1);
    speedX2 = (-1)*(speedX2);
    speedY1 = (-1)*(speedY1);
    speedY2 = (-1)*(speedY2);
  }
  if ((X1+(size1*0.5)) >= width) { 
    speedX1 = (-1)*(speedX1);
    rand();
  }
  if ((X1-(size1*0.5)) <= 0) { 
    speedX1 = (-1)*(speedX1);
    rand();
  }
  if ((X2+(size1*0.5)) >= width) { 
    speedX2 = (-1)*(speedX1);
    rand();
  }
  if ((X2-(size1*0.5)) <= 0) { 
    speedX2 = (-1)*(speedX1);
    rand();
  } 
  if ((Y1+(size1*0.5)) >= height) { 
    speedY1 = (-1)*(speedY1);
    rand();
  }
  if ((Y1-(size1*0.5)) <= 0) { 
    speedY1 = (-1)*(speedY1);
    rand();
  }
  if ((Y2+(size1*0.5)) >= height) { 
    speedY2 = (-1)*(speedY2);
    rand();
  }
  if ((Y2-(size1*0.5)) <= 0) { 
    speedY2 = (-1)*(speedY2);
    rand();
  }
}

// Change the fill colour of the two boxes to a new random colour
void rand() {
  R1 = (int)random(0,255);
  G1 = (int)random(0,255);
  B1 = (int)random(0,255);
  R2 = (int)random(0,255);
  G2 = (int)random(0,255);
  B2 = (int)random(0,255);
}


//easter egg, check if the user has typed in comp115
void keyPressed() {
    keyString += key;
    keyString = keyString.toLowerCase();
    if (keyString.indexOf("comp115") >= 0) {
      message = true;
    }
  }
  
  
// clears the easter egg on click
void mouseClicked() {
  message = false;
  keyString = "";
}