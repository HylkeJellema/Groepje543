//Team 24 Hylke Jellema s2192098, Rachel den Otter s2610973, Thomas van Klink s2555913 and Sterre Kuijper s2402858
Popper popper;
PImage background;

void setup() {
  size(1200, 900);
  shapeMode(CENTER);
  popper = new Popper(width/2, height/2);
  background = loadImage("background.png");
  popper.load();
}

void draw() {
  background(255);
  image(background, 0, 0, 600, 900);
  popper.display();
}

void mousePressed(){
  
}
