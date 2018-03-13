int size1 = 100;
int R1 = 127, R2 = 127, G1 = 127, G2 = 127, B1 = 127, B2 = 127;
int X1, Y1, X2, Y2;
int speedX1 = 5, speedX2 = -5, speedY1 = 5, speedY2 = -5;
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

void draw() {
  background(75);
  if (X1 <= X2 && X2 - X1 <= size1 && Y1 <= Y2 && Y2 - Y1 <= size1) {
    rand1();
    rand2();
    speedX1 = (-1)*(speedX1);
    speedX2 = (-1)*(speedX2);
    speedY1 = (-1)*(speedY1);
    speedY2 = (-1)*(speedY2);
  }
  if (X1 >= X2 && X1 - X2 <= size1 && Y1 >= Y2 && Y1 - Y2 <= size1) {
    rand1();
    rand2();    
    speedX1 = (-1)*(speedX1);
    speedX2 = (-1)*(speedX2);
    speedY1 = (-1)*(speedY1);
    speedY2 = (-1)*(speedY2);
  }
    if (X1 >= X2 && X1 - X2 <= size1 && Y1 <= Y2 && Y2 - Y1 <= size1) {
    rand1();
    rand2();
    speedX1 = (-1)*(speedX1);
    speedX2 = (-1)*(speedX2);
    speedY1 = (-1)*(speedY1);
    speedY2 = (-1)*(speedY2);
  }
  if (X1 <= X2 && X2 - X1 <= size1 && Y1 >= Y2 && Y1 - Y2 <= size1) {
    rand1();
    rand2();
    speedX1 = (-1)*(speedX1);
    speedX2 = (-1)*(speedX2);
    speedY1 = (-1)*(speedY1);
    speedY2 = (-1)*(speedY2);
  }
  X1 = X1 + speedX1;
  Y1 = Y1 + speedY1;
  X2 = X2 + speedX2;
  Y2 = Y2 + speedY2; 
  rectMode(CENTER);
  fill(R1, G1, B1);
  rect(X1,Y1, size1, size1);
  fill(R2, G2, B2);
  rect(X2,Y2, size1, size1);
  if ((X1+(size1*0.5)) >= width) { 
    speedX1 = (-1)*(speedX1);
    rand1();
  }
  if ((X1-(size1*0.5)) <= 0) { 
    speedX1 = (-1)*(speedX1);
    rand1();
  }
  if ((X2+(size1*0.5)) >= width) { 
    speedX2 = (-1)*(speedX1);
    rand2();
  }
  if ((X2-(size1*0.5)) <= 0) { 
    speedX2 = (-1)*(speedX1);
    rand2();
  } 
  if ((Y1+(size1*0.5)) >= height) { 
    speedY1 = (-1)*(speedY1);
    rand1();
  }
  if ((Y1-(size1*0.5)) <= 0) { 
    speedY1 = (-1)*(speedY1);
    rand1();
  }
  if ((Y2+(size1*0.5)) >= height) { 
    speedY2 = (-1)*(speedY2);
    rand2();
  }
  if ((Y2-(size1*0.5)) <= 0) { 
    speedY2 = (-1)*(speedY2);
    rand2();
  } 
if (message) {
      textAlign(CENTER);
      text("ROCKS!", width / 2, height / 2);
    }
}

void rand1() {
  R1 = (int)random(0,255);
  G1 = (int)random(0,255);
  B1 = (int)random(0,255);
}

void rand2() {
  R2 = (int)random(0,255);
  G2 = (int)random(0,255);
  B2 = (int)random(0,255);
}

void keyPressed() {
    keyString += key;
    keyString = keyString.toLowerCase();
    if (keyString.indexOf("comp115") >= 0) {
      message = true;
    }
  }
  
void mouseClicked() {
  message = false;
  keyString = "";
}
