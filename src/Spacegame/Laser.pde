class Laser {

  int x, y, w, h, speed, diam;
  PImage laser1, laser2;

  Laser(int x, int y) {
    this.x = x;
    this.y = y;
    speed = 10;
    laser1 = loadImage("laser.png");
    laser2 = loadImage("laser2.png");
    diam = 60;
  }
  void display() {
    imageMode(CENTER);
    image(laser1, x, y);
    //  image(laser2, x, y);
    laser1.resize(diam, diam);
    //  laser2.resize(60, 60);
  }

  void move() {
    y -= speed;
  }

  boolean reachedTop() {
    if (y< -20) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock rock) {
    float d = dist(x, y, rock.x, rock.y);
    if (d< rock.diam) {
      return true;
    } else {
      return false;
    }
  }
}
