/* Timothy Boye
   42782015
   COMP115
   week 7 - Oval program
*/

boolean pressed = false;          // stores the mouse press
boolean displayOval = false;      // stores the mouse was released so should display final oval
int startX;                       // top-left corner x
int startY;                       // top-left corner y
int finalX;                       // borrom-right corner x
int finalY;                       // borrom-right corner y

void setup() {
  size(400,400);
  background(255);
  ellipseMode(CORNERS);
  rectMode(CORNERS);
  smooth();
}

void draw() {
  background(255);
  // if the mous has been pressed then draw the shapes to current mous pos
  if (pressed) {
    fill(255);
    rect(startX,startY,mouseX,mouseY);
    fill(127);
    ellipse(startX,startY,mouseX,mouseY);
  }
  // if the mouse has been released draw the oval
  if (displayOval)
    ellipse(startX,startY,finalX,finalY);
}

void mousePressed() {
  // turn on the shapes and set parametres
  startX = mouseX;
  startY = mouseY;
  pressed = true;
  displayOval = false;
}

void mouseReleased() {
  // stop displaying original shapes and draw an oval
  pressed = false;
  displayOval = true;
  finalX = mouseX;
  finalY = mouseY;
}
