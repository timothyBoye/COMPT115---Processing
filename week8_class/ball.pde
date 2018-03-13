class Ball {
  int x, y, rad, speed;
  color c;

  int topX, topY, bottomX, bottomY;
  boolean vertical, horizontal, diagonal;

  Ball(int _x, int _y, int _rad, int _speed, color _c) {
    x = _x;
    y = _y;
    rad = _rad;
    c = _c;
    speed = _speed;
    diagonal = false;
  }

  Ball(int _x, int _y, int _rad, int _speed, color _c, 
       int _topX, int _topY, int _bottomX, int _bottomY) {
    x = _x;
    y = _y;
    rad = _rad;
    c = _c;
    speed = _speed;

    topX = _topX;
    topY = _topY;
    bottomX = _bottomX;
    bottomY = _bottomY;

    vertical = true;
    horizontal = true;
    diagonal = true;
  }

  void jumpAround() {
    if (diagonal) {
      if (x + rad >= bottomX || x - rad <= topX)
        vertical = !vertical;
      if (y + rad >= bottomY || y - rad <= topY)
        horizontal = !horizontal;

      if (vertical)
        x += speed;
      else
        x -= speed;

      if (horizontal)
        y += speed;
      else
        y -= speed;
    }
    else {
        y -= speed;
    }
  }

  void display() {
    noStroke();
    fill(c);
    ellipseMode(RADIUS);
    ellipse(x, y, rad, rad);
  }
}

