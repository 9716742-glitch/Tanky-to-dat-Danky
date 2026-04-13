class  Tank {
  float x, y, w, h, speed, health;
  PImage iTankW, iTankA, iTankS, iTankD;
  char idir;



  Tank() {
    x = 100;
    y = 100;
    w = 100;
    h = 100;
    speed = 10.0;
    health = 75.0;
    iTankW = loadImage("tanky1.png");
    iTankA = loadImage ("tanky1A.png");
    iTankS = loadImage ("tanky1S.png");
    iTankD = loadImage ("tanky1D.png");
    idir = 'w';
    idir = 'a';
    idir = 's';
    idir = 'd';
  }
  
  void display() {
    imageMode(CENTER);
    image(iTankW,x,y);
  }

  void move(char dir) {
    if (dir == 'w') {
      y = y - speed;
    } else if (dir == 's') {
      y = y + speed;
    } else if (dir == 'a') {
      x = x - speed;
    } else if (dir == 'd') {
      x = x + speed;
    }
  }

  void fire() {
  }
}
