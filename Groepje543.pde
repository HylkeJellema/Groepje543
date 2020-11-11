//Team 24 Hylke Jellema s2192098, Rachel den Otter s2610973, Thomas van Klink s2555913 and Sterre Kuijper s2402858
Popper popper;
PImage background;

void setup() {
  size(600, 900);
  popper = new Popper(height/2, width/2);
  background = loadImage("background.png");
}

void draw() {
  popper.display();
  image(background, 0, 0, 600, 900);
}

void mousePressed(){
  
}
