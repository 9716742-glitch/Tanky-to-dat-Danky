// 1 April 2026 | TankGame By Ruby Collins-Peynaud
Tank Michael;
Obstacle o1;
Obstacle o2;
Obstacle o3;
PImage bg;

void setup() {
  size(1000,1000);
  bg = loadImage("bkgd.png");
  Michael = new Tank();
  o1 = new Obstacle(400,100,100,50,5,100);
  o2 = new Obstacle(600,100,100,50,5,100);
  o3 = new Obstacle(200,100,100,50,5,100);
}

void draw() {
  background (127);
  imageMode(CENTER);
  image(bg,0,0);
  o1.display();
  o1.move();
  o2.display();
  o2.move();
  o3.display();
  o3.move();
  Michael.display();
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
