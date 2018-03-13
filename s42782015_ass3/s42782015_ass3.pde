import javax.swing.JOptionPane;

final String OPENING_SENTANCE = "HOW ARE YOU";
final String EASTER_EGG = "MACQUARIE";
final int COLS = OPENING_SENTANCE.length();
final int ROWS = OPENING_SENTANCE.length();
final int CELL_SIZE = 50;
Cell [][] grid = new Cell[COLS][ROWS];
int dragRow;
int dragCol;
boolean easter = false;

void setup() {
  size(CELL_SIZE*COLS, CELL_SIZE*ROWS);

  /* creates all cells and sets the 1st columns letters to the opening string */
  for (int c = 0; c < COLS; c++) {
    for (int r = 0; r < ROWS; r++) {
      grid[c][r] = new Cell(CELL_SIZE*c, CELL_SIZE*r, CELL_SIZE+CELL_SIZE*c, CELL_SIZE+CELL_SIZE*r);
      grid[0][r].cellChar = OPENING_SENTANCE.charAt(r);
    }
  }
}

void draw() {
  /* draws the grid of cells with their character superimposed */
  for (int c = 0; c < COLS; c++) {
    for (int r = 0; r < ROWS; r++) {
      grid[c][r].display();
    }
  }

  /* if any of the cells are currently being dragged its character follows the mouse */
  for (int c = 0; c < COLS; c++) {
    for (int r = 0; r < ROWS; r++) {
      if (grid[c][r].dragging == true)
        text(grid[c][r].cellChar, mouseX, mouseY);
    }
  }
  
  /* I was bored this is beyond and not prohibited by the specification */
  checkEasterEgg();
  if (easter)
    pulse();
}

void mousePressed() {
  /* if the left mouse button is prssed figure out where and set that cell to dragged
   save the location it started for future reference */
  if (mouseButton == LEFT) {
    for (int c = 0; c < COLS; c++) {
      for (int r = 0; r < ROWS; r++) {
        if (mouseX > grid[c][r].x1 && mouseX < grid[c][r].x2 
          && mouseY > grid[c][r].y1 && mouseY < grid[c][r].y2) {
          grid[c][r].dragging = true;
          dragCol = c;
          dragRow = r;
        }
      }
    }
  } 
  /* if right mouse button is pressed show input dialog and place the
   entered character in that cell */
  else if (mouseButton == RIGHT) {
    for (int c = 1; c < COLS; c++) {
      for (int r = 0; r < ROWS; r++) {
        if (mouseX > grid[c][r].x1 && mouseX < grid[c][r].x2 
          && mouseY > grid[c][r].y1 && mouseY < grid[c][r].y2) {
          try {
            noLoop();
            String input = JOptionPane.showInputDialog("Enter letter please :)");
            input = input.toUpperCase();
            if (input.charAt(0) >= 65 && input.charAt(0) <= 90)
              grid[c][r].cellChar = input.charAt(0);
            else
              JOptionPane.showMessageDialog(frame, "You're only allowed to enter letters silly :).", "Maybe try again?", JOptionPane.ERROR_MESSAGE);
            loop();
          }
          catch(NullPointerException npe)
          {
            JOptionPane.showMessageDialog(frame, "You didn't enter anything silly :).", "Maybe try again?", JOptionPane.ERROR_MESSAGE);
          }
          catch( StringIndexOutOfBoundsException e)
          {
            JOptionPane.showMessageDialog(frame, "You didn't enter anything silly :).", "Maybe try again?", JOptionPane.ERROR_MESSAGE);
          }
        }
      }
    }
  }
}

/* when the mouse is released set the new cell to the
 value of the old cell unless it is outside the window
 or the first column in which case erase the letter */
void mouseReleased() {
  for (int c = 0; c < COLS; c++) {
    for (int r = 0; r < ROWS; r++) {
      if (mouseX > grid[c][r].x1 && mouseX < grid[c][r].x2 
        && mouseY > grid[c][r].y1 && mouseY < grid[c][r].y2) 
      {
        if (c > 0 && (c != dragCol || r != dragRow)) 
          grid[c][r].cellChar = grid[dragCol][dragRow].cellChar;
        if (dragCol > 0 && (c != dragCol || r != dragRow))
          grid[dragCol][dragRow].cellChar = ' ';
      } 
      grid[c][r].dragging = false;
    }
  }
  if (dragCol > 0 && (mouseX < 0 || mouseX > width || mouseY < 0 || mouseY > height))
    grid[dragCol][dragRow].cellChar = ' ';
}

class Cell {
  int x1, y1;
  int x2, y2;
  color cellColour = color(255);
  color textColour = color(0);
  char cellChar = ' ';
  boolean dragging = false;

  Cell(int _x1, int _y1, int _x2, int _y2) {
    x1 = _x1;  // top left corner x
    y1 = _y1;  // top left corner y
    x2 = _x2;  // bottom right corner x
    y2 = _y2;  // bottom right corner y
  }

  void display() {
    // draw the square for this cell
    stroke(0);
    strokeWeight(1);
    fill(cellColour);
    rectMode(CORNERS);
    rect(x1, y1, x2, y2);

    fill(textColour);
    textSize(3*CELL_SIZE/4);
    textAlign(CENTER, CENTER);
    // if the cell isn't currently being dragged display the character in the cell
    if (!dragging)
      text(cellChar, x1+CELL_SIZE/2, y1+CELL_SIZE/2);
  }
}




























void checkEasterEgg() {
  String easterDown = "";
  String easterRight = "";

  for (int r = 0; r < ROWS; r++) {
    for (int c = 0; c < COLS; c++) {
      easterRight = easterRight + grid[c][r].cellChar;
      easterDown = easterDown + grid[r][c].cellChar;
    }
  }
  if (easterRight.indexOf(EASTER_EGG) >= 0 || easterDown.indexOf(EASTER_EGG) >= 0) {
    for (int c = 0; c < COLS; c++) {
      for (int r = 0; r < ROWS; r++) {
        grid[c][r].cellColour = color(random(256), random(256), random(256));
        grid[c][r].cellChar = ' ';
      }
    }
    int e = 0;
    for (int c = (int)COLS/2 - 3; c < 9; c++) {
      String easter = "YEEHAW!";
      grid[c][(int)ROWS/2].cellChar = easter.charAt(e);
      grid[c][(int)ROWS/2].textColour = color(255);
      e++;
    }
    easter = true;
  }
}

void pulse() {
  for (int c = 0; c < COLS; c++) {
    for (int r = 0; r < ROWS; r++) {
      grid[c][r].cellColour = grid[c][r].cellColour + color((int)random(-15, 15));
    }
  }
}

