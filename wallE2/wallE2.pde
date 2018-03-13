int x = 0;
int y = 0;
boolean dropped = false;

void setup()
{
  // Set window size and collour
  size(800, 600);
  x = width/2;
  y = height;
  background(#523140);
  wallE(x,y);
}

void wallE(int positionX, int positionY) {
    /*
Wall-E the robot
   */
  smooth();
  noStroke();
  rectMode(CENTER);
  fill(#FFC800);
  rect(positionX, positionY-100, 100, 100);
  fill(90);
  rect(positionX, positionY-100-35, 100, 30);
  strokeWeight(3);
  stroke(65);
  line(positionX-49, positionY-100-50, positionX+48, positionY-100-50);

  noStroke();
  fill(65);
  // left
  rRect(positionX-115, positionY-100-30, 60, 20, 10, 10);
  rRect(positionX-115, positionY-100-5, 60, 20, 10, 10);
  rRect(positionX-115, positionY-100+20, 60, 20, 10, 10);
  rRect(positionX-115, positionY-100+45, 60, 20, 10, 10);
  rRect(positionX-115, positionY-100+70, 60, 20, 10, 10);
  // right
  rRect(positionX+55, positionY-100-30, 60, 20, 10, 10);
  rRect(positionX+55, positionY-100-5, 60, 20, 10, 10);
  rRect(positionX+55, positionY-100+20, 60, 20, 10, 10);
  rRect(positionX+55, positionY-100+45, 60, 20, 10, 10);
  rRect(positionX+55, positionY-100+70, 60, 20, 10, 10);

  // Wall-e trunk
  fill(110);
  rect(positionX, positionY-100-65, 10, 20);
  rect(positionX, positionY-100-84, 15, 10);
  rect(positionX, positionY-100-105, 10, 25);

  // head
  rect(positionX,positionY-100-135, 90, 30);
  fill(#334455);
  stroke(#000000);
  ellipse(positionX-30, positionY-100-135, 20, 20);
  ellipse(positionX+30, positionY-100-135, 20, 20);
}

/*
Rounded rectangles
 http://forum.processing.org/topic/rounded-rectangle
 */
void rRect(float x, float y, float w, float h, float rx, float ry)
{
  beginShape();
  vertex(x, y+ry); //top of left side 
  bezierVertex(x, y, x, y, x+rx, y); //top left corner

  vertex(x+w-rx, y); //right of top side 
  bezierVertex(x+w, y, x+w, y, x+w, y+ry); //top right corner

  vertex(x+w, y+h-ry); //bottom of right side
  bezierVertex(x+w, y+h, x+w, y+h, x+w-rx, y+h); //bottom right corner

  vertex(x+rx, y+h); //left of bottom side
  bezierVertex(x, y+h, x, y+h, x, y+h-ry); //bottom left corner

  endShape(CLOSE);
} 

void draw() {
   if (dropped && y < height) {
     background(#523140);
     y = y + 5;
     wallE(x,y);
   } else if (dropped && y == height) {
     dropped = false;
   }
} 

void keyPressed()
{
  background(#523140);
  if (keyCode == LEFT) {
    x = x -10;
    wallE(x, height);
  } 
  else if (keyCode == RIGHT) {
    x = x +10;
    wallE(x,height);
  } else {
    wallE(x,height);
  }
}

void mouseDragged() {
    background(#523140);
    x = mouseX;
    y = mouseY+100;
    wallE(x,y);

}

void mouseReleased() {
    dropped = true;
    x = mouseX;
    y = mouseY+100;
}
