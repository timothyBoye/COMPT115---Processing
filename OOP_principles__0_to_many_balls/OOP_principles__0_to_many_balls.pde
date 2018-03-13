/*
  COMP115 Workshops
  OOP principles: 0 to many balls
  By Timothy Boye
*/

int columns = 3000;
Ball[] gridOfBalls = new Ball[columns];

void setup() {
  size(500,500);
}

void draw() {
  for (int c = 0; c < columns; c++) {
    gridOfBalls[c] = new Ball((int)random(50), color((int)random(255),(int)random(255),(int)random(255)), (int)random(width), (int)random(height));
    gridOfBalls[c].display();
  }
}


class Ball {
  int rad;
  int positionX;
  int positionY;
  color c;

  Ball(int _radius, color _c, int _positionX, int _positionY) {
    c = _c;	
    rad = _radius;
    positionX = _positionX;
    positionY = _positionY;
  }

  void display() {
    fill(c);
    ellipseMode(RADIUS);
    ellipse(positionX, positionY, rad, rad);
  }
}