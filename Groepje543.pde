//Team 24 Hylke Jellema s2192098, Rachel den Otter s2610973, Thomas van Klink s2555913 and Sterre Kuijper s2402858
Popper popper;
PImage front;
PImage background;
float stage;

void setup() {
  size(1200, 900);
  shapeMode(CENTER);
  stage = 1;
  front = loadImage("front.png");
  popper = new Popper(width/2, height/2);
  background = loadImage("background.png");
  popper.load();
}

void draw() {
  if (stage==1) {
    image(front, 600, 0, 600, 900);
    if (keyPressed) {
      setStage(2);
    }
  }
  if (stage==2) {
    image(background, 0, 0, 1200, 900);
    line(600, 0, 600, 900);
    popper.display();
  }
}

void setStage(int stage) {
  this.stage = stage;
}

void mousePressed() {
  popper.pull(mouseX,mouseY);
}
