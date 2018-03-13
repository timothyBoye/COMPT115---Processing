/*
  Timothy Boye
  COMP115
  Prac Week 5
  Sudoku
*/
final int NUM_BOXS = 9;

void setup() {
  size(300,300);
}

void draw() {
  background(255);
  // Draw Column lines for NUM_BOXES
  for (int i = 1; i <= NUM_BOXS+1; i++) {
    // outer lines and every third line should be thicker
    if (i == 1 || i % 3 == 1 || i == NUM_BOXS+1) {
      strokeWeight(3);
      fill(0);
    }
    else {
      strokeWeight(1);
      fill(127);
    }
    // draw the lines
    int x = (width/(NUM_BOXS+2)) * i;
    int y = (width/(NUM_BOXS+2));
    line(x,y,x,y*(NUM_BOXS+1));
  }
    // Draw Row lines for NUM_BOXES
  for (int i = 1; i <= NUM_BOXS+1; i++) {
    // outer lines and every third line should be thicker
    if (i == 1 || i % 3 == 1 || i == NUM_BOXS+1) strokeWeight(3);
    else strokeWeight(1);
    // draw the lines
    int x = (width/(NUM_BOXS+2));
    int y = (width/(NUM_BOXS+2)) * i;
    line(x,y,x*(NUM_BOXS+1),y);
  }
}
