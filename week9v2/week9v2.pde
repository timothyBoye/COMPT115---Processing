import javax.swing.JOptionPane;
String jPane = JOptionPane.showInputDialog ("Number of balls:");
int numberOfBalls = Integer.parseInt(jPane);
Ball [] balls = new Ball[numberOfBalls];                                  //ball array (change this number to add balls)

void setup() {
  color [] c = new color[balls.length];                       //array of colors for balls
  int [] rad = new int[balls.length];                         //array of radii for balls
  int [] vSpeed = new int[balls.length];                      //array of vertical speeds for balls
  int [] hSpeed = new int[balls.length];                      //array of horizontal speeds for balls
  int [] x = new int[balls.length];                           //array of x positions for balls
  int [] y = new int[balls.length];                           //array of y positions for balls

  size(400, 400);
  smooth();

  /* sets all ball parametres at random then creates new balls */
  for (int i = 0; i < balls.length; i++) {
    c[i] = color(random(256), random(256), random(256));
    rad[i] = (int)random(1,10);
    vSpeed[i] = (int)random(-6, 6);
    hSpeed[i] = (int)random(-6, 6);
    x[i] = (int)random(0+rad[i], width-rad[i]);
    y[i] = (int)random(0+rad[i], height-rad[i]);

    balls[i] = new Ball(x[i], y[i], rad[i], c[i], vSpeed[i], hSpeed[i]);
  }
}

void draw() {
  background(255);
  boolean moveable = true; // allows balls to move
  
  /* for every ball check if it is touching any other ball
     if it is it can't move otherwise move once and display */
  for (int i = 0; i < balls.length; i++) {
    for (int j = 0; j < balls.length; j++) {
      if (j != i)
        if (dist(balls[i].x, balls[i].y, balls[j].x, balls[j].y) - (balls[i].rad + balls[j].rad) <= 0)
          moveable = false;
    }
    if (moveable) {
      balls[i].moveAround();
    }
    moveable = true;
    balls[i].display();
  }
}

/* defines our balls */
class Ball {
  int x, y, rad, vSpeed, hSpeed;
  color c;
  boolean vertical, horizontal;

  Ball(int _x, int _y, int _rad, color _c, int _vSpeed, int _hSpeed) {
    x = _x;
    y = _y;
    rad = _rad;
    c = _c;
    vSpeed = _vSpeed;
    hSpeed = _hSpeed;
    vertical = true;
    horizontal = true;
  }

  /* moves the ball, down if vertical true up if vertical false
     right if horizontal true, left if horizontal false. If it hits a wall bounce */
  void moveAround() {
    if (x + rad >= height || x - rad <= 0)
      vertical = !vertical;
    if (y + rad >= width || y - rad <= 0)
      horizontal = !horizontal;

    if (vertical)
      x += vSpeed;
    else
      x -= vSpeed;

    if (horizontal)
      y += hSpeed;
    else
      y -= hSpeed;
  }

  void display() {
    fill(c);
    ellipseMode(RADIUS);
    ellipse(x, y, rad, rad);
  }
}

