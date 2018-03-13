/* Comp115 Prac Week 10
   Odd ball box thing
   Timothy Boye
   42782015             */

Ball ball;
Boolean dragging = false;

void setup() {
  size(400, 400);
  color c = color(random(256), random(256), random(256));
  int quadrant = (int)random(1, 5);
  ball = new Ball(c, quadrant);    // create ball set random colour and start quadrant
}

void draw() {
  // set up screen
  background(255);
  strokeWeight(2);
  stroke(0);
  line(0, height/2, width, height/2);
  line(width/2, 0, width/2, height);
  // draw ball
  ball.display(); 
}

void mousePressed() {
  // when mouse pressed on ball drag it around
  if (dist(mouseX, mouseY, ball.x, ball.y) - ball.rad <= 0) {
    dragging = true;
  }
}

void mouseReleased() {
  // if the ball is being dragged currently plop it down in the quadrant it's in
  if (dragging) {
    ball.place(mouseX, mouseY);
    dragging = false;
  }
}

/* class for the ball that moves around the quadrants */
class Ball {
  color c;
  int rad = 50;
  int x;
  int y;
  int quadrant;

  Ball(color _c, int _quadrant) {
    c = _c;
    quadrant = _quadrant;
  }

  void place(int _x, int _y) {
    //checks where the ball is and places it accordingly
    if (_x < 0 || _x > width || _y < 0 || _y > height) { // out of bounds
      quadrant = quadrant;
    } 
    else {
      if (_x <= width/2) { //left field
        if (_y <= height/2) //top
          quadrant = 1;
        else { //bottom
          quadrant = 3;
        }
      }
      else { // right field
        if (_y <= height/2) { //top
          quadrant = 2;
        }
        else { //bottom
          quadrant = 4;
        }
      }
    }


    c = color(random(256), random(256), random(256)); // new random colour
  }
  /* if dragged the ball follows the cursor otherwise it is
     displayed at the centre of its quadrant */
  void display() {
    if (dragging) {  // follow mouse when dragging
      x = mouseX;
      y = mouseY;
    } 
    else {
      if (quadrant == 1) {  // top left
        x = width/4;
        y = height/4;
      } 
      else if (quadrant == 2) { // top right
        x = 3*width/4;
        y = height/4;
      } 
      else if (quadrant == 3) {  //bottom left
        x = width/4;
        y = 3*height/4;
      } 
      else if (quadrant == 4) {  // bottom right
        x = 3*width/4;
        y = 3*height/4;
      }
    }
    // finally draw the circle
    fill(c);
    noStroke();
    ellipseMode(RADIUS);
    ellipse(x, y, rad, rad);
  }
}

