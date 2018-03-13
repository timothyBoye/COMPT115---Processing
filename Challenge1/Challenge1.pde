/*
  Timothy Boye
  Gaurav's Challenge 1
  moving ball witrh reversing axis
*/

int direction = 5;
int x = 1; int y = 0;
int ballSize = 0;
int R = 0; int G = 0; int B = 0;
boolean playX = false;
boolean playY = true;

void setup() {
  size(600,400);
  background(0);
  rand();
  y = height/2;
  smooth();
}
void draw() {
  background(0);
  
    if (x >= width+ballSize) {
    rand();
    x = width/2;
    playY=false;
    playX=true;
  } else if (x <= 0-ballSize) {
    rand();
    x = width/2;
    playY=false;
    playX=true;
  } else if (y >= height+ballSize) {
    rand();
    y = height/2;
    playX=false;
    playY=true;
  } else if (y <= 0-ballSize) {
    rand();
    y = height/2;
    playX=false;
    playY=true;
  }
  
  if (playY) {
    x = x + direction;
    ellipse(x,y,ballSize,ballSize);
  } 
  if (playX) {
    y = y + direction;
    ellipse(x,y,ballSize,ballSize);
  }

}

void rand() {
  R = (int)random(0,255);
  G = (int)random(0,255);
  B = (int)random(0,255);
  ballSize = (int)random(20,100);
  fill(R,G,B);
  direction = (int)random(-20,20);
  if (direction > 0 && playX) x = 0;
  if (direction < 0 && playX) x = width;
  if (direction > 0 && playY) y = 0;
  if (direction < 0 && playY) y = height;
}
