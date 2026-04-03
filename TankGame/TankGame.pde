// 1 April 2026 | TankGame By Ruby Collins-Peynaud
Tank Michael;

void setup() {
  size(500,500);
  Michael = new Tank();
}

void draw() {
  background(127);
  Michael.display();
}

void keyPressed() {
  if(key == 'w'){
    Michael.move('w');
  } else if(key == 's') {}
}
