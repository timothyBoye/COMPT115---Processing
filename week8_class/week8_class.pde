Ball bouncy;
Ball angry;
boolean attack, bounce;

void setup() {
  size(400, 400);
  smooth();
  bounce = true;
  attack = false;
  bouncy = new Ball(width/2, height/6, 20, 2, color(255, 0, 0), 0, 0, width, height/3);
  angry = new Ball(width/2, 7*height/8, 20, 2, color(0));
}

void draw() {
  background(255);

  stroke(0);
  strokeWeight(2);
  line(0, height/3, width, height/3);

  if (dist(angry.x, angry.y, bouncy.x, bouncy.y) - (bouncy.rad + angry.rad) <= 0) {
    bounce = false;
    attack = false;
    fill(random(256), random(256), random(256));
    textAlign(CENTER, CENTER);
    textSize(48);
    text("You Win!!!", width/2, height/2);
  } 
  else if (angry.y + angry.rad <= 0) {
    bounce = false;
    attack = false;
    fill(255, 0, 0);
    textAlign(CENTER, CENTER);
    textSize(48);
    text("GAME OVER", width/2, height/2);
  }

  if (bounce)
    bouncy.jumpAround();
  if (attack)
    angry.jumpAround();

  bouncy.display();
  angry.display();
}

void mousePressed() {
  if (dist(angry.x, angry.y, bouncy.x, bouncy.y) - (bouncy.rad + angry.rad) <= 0 || angry.y <= 0) {
    angry = new Ball(width/2, 7*height/8, 20, 2, color(0));
    bounce = true;
  } 
  else {
    if (!attack)
      attack = true;
    else {
      angry = new Ball(width/2, 7*height/8, 20, 2, color(0));
      attack = false;
    }
  }
}

