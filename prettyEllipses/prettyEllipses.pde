// colour variables
float r;
float g;
float b;
float a;
// ellipse varriables
float diam;
float x;
float y;

void setup()
{
  size(800,600);
  background(0);
  smooth();
}

void draw()
{
  //randomise all values of fill and ellipse
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  diam = random(50);
  x = random(width);
  y = random(height);
  
  noStroke();
  fill(r,g,b,a);
  ellipse(x,y,diam,diam);
}
  
