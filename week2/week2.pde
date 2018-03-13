void setup() {
  // windows size 250 pixels square
  size(250, 250);
}

void draw() {
  // cross
  line(0, 0, width, height);
  line(width, 0, 0, height);
  // coloured ellipses
  fill(255);
  ellipse(width*0.5, width*0.8, width*0.2, height*0.2);
  fill(255,0,0);
  ellipse(width*0.2, width*0.5, width*0.2, height*0.2);
  fill(0,0,255);
  ellipse(width*0.8, width*0.5, width*0.2, height*0.2);
  fill(0,255,0);
  ellipse(width*0.5, width*0.2, width*0.2, height*0.2);
  // rectangle
  rectMode(CORNERS);
  fill(255);
  rect(width*0.2, height*0.2, width*0.8, height*0.8);
}

