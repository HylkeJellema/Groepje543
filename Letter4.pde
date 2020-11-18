class Letter4 extends Letter {
  
  PFont myFont;
  
  
  Letter4(float x, float y, char letter, PFont myFont) {
    super(x, y, letter);
    this.myFont = myFont;
  }
  
  void display() {
    fill(13, 134, 252);
    textFont(myFont);
    super.display();
  }
}
