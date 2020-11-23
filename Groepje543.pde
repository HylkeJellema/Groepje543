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
    //Load background pixel by pixel and change them after the popper.
    loadPixels();
    background.loadPixels();
    for (int x = 0; x < background.width; x++ ) {
      for (int y = 0; y < background.height; y++ ) {
        int loc = x + y*background.width;
        // Get the R,G,B values from image
        float r = red (background.pixels[loc]);
        float g = green (background.pixels[loc]);
        float b = blue (background.pixels[loc]);
        color c = color(r,g,b);
        color inverse = color(100-red(c), 100-green(c), 255-blue(c));
        if(popper.pulled == true & popper.timer < 20){
        background.pixels[loc] = color(inverse);
        } else {
          background.pixels[loc] = color(r,g,b);
        }
      }
    }
    background.updatePixels();
    image(background, 0, 0, width, height);
    
    gift.display();
    stroke(255);
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
}

void mouseDragged(){
  gift.shake(mouseX,mouseY); 
}

void mouseMoved(){
  
  
  
}
