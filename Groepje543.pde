//Team 24 Hylke Jellema s2192098, Rachel den Otter s2610973, Thomas van Klink s2555913 and Sterre Kuijper s2402858
Popper popper;
PImage front;
PImage background;
float stage;
boolean nextStage;

Text text;

void setup() {
  size(1200, 900);
  shapeMode(CENTER);
  background = loadImage("background.png");
  front = loadImage("front.png");
  stage = 1;
  nextStage = false;
  popper = new Popper(width/4, height/2);
  popper.load();

  text = new Text();
}

void draw() {
  //show the front of the card in the first stage
  if (stage==1) {
    textSize(17);
    text("A birthday card by Hylke, Rachel, Sterre and Thomas.", 60, 700);
    text("press any key to open the card", 60, 800);
    image(front, 600, 0, 600, 900);
    //press any key to go to inside
    if (nextStage) {
      stage = stage + 1;
    }
  }
  //show the inside of the card in the second stage
  if (stage==2) {
    image(background, 0, 0, 1200, 900);
    stroke(0);
    line(600, 0, 600, 900);
    popper.display();
    text.display();
  }
}

void keyPressed() {
  //go to next stage on key press
  nextStage = true;
}

void mousePressed() {
  popper.pull(mouseX, mouseY);
  text.setShake(true);
}

void mouseReleased() {
  text.setShake(false);
}
