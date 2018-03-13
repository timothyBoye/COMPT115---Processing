// current position of face
int locationX = 0;
int locationY = 0;

void setup() {
  // limit framerate to make the program uniform on differnt computers
  frameRate(40);
  // window 600 by 400, background blue, smooth graphics
  size(600, 400);
  background(#00CEFF);
  smooth();
  //draw face
  drawFace(width/2, height/2);
  // instructional text
  textAlign(CENTER);
  textSize(30);
  text("click, drag or keypress to move face", width/2, height/8);
}

// yellow face black outlines
void drawFace(int x, int y) {
  locationX = x;
  locationY = y;
  background(#00CEFF);
  ellipseMode(CENTER);
  fill(#FFFF00);
  stroke(#000000);
  strokeWeight(3);
  ellipse(x, y, width/3, width/3);
  // eyes
  fill(#FFFFFF);
  ellipse(x-width/20, y-width/30, width/20, width/7.5);
  ellipse(x+width/20, y-width/30, width/24, width/24);
  fill(#000000);
  ellipse(x-width/20, y-width/30, width/60, width/60);
  ellipse(x+width/20, y-width/30, width/60, width/60);
  // mouth
  line(x-width/20, y+width/10, x+width/20, y+width/15);
}

void draw() {
  
}

void mousePressed() {
  //draw face
  drawFace(mouseX, mouseY);
}

void mouseDragged() {
  //draw face
  drawFace(mouseX, mouseY);
}

void keyPressed() {
  if (keyCode == LEFT && locationX >= 10) {
    locationX = locationX - 10;
    drawFace(locationX, locationY);
  } else if (keyCode == RIGHT && locationX <= 590) {
    locationX = locationX + 10;
    drawFace(locationX, locationY);
  } else if (keyCode == UP && locationY < 300) {
    locationY = locationY - 10;
    drawFace(locationX, locationY);
  } else if (keyCode == DOWN && locationY <= height-10) {
    locationY = locationY + 10;
    drawFace(locationX, locationY);
  }
}