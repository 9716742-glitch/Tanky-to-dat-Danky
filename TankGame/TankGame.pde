// 1 April 2026 | TankGame By Ruby Collins-Peynaud
Tank Michael;
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
PImage bg;
int score;

void setup() {
  size(1000, 1000);
  score = 0;
  bg = loadImage("bkgd.png");
  Michael = new Tank();
  obstacles.add(new Obstacle(300, 200, 100, 100, int(random(1, 10)), 10));
}

void draw() {
  background (127);
  imageMode(CENTER);
  image(bg, 0, 0);
  for (int i = 0; i < obstacles.size(); i++) {
    Obstacle o = obstacles.get(i);
    o.display();
    o.move();
  }
  for (int i = 0; i < projectiles.size(); i++) {
    Projectile p = projectiles.get(i);
    p.display();
    p.move();
  }
  Michael.display();
  scorePanel();
}

void keyPressed() {
  if (key == 'w') {
    Michael.move('w');
  } else if (key == 's') {
    Michael.move('s');
  } else if (key == 'a') {
    Michael.move('a');
  } else if (key == 'd') {
    Michael.move('d');
  }
}

void mousePressed() {
  float dx = mouseX - Michael.x;
  float dy = mouseY - Michael.y;
  float mag = sqrt(dx*dx + dy*dy);
  
  if (mag > 0) {
    dx /= mag;
    dy /= mag;
  
  float speed = 5;
  projectiles.add(new Projectile(Michael.x, Michael.y, dx * speed, dy * speed));
  }
}
void scorePanel() {
  fill(127, 127);
  rectMode(CENTER);
  noStroke();
  rect(width/2, 30, width, 60);
  fill(255);
  textSize(50);
  textAlign(CENTER);
  text("Score:" + score, width/2, 45);
}
