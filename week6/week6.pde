/*
   Timothy Boye
   42782015
   COMP115 Week 6 Practical
   Randomised bar codes
*/

void setup() {
  size(400, 400); 
  background(255); 
  // Sends arguments to the random barcode generator 
  drawBarCode(50, 50, 100, 40); 
  drawBarCode(25, 150, 200, 40);
  drawBarCode(75, 250, 300, 80);
}

// Our Random barcode generator
void drawBarCode (int x, int y, int w, int h) { 
  // draws each line until i is equal to the desired width (w)
  for (int i = 0; i < w; i++) {
    // Randomises the colour for each line then draws the next line
    float bw = random(1);
    if (bw < 0.5) 
      stroke(0);
    else 
      stroke(255);
    
    line(x+i ,y ,x+i ,y+h);
  }
}

void draw() {
}

