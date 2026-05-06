// 1 April 2026 | TankGame by Ruby Collins-Peynaud
Tank Michael;
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
PImage bg;
int score;
Timer objTimer, puTimer;

void setup() {
  size(500, 500);
  score = 0;
  bg = loadImage("bkgd.png");
  Michael = new Tank(); 
  objTimer = new Timer(1000);
  objTimer.start();
  puTimer = new Timer(5000);
  puTimer.start();
}

void draw() {
  background(127);
  imageMode(CORNER);
  if (bg != null) image(bg, 0, 0);

  if (objTimer.isFinished()) {
    obstacles.add(new Obstacle(100, 100, int(random(1, 10)), 10));
    objTimer.start();
  }

  if (puTimer.isFinished()) {
    powerups.add(new PowerUp());
    puTimer.start();
  }

  for (int i = powerups.size() - 1; i >= 0; i--) {
    PowerUp pu = powerups.get(i);
    pu.display();
    pu.move();
    
    if (pu.reachedEdge()) {
      powerups.remove(i);
      continue; 
    }
    
    if (pu.intersect(Michael)) {
      if (pu.type == 'h') Michael.health += 100;
      else if (pu.type == 'a') Michael.laserCount += 100;
      else if (pu.type == 't') Michael.turretCount += 1;
      powerups.remove(i);
    }
  }

  for (int i = obstacles.size() - 1; i >= 0; i--) {
    Obstacle o = obstacles.get(i);
    o.display();
    o.move();
    
    if (o.reachedEdge()) {
      obstacles.remove(i);
      continue;
    }
    
    if (Michael.intersect(o)) {
      
    }
  }

  for (int i = projectiles.size() - 1; i >= 0; i--) {
    Projectile p = projectiles.get(i);
    p.display();
    p.move();

    boolean hit = false;
    for (int j = obstacles.size() - 1; j >= 0; j--) {
      Obstacle o = obstacles.get(j);
      if (p.intersect(o)) {
        score += 100;
        obstacles.remove(j);
        hit = true;
        break; 
      }
    }

    if (hit || p.reachedEdge()) {
      projectiles.remove(i);
    }
  }

  Michael.display();
  scorePanel();
}

void keyPressed() {
  Michael.move(key); 
}

void mousePressed() {
  float dx = mouseX - Michael.x;
  float dy = mouseY - Michael.y;
  float mag = sqrt(dx*dx + dy*dy);
  
  if (mag > 0) {
    dx /= mag;
    dy /= mag;
    float speed = 5;

    if (Michael.turretCount == 1) {
      projectiles.add(new Projectile(Michael.x, Michael.y, dx * speed, dy * speed));
    } else if (Michael.turretCount >= 2) {
      // Double shot logic
      projectiles.add(new Projectile(Michael.x - 10, Michael.y, dx * speed, dy * speed));
      projectiles.add(new Projectile(Michael.x + 10, Michael.y, dx * speed, dy * speed));
    }
  }
} 

void scorePanel() {
  fill(127, 200);
  rectMode(CENTER);
  noStroke();
  rect(width/2, 15, width, 30);
  fill(255);
  textSize(20); 
  textAlign(CENTER);
  text("Score: " + score, width/2, 25);
  text("Health: " + Michael.health, width/2 - 150, 25);
  text("Ammo: " + Michael.laserCount, width/2 + 150, 25);
}
