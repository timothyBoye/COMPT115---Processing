/*
  Timothy Boye
  Week 3 Practical
  lines to mouse location
*/
void setup() {
  // window 300^2 and teal
  size(300,300);
  background(180,200,200);
  
}

void draw() {
}

void mouseClicked() {
  /* lines from edge of screen to
  mouse position when clicked */
  stroke(0);
  strokeWeight(2);
  line(0,mouseY, mouseX, mouseY);
  line(mouseX, 0, mouseX, mouseY);
  // ellipse at mouse click position
  noStroke();
  fill(255,0,0);
  ellipse(mouseX, mouseY, 20, 20);
}
