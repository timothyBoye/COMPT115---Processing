/*
  Timothy Boye
  COMP115 - Assignment 2
  The Random Progress Bar
  
  Part 3:
  - Implemented pause when space bar is pressed
  - Included instructions on initial screen
  - included a repeating 'Y' pattern background that
    subtly changes colour with the progress of the bar
*/

int progH;                     // height of the progress bar
float timer;                   // stores how long the progress bar takes
boolean started = false;       // tells the bar when to run
float startTime;               // stores time the bar started
float progress;                // stores the current progress of the bar
float pausedTime;              // stores time at which the bar was paused
boolean paused = false;        // stores whether the bar is paused


void setup() {
  size(500, 300);
  background(255);
  smooth();
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  textSize(24);
  fill(0);
  text("Welcome \n Click or press any key to start \n Press space to pause", width/2, height/2);

  // stores how tall the progress bar should be
  if (height/10 < 40)
    progH = height/10;
  else
    progH = 40;
}


/*  when the mouse is pressed the progress bar starts */
void mousePressed() {
  startProgress();
}


/* starts the progress bar if any key is hit
 unless its space in which case it pauses/resumes */
void keyPressed() {
  if (key == 32) {
    if (started) {
      pausedTime = millis();
      started = false;
      paused = true;
    }
    else
      if (paused) {
        startTime = startTime + millis() - pausedTime;
        started = true;
        paused = false;
      }
  } 
  else {
    startProgress();
  }
}


/* starts the bar from 0% and randomizes the timer */
void startProgress() {
  progress = 0;
  startTime = millis();
  timer = random(2000, 8001);
  started = true;
}


void draw() {
  // runs the progress bar and stops it at 100-%
  if (started) {
    progressBar();

    // checks how long the bar has been running
    if (millis() - startTime <= timer)      // if the timer hasnt elapsed make progress the bar
        progress = (millis() - startTime);
    else                                    // if the timer has elapsed stop the bar
    started = false;
  } 
}



/* draws the progress bar */
void progressBar() {
  // y coordinate for the progress bar lines
  float lineYStart = height/2 - progH/2;             
  
  // draws white background with the coloured pattern ontop
  background(255);
  pattern(-width/4, height+height/4, -PI/3, 9);
  // bounding box of the bar
  stroke(0);
  fill(255);
  rect(width/2, height/2, width/2+10, progH+10);

  /* draws the current progress of the bar as a
   segment of half the width of the window */
  for (int i = 1; i < progress*(width/2/timer); i++) {
    int gradient = (int)map(255-i,0,width/2,0,255); // degree the whit content till black as a function the width of the bar
    stroke(gradient);
    line(width*0.25+i, lineYStart, width*0.25+i, lineYStart+progH);
  }
  // display progress text
  displayProgress();
}


/* prints the current progress (in multiples of 5) on screen */
void displayProgress() {
  int percentage = (int)(progress/timer*100);
  /* for progress less than 100% print in multiples of five
   else print 100% done */
  if (millis() - startTime <= timer) {
    fill(0);
    text((percentage-percentage%5) + "%", width/2, height/2);
  }
  else {
    fill(255);
    text("100% Done!", width/2, height/2);
  }
}


/* creates a pattern on the background that 
   subtly changes colour with the progress */
void pattern(float x, float y, float initialAngle, float iterations) {
  // stores the change in angle for the pattern
  float dAngle = 0.3;
  // sets the angle at which the new line should deviate from the previous
  float X2 = x + 75*cos(initialAngle);
  float Y2 = y + 45*sin(initialAngle);

  /* draws a line from the starting point to the angle defined above
   then initiates two more iterrations of pattern to draw lines from
   here branching off in either direction, stops once the number of
   iterations runs out */
  if (iterations > 0) {
    // alters the colour for each iteration to give a gradient effect
    float r = abs(initialAngle*25*iterations);
    float g = progress/timer*100;
    float b = map(progress/timer*100,0,100,100,255);
    float a = 20*iterations;
    stroke(r, g, b, a);
    line(x, y, X2, Y2);
    iterations--;
    // calls the pattern method again for the two branches off this line
    pattern(X2, Y2, initialAngle+dAngle, iterations);
    pattern(X2, Y2, initialAngle-dAngle, iterations);
  }
}

