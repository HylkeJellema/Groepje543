//Team 24 Hylke Jellema s2192098, Rachel den Otter s2610973, Thomas van Klink s2555913 and Sterre Kuijper s2402858
Popper popper;
PImage front;
PImage background;
float stage;

void setup() {
  size(600, 900);
  shapeMode(CENTER);
  popper = new Popper(height/2, width/2);
  front = loadImage("front.png");
  background = loadImage("background.png");
  popper.load();
}

void draw() {
  if (stage==1) {
    image(front, 0, 0, 600, 900);
    if (keyPressed) {
      stage = stage + 1;
    }
  }
  if (stage==2) {
    image(background, 0, 0, 600, 900);
    popper.display();
  }
}

void mousePressed() {
}
