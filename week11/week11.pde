import javax.swing.JOptionPane;

int cellSize;
int cols;
int rows;
Grid g;

void setup() {
  /* take input of how many cells we want in our square grid */
  try {
    noLoop();
    String _noRowsCols = JOptionPane.showInputDialog("Number of Rows/Columns?");
    cols = Integer.parseInt(_noRowsCols);
    rows = Integer.parseInt(_noRowsCols);
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
  
  size(600,600);
  cellSize = width/cols;
  g = new Grid();
}

/* display our grid */
void draw() {
  g.display();
}

/* when key pressed randomise the colour again */
void keyPressed() {
  g.randomise();
}

class Grid {
  int[][] cell;
  
  Grid() {
    cell = new int[cols][rows];
    randomise();
  }
  
  /* display a grid with the fill from the cell array */
  void display() {
    for (int c = 0; c < cols; c++) {
      for (int r = 0; r < rows; r++) {
        stroke(0);
        strokeWeight(2);
        fill(cell[c][r]);
        rect(c*cellSize, r*cellSize, c*cellSize+cellSize, r*cellSize+cellSize);
      }
    }
  }
  
  /* randomise the array */
  void randomise() {
    for (int c = 0; c < cols; c++) {
      for (int r = 0; r < rows; r++) {
        cell[c][r] = (int)random(255);
      }
    }
  }
}

