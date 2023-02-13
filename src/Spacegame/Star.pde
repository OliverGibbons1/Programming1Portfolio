class Star {

  int x, y, speed, diam;
  PImage star;

  //constructor
  Star() {
    x = int(random(width));
    y = int(random(width));
    speed = int(random(2, 5));
    diam = 55;
    star = loadImage("star.png");
  }
  
  void display() {
    imageMode(CENTER);
    image(star, x, y);
    star.resize(diam, diam);
  }

  void move() {
        if (y>height+5) {
      y = -5;
    } else {
      y += speed;
    }

  }

  boolean reachedBottom() {
    return true;
  }
}
