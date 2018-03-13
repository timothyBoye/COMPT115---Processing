/* COMP115
 Assignment One
 By Timothy Boye
 
 The growing but disappearing target
 */
int ellipseSize = 0;  // stores size of the red ellipse
boolean mouseWasClicked = false;  // runs my mouse/ellipse if statement
int a = 255;  // stores alpha level of ellipse

 // stores position of mouse at click
int mX = 0; 
int mY = 0;

void setup()
{
  size(400, 300);    // Window size 400 width 300 tall
  rectMode(CENTER);    //centre boxes
}

void draw()
{
  background(255);    // White background

  // Box with green border
  noFill();
  stroke(0, 255, 0);
  strokeWeight(2);
  rect(width/2, height/2, width/2, height/2);

  // Blue plus sign
  noStroke();
  fill(0, 0, 255);
  rect(width/2, height/2, width/10, height/2);
  rect(width/2, height/2, width/2, width/10);

  // creates red ellipse when mouse is clicked
  if (mouseWasClicked && ellipseSize <= 255) {   
    // Incrementally increase ellipse size and decreases opacity
    ellipseSize ++;
    a --;
    // draws the ellipse with the colour red and no border
    noStroke();
    fill(255, 0, 0, a);
    ellipse(mX, mY, ellipseSize, ellipseSize);
  } 
  else {
    // turns the ellipse if statement off once the ellipse has run its course
    mouseWasClicked = false;
  }

  // Constrains the alpha and ellipse size between 0 - 255 in case of error
  a = constrain(a, 0, 255);
  ellipseSize = constrain(ellipseSize, 0, 255);
}

void mousePressed()
{
  // if the mouse is outside the box
  if (mouseX < width*0.25 || mouseX > width*0.75 || mouseY < height*0.25 || mouseY > height*0.75) {
    // turns the ellipse if statement on and sets the starting values
    mouseWasClicked = true;
    ellipseSize = 0;
    a = 255;
    mX = mouseX;
    mY = mouseY;
  }
}

