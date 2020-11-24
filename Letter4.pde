class Letter4 extends Letter {

  PFont myFont;


  Letter4(float x, float y, char letter, PFont myFont) {
    super(x, y, letter);
    this.myFont = myFont;
  }

  void display() {
    fill(206, 249, 255);
    textFont(myFont);
    super.display();
  }

  void shake() {
    letterSize = lerp(letterSize, letterSize+40, 0.01);
    x = lerp(x, x+50, 0.02);
    y = lerp(y, y-50, 0.02);
    x += random(-1, 1);
    y += random(-1, 1);
  }
}
