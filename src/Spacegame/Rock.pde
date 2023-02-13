class Rock {

  int x, y, speed, diam;
  PImage rock;

  //constructor
  Rock() {
    x = int(random(width));
    y = -100;
    speed = int(random(3, 8));
    diam = int(random(55, 150));
    rock = loadImage("rock.png");
  }
  void display() {
    imageMode(CENTER);
    image(rock, x, y);
    rock.resize(diam, diam);
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

  boolean intersect(Laser laser) {
    float d = dist(x, y, laser.x, laser.y);
    if (d< laser.diam/2) {
      return true;
    } else {
      return false;
    }
  }
}
