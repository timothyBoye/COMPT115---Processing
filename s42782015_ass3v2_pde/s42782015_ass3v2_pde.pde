/*
  COMP115 Assignment 3
  Editable Grid
  By Timothy Boye
     42782015
  Please note there is additional functionality
  at the bottom of the program (an easter egg),
  I realise this is not worth any marks just
  thought I'd brighten up your day :P.
*/

import javax.swing.JOptionPane;

final String OPENING_SENTANCE = "HOW ARE YOU";
final String EASTER_EGG = "MACQUARIE";
final int COLS = OPENING_SENTANCE.length();
final int ROWS = OPENING_SENTANCE.length();
final int CELL_SIZE = 800/OPENING_SENTANCE.length();
Grid grid = new Grid();
boolean easter = false;
boolean dragging = false;

void setup() {
  size(800,800);
}

void draw() {
  /* draws the grid of cells with their character superimposed */
  grid.display();

  /* if any of the cells are currently being dragged its character follows the mouse */
  if (dragging == true)
    text(grid.dragLetter, mouseX, mouseY);

  /* I was bored this is beyond and not prohibited by the specification */
  checkEasterEgg();
  if (easter)
    pulse();
}

void mousePressed() {
  /* if the left mouse button is prssed figure out where and set that cell to dragged
   save the location it started for future reference */
  if (mouseButton == LEFT)
    grid.dragging();
  /* if right mouse button is pressed show input dialog and place the
   entered character in that cell */
  if (mouseButton == RIGHT)
    grid.input();
}

/* when the mouse is released set the new cell to the
 value of the old cell unless it is outside the window
 or the first column in which case erase the letter */
void mouseReleased() {
  grid.stopDragging();
}





class Grid {
  color[][] cellColour = new color[COLS][ROWS];
  color[][] textColour = new color[COLS][ROWS];
  char[][] letter = new char[COLS][ROWS];
  char dragLetter;

  Grid() {
    for (int c = 0; c < COLS; c++) {
      for (int r = 0; r < ROWS; r++) {
        cellColour[c][r] = color(255);
        textColour[c][r] = color(0);
        if (c > 0)
          letter[c][r] = ' ';
        else
          letter[0][r] = OPENING_SENTANCE.charAt(r);
      }
    }
  }

  /* display a grid with the fill from the cell array */
  void display() {
    for (int c = 0; c < COLS; c++) {
      for (int r = 0; r < ROWS; r++) {
        stroke(0);
        strokeWeight(1);
        fill(cellColour[c][r]);
        rect(c*CELL_SIZE, r*CELL_SIZE, c*CELL_SIZE+CELL_SIZE, r*CELL_SIZE+CELL_SIZE);

        fill(textColour[c][r]);
        textSize(3*CELL_SIZE/4);
        textAlign(CENTER, CENTER);
        text(letter[c][r], c*CELL_SIZE+CELL_SIZE/2, r*CELL_SIZE+CELL_SIZE/2);
      }
    }
  }

  /* show input dialog and place the
   entered character in that cell */
  void input() {
    // figure out which cell then allow input
    for (int c = 1; c < COLS; c++) {
      for (int r = 0; r < ROWS; r++) {
        if (mouseX > c*CELL_SIZE && mouseX < c*CELL_SIZE+CELL_SIZE
          && mouseY > r*CELL_SIZE && mouseY < r*CELL_SIZE+CELL_SIZE) {
          noLoop();
          try {
            String input = JOptionPane.showInputDialog("Enter letter please :)");
            input = input.toUpperCase();
            if (input.charAt(0) >= 65 && input.charAt(0) <= 90)
              letter[c][r] = input.charAt(0);
            else
              JOptionPane.showMessageDialog(frame, "You're only allowed to enter letters silly :).", "Maybe try again?", JOptionPane.ERROR_MESSAGE);
          }
          catch(NullPointerException npe)
          {
            JOptionPane.showMessageDialog(frame, "You didn't enter anything silly :).", "Maybe try again?", JOptionPane.ERROR_MESSAGE);
          }
          catch( StringIndexOutOfBoundsException e)
          {
            JOptionPane.showMessageDialog(frame, "You didn't enter anything silly :).", "Maybe try again?", JOptionPane.ERROR_MESSAGE);
          }
          loop();
        }
      }
    }
  }

  /* figure out where and set that cell to dragged
   save the location it started for future reference */
  void dragging() {
    // figure out which cell save character and blank cell
    for (int c = 0; c < COLS; c++) {
      for (int r = 0; r < ROWS; r++) {
        if (mouseX > c*CELL_SIZE && mouseX < c*CELL_SIZE+CELL_SIZE
          && mouseY > r*CELL_SIZE && mouseY < r*CELL_SIZE+CELL_SIZE) {
          dragLetter = letter[c][r];
          dragging = true;
          if (c > 0)
            letter[c][r] = ' ';
        }
      }
    }
  }

  /* set the new cell to the
   value of the old cell unless it is outside the window
   or the first column in which case erase the letter */
  void stopDragging() {
    // figure out which cell and save the character there
    for (int c = 0; c < COLS; c++) {
      for (int r = 0; r < ROWS; r++) {
        if (c > 0 && mouseX > c*CELL_SIZE && mouseX < c*CELL_SIZE+CELL_SIZE
          && mouseY > r*CELL_SIZE && mouseY < r*CELL_SIZE+CELL_SIZE)
          letter[c][r] = dragLetter;
      }
    }
    dragLetter = ' ';
    dragging = false;
  }
}





/* for fun not marking, checks for easteregg string and 
 if it is on makes the board pretty */
void checkEasterEgg() {
  String easterDown = "";
  String easterRight = "";

  for (int r = 0; r < ROWS; r++) {
    for (int c = 0; c < COLS; c++) {
      easterRight = easterRight + grid.letter[c][r];
      easterDown = easterDown + grid.letter[r][c];
    }
  }
  if (easterRight.indexOf(EASTER_EGG) >= 0 || easterDown.indexOf(EASTER_EGG) >= 0) {
    for (int c = 0; c < COLS; c++) {
      for (int r = 0; r < ROWS; r++) {
        grid.cellColour[c][r] = color(random(256), random(256), random(256));
        grid.letter[c][r] = ' ';
      }
    }
    int c = (int)COLS/2 - 3;
    for (int e = 0; e < 7; e++) {
      String easter = "YEEHAW!";
      grid.letter[c][(int)ROWS/2] = easter.charAt(e);
      grid.textColour[c][(int)ROWS/2] = 255;
      c++;
    }
    easter = true;
  }
}
/* for fun not marking, makes the board pretty
   (called once the easteregg is activated)  */
void pulse() {
  for (int c = 0; c < COLS; c++) {
    for (int r = 0; r < ROWS; r++) {
      grid.cellColour[c][r] = grid.cellColour[c][r] + color((int)random(-15, 15));
    }
  }
}