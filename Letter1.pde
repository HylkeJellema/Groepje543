class Letter1 extends Letter {
  
  PFont myFont;
  
  
  Letter1(float x, float y, char letter, PFont myFont) {
    super(x, y, letter);
    this.myFont = myFont;
  }
  
  void display() {
    fill(232, 123, 33);
    textFont(myFont);
    super.display();
  }
}
