int locationX = 0;
int locationY = 0;

void setup() {
  ellipseMode(CENTER);
  // limit framerate to make the program uniform on differnt computers
  frameRate(40);
  // window 600 by 400, background blue, smooth graphics
  size(600, 400);
  background(#00CEFF);
  smooth();
  // instructional text
  textAlign(CENTER);
  textSize(30);
  text("click to move face", width/2, height/8);
  /*
    Funny Face
   positioning and size as a function of width
   as program width increases size of face increases
   but maintains ratios
  */
  // yellow face black outlines
  fill(#FFFF00);
  stroke(#000000);
  strokeWeight(3);
  ellipse(width/2, height/2, width/3, width/3);
  // eyes
  fill(#FFFFFF);
  ellipse(width/2-width/20, height/2-width/30, width/20, width/7.5);
  ellipse(width/2+width/20, height/2-width/30, width/24, width/24);
  fill(#000000);
  ellipse(width/2-width/20, height/2-width/30, width/60, width/60);
  ellipse(width/2+width/20, height/2-width/30, width/60, width/60);
  // mouth
  line(width/2-width/20, height/2+width/10, width/2+width/20, height/2+width/15);
    ellipseMode(CORNER);

}


void draw() {
  
}

void mousePressed() {
    ellipseMode(CENTER);
  background(#00CEFF);
  smooth();
  /*
    Funny Face
   positioning and size as a function of width
   as program width increases size of face increases
   but maintains ratios
  */
  // yellow face black outlines
  fill(#FFFF00);
  stroke(#000000);
  strokeWeight(3);
  ellipse(mouseX, mouseY, width/3, width/3);
  // eyes
  fill(#FFFFFF);
  ellipse(mouseX-width/20, mouseY-width/30, width/20, width/7.5);
  ellipse(mouseX+width/20, mouseY-width/30, width/24, width/24);
  fill(#000000);
  ellipse(mouseX-width/20, mouseY-width/30, width/60, width/60);
  ellipse(mouseX+width/20, mouseY-width/30, width/60, width/60);
  // mouth
  line(mouseX-width/20, mouseY+width/10, mouseX+width/20, mouseY+width/15);
}

void mouseDragged() {
    ellipseMode(CENTER);
  background(#00CEFF);
  smooth();
  /*
    Funny Face
   positioning and size as a function of width
   as program width increases size of face increases
   but maintains ratios
  */
  // yellow face black outlines
  fill(#FFFF00);
  stroke(#000000);
  strokeWeight(3);
  ellipse(mouseX, mouseY, width/3, width/3);
  // eyes
  fill(#FFFFFF);
  ellipse(mouseX-width/20, mouseY-width/30, width/20, width/7.5);
  ellipse(mouseX+width/20, mouseY-width/30, width/24, width/24);
  fill(#000000);
  ellipse(mouseX-width/20, mouseY-width/30, width/60, width/60);
  ellipse(mouseX+width/20, mouseY-width/30, width/60, width/60);
  // mouth
  line(mouseX-width/20, mouseY+width/10, mouseX+width/20, mouseY+width/15);
}

void keyPressed() {
    ellipseMode(CORNER);
  if (keyCode == LEFT && locationX >= 10) {
      setup();
    locationX = locationX - 10;
    ellipse(locationX, locationY, 100, 100);
  } else if (keyCode == RIGHT && locationX <= 590) {
      setup();
    locationX = locationX + 10;
    ellipse(locationX, locationY, 100, 100);
  } else if (keyCode == UP && locationY < 300) {
      setup();
    locationY = locationY - 10;
    ellipse(locationX, locationY, 100, 100);
  } else if (keyCode == DOWN && locationY <= height-10) {
      setup();
    locationY = locationY + 10;
    ellipse(locationX, locationY, 100, 100);
  }
}
