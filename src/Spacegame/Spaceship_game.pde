//Oliver Gibbons | 28 Nov 2022 | Spaceship game

//import processing.sound.*;
//SoundFile blaster;
Ship s1;
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Laser> laser = new ArrayList<Laser>();
Star[] stars = new Star[100];
Timer rockTimer, puTimer;
int score, level, rockCount, rockPassed, rockRate;
boolean play;
int ammo;

void setup() {
  size(800, 800);
  s1 = new Ship();
  ammo = s1.ammo;
  rockRate = (500);
  puTimer = new Timer(int(random(5000, 20000)));
  //rockTimer = new Timer(int(random(500, 900)));
  rockTimer = new Timer(rockRate);
  rockTimer.start();
  //  blaster = new SoundFile(this, "pew1.mp3");
  for (int i=0; i<stars.length; i++) {
    stars[i] = new Star();
  }
  score = 0;
  level = 1;
  play = false;
  rockPassed = 0;
}

void draw() {
  if (play == false) {
    startScreen();
  } else if (play) {

    //Level handleing
    if (frameCount % 1000 == 10) {
      level++;
      rockRate -= 10;
    }

    background(0);
    noCursor();
    infoPannel();

    //rendering stars
    for (int i=0; i<stars.length; i++) {
      stars[i].display();
      stars[i].move();
    }

    //Lazer
    for (int i = 0; i < laser.size(); i++) {
      Laser l = laser.get(i);
      println("Lasers:" + laser.size());
      for (int j = 0; j < rocks.size(); j++) {
        Rock r = rocks.get(j);
        if (r.intersect(l)) {
          score+= r.diam;
          laser.remove(l);
          rocks.remove(r);
        }
        if (l.reachedTop()) {
          laser.remove(l);
        } else {
          l.display();
          l.move();
        }
      }
    }

    //rendering ships
    s1.display(mouseX, mouseY);


    //adding PowerUp
    if (puTimer.isFinished()) {
      powerups.add(new PowerUp());
      puTimer.start();
      println("Rocks:" + powerups.size());
    }
    for (int i = 0; i < powerups.size(); i++) {
      PowerUp p = powerups.get(i);
      if (p.intersect(s1)) {
        powerups.remove(p);
        powerups.remove(p);
        if (p.type == 'H') {
          s1.health += 100;
        } else if (p.type == 'A') {
          s1.ammo += 50;
        } else if (p.type == 'T') {
          s1.addTurret();
        }
      }
      if (p.reachedBottom()) {
        powerups.remove(p);
      } else {
        p.display();
        p.move();
      }
    }

    //rendering rocks
    if (rockTimer.isFinished()) {
      rocks.add(new Rock());
      rockTimer.start();
      println("Rocks:" + rocks.size());
      rockCount++;
    }
    for (int i = 0; i < rocks.size(); i++) {
      Rock r = rocks.get(i);
      if (s1.intersect(r)) {
        s1.health-= r.diam;
        rocks.remove(r);
        score+=r.diam;
        rocks.remove(r);
        //todo logic for rock explosion animation
      }
      if (r.reachedBottom()) {
        rockPassed++;
        rocks.remove(r);
      } else {
        r.display();
        r.move();
      }
    }
    //Game over logic
    if (s1.health < 0) {
      gameOver();
    }
    if (rockPassed > 30) {
      gameOver();
    }
  }
}


void infoPannel() {
  fill(129, 128);
  rectMode(CENTER);
  rect(width/2, 25, 500, 40);
  text("Score:" + score, 160, 30);
  text("Level:" + level, 220, 30);
  text("Ammo:" + s1.ammo, 280, 30);
  text("Rock count:" + rocks.size(), 370, 30);
  text("Health:" + s1.health, 450, 30);
  text("Rocks Passed:" + rockPassed, 520, 30);
}

void mousePressed() {

  //blaster.stop();
  //blaster.play();
  if (s1.fire() && s1. turretCount == 1) {
    laser.add(new Laser(s1.x - 2, s1.y - 50));
  } else if (s1.fire() && s1. turretCount == 2) {
    laser.add(new Laser(s1.x - 37, s1.y - 28));
    laser.add(new Laser(s1.x + 32, s1.y - 28));
  } else if (s1.fire() && s1. turretCount == 3) {
    laser.add(new Laser(s1.x - 2, s1.y - 50));
    laser.add(new Laser(s1.x - 37, s1.y - 28));
    laser.add(new Laser(s1.x + 32, s1.y - 28));
  }
}

void startScreen() {
  background(0);
  fill(222);
  textAlign(CENTER);
  text("Press any key to begin", width/2, height/2);
  text("If 30 rocks pass, game over", width/2, height/2-90);
    text("Collect powerups to stay alive", width/2, height/2-60);
        text("Good luck", width/2, height/2-30);
  if (mousePressed || keyPressed) {
    play = true;
  }
}

void gameOver() {
  background(0);
  fill(222);
  textAlign(CENTER);
  text("Game Over", width/2, height/2);
  noLoop();
}
