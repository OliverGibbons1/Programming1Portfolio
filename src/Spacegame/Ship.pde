class Ship {

  int x, y, w, turretCount, ammo, health;
  PImage ship;

  Ship() {
    x=0;
    y=0;
    w=100;
    ammo = 100;
    turretCount = 1;
    health = 1000;
    ship = loadImage("Spaceship for game.png");
  }

  void display(int tempx, int tempy) {
    x = tempx;
    y = tempy;
    image(ship, x, y);
    imageMode(CENTER);
  }


  void move() {
  }

void addTurret() {
turretCount += 1;
}

  //void fire() {
  //}


  boolean intersect(Rock rock) {
    float d = dist(x, y, rock.x, rock.y);
    if (d< 60) {
      return true;
    } else {
      return false;
    }
  }


  boolean fire() {
    if (ammo>0) {
      ammo--;
      return true;
    } else {
      return false;
    }
  }
}
