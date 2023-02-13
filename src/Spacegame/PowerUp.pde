class PowerUp {
  char type;
  int x, y, speed, diam;
  //  PImage rock;

  //constructor
  PowerUp() {
    x = int(random(width));
    y = -100;
    speed = int(random(3, 8));
    diam = 20;
    //    rock = loadImage("powerup.png");
    int rand = int(random(3));
    if (rand == 0) {
      type = 'H';
    } else if (rand == 1) {
      type = 'A';
    } else {
      type = 'T';
  }
}

void display() {
  //    imageMode(CENTER);
  //    image(rock, x, y);
  //    rock.resize(diam, diam);
  fill(0, 222, 0);
  ellipse(x, y, diam, diam);
  fill(222);
  text(type, x, y);
}

void move() {
  y += speed;
}

boolean reachedBottom() {
  if (y>height+100) {
    return true;
  } else {
    return false;
  }
}


boolean intersect(Ship ship) {
  float d = dist(x, y, ship.x, ship.y);
  if (d< ship.w/2) {
    return true;
  } else {
    return false;
  }
}
}
