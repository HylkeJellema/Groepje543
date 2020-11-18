class Letter3 extends Letter {

  PFont myFont;


  Letter3(float x, float y, char letter, PFont myFont) {
    super(x, y, letter);
    this.myFont = myFont;
  }

  void display() {
    fill(247, 241, 57);
    textFont(myFont);
    super.display();
  }

  void shake() {
    letterSize = lerp(letterSize, letterSize+40, 0.01);
    x = lerp(x, x+50, 0.02);
    y = lerp(y, y-50, 0.02);
    x += random(-10, 10);
    y += random(-10, 10);
  }
}
