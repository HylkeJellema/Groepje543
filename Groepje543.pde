/* 
PPC November 2020
- A interactive birthday cart with animated confetti and customizable text
by
Team 24
Hylke Jellema s2192098, Rachel den Otter s2610973, Thomas van Klink s2555913 and Sterre Kuijper s2402858
*/

Popper popper;
Gift gift;
PImage front;
PImage background;
float stage;
boolean nextStage;

void setup() {
  size(1200, 900);
  shapeMode(CENTER);
  background = loadImage("background.png");
  front = loadImage("front.png");
  stage = 1;
  nextStage = false;
  popper = new Popper(width/4, height/2);
  popper.load();
  gift = new Gift();
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
    gift.display();
    stroke(0);
    line(600, 0, 600, 900);
    popper.display();
  }
  
  
}

void keyPressed() {
  //go to next stage on key press
  nextStage = true;
}

void mousePressed() {
  //Pop the Popper when you pull (click) on the Popper only when the card is open.
  if (stage == 2){
    popper.pull(mouseX,mouseY);
  }
  
  //popper.text.setShake(true);
}

void mouseReleased() {
  //popper.text.setShake(false);
}

void mouseMoved() {
  //Highlight around mouse
  background.loadPixels();
  for (int x = 0; x < width; x++){
    for (int y = 0; y < height; y++){
      int location = x+y*width;
      float r = red(background.pixels[location]);
      float g = green(background.pixels[location]);
      float b = blue(background.pixels[location]);
      float distance = dist(mouseX, mouseY, x,y);
      float range = map(distance,0,200,2,0);
      pixels[location] = color(r*range, g*range, b*range);
    }
  }
  updatePixels();
 }

void mouseDragged(){
  gift.shake(mouseX,mouseY); 
}
