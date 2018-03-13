/* Timothy Boye
   COMP115 Week 4 Practical
   Conditionals
   */
void setup() {
  //window 600,400 with whiute background and no stroke
  size(600, 400);
  background(255);
  noStroke();
}

void draw() {
}

void mousePressed() {
  // when mouse is pressed check which quadrant it is in
  if (mouseX < width/2) {
    if (mouseY < height/2) fill(255, 0, 0);    // top left red
    else fill(0, 0, 255);    // bottom left blue
  }
  else {
    if (mouseY < height/2) fill(0, 255, 0);    // top right green
    else fill(0);    // bottom right black
  }
  
  // draw the coloured ellipse where the mouse was pressed
  ellipse(mouseX, mouseY, 20, 20);
}

