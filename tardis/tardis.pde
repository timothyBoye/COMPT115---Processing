int tx = 30; 
int ty = 40;
int unit = 1;
int tSpeed = 15;

void setup() {
  size(800, 600);
  background(0, 0, 50);
  smooth();
}

void draw() {
  background(0, 0, 50);
  tardis(tx, ty);
}

void keyPressed() {
  if (keyCode == UP) ty-=tSpeed;
  if (keyCode == DOWN) ty+=tSpeed;
  if (keyCode == LEFT) tx-=tSpeed;
  if (keyCode == RIGHT) tx+=tSpeed;
}

void tardis(int x, int y) {
  //tardis
  fill(0, 0, 150);
  noStroke();
  rect(x, y, 50*unit, 89*unit);
  stroke(0);
  rect(x, y, 2*unit, 89*unit);
  rect(x+6*unit, y, 2*unit, 89*unit);
  rect(x+42*unit, y, 2*unit, 89*unit);
  rect(x+48*unit, y, 2*unit, 89*unit);
  line(x, y, x+48*unit, y);
  line(x, y+89*unit, x+48*unit, y+89*unit);
  line(x-2*unit, y+91*unit, x+50*unit, y+91*unit);
  line(x-4*unit, y+93*unit, x+54*unit, y+93*unit);
  line(x, y+89*unit, x-4*unit, y+93*unit);
  line(x+48*unit, y+89*unit, x+54*unit, y+93*unit);
  line(x+21*unit, y+89*unit, x+21*unit, y+13*unit);
  line(x+27*unit, y+89*unit, x+27*unit, y+13*unit);
  line(x+8*unit, y+13*unit, x+42*unit, y+13*unit);
  // sign
  fill(0);
  rect(x+4*unit, y+2*unit, 42*unit, 6*unit);
  textSize(4*unit);
  fill(255);
  text("POLICE       BOX", x+10*unit, y+7*unit);
  //tardis
  fill(0, 0, 150);
  rect(x-2*unit, y+6*unit, 2*unit, 8*unit);
  rect(x+50*unit, y+6*unit, 2*unit, 8*unit);
  triangle(x+7*unit, y-9*unit, x+44*unit, y-9*unit, x+24*unit, y-16*unit);
  ellipse(x+25*unit, y-26*unit, 5*unit, 5*unit);
  fill(200, 200, 255);
  rectMode(CORNERS);
  rect(x+27*unit, y-26*unit, x+19*unit, y-18*unit);
  rectMode(CORNER);
  fill(0, 0, 150);
  rect(x+19*unit, y-18*unit, 11*unit, 4*unit);
  rect(x+20*unit, y-24*unit, 2*unit, 6*unit);
  rect(x+27*unit, y-24*unit, 2*unit, 6*unit);
  rect(x+19*unit, y-26*unit, 11*unit, 2*unit);
  rect(x+5*unit, y-9*unit, 41*unit, 7*unit);
  rect(x+3*unit, y-7*unit, 45*unit, 7*unit);
  rect(x+1*unit, y-4*unit, 2*unit, 4*unit);
  rect(x+1*unit, y-4*unit, 4*unit, 4*unit);
  rect(x+1*unit, y-4*unit, 6*unit, 4*unit);
  rect(x+43*unit, y-4*unit, 2*unit, 4*unit);
  rect(x+43*unit, y-4*unit, 4*unit, 4*unit);
  rect(x+43*unit, y-4*unit, 6*unit, 4*unit);
  // windows
  fill(0, 0, 115);
  rect(x+11*unit, y+54*unit, 7*unit, 9*unit);
  rect(x+11*unit, y+70*unit, 7*unit, 9*unit);
  rect(x+31*unit, y+38*unit, 7*unit, 9*unit);
  rect(x+31*unit, y+54*unit, 7*unit, 9*unit);
  rect(x+31*unit, y+70*unit, 7*unit, 9*unit);
  fill(255);
  rect(x+11*unit, y+22*unit, 8*unit, 10*unit);
  line(x+11*unit, y+27*unit, x+19*unit, y+27*unit);
  line(x+15*unit, y+22*unit, x+15*unit, y+32*unit);
  rect(x+31*unit, y+22*unit, 8*unit, 10*unit);
  line(x+31*unit, y+27*unit, x+39*unit, y+27*unit);
  line(x+35*unit, y+22*unit, x+35*unit, y+32*unit);
  rect(x+11*unit, y+38*unit, 7*unit, 9*unit);
  stroke(0, 0, 150);
  line(x, y+90*unit, x+49*unit, y+90*unit);
  line(x-2*unit, y+92*unit, x+51*unit, y+92*unit);
}

