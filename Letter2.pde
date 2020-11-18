class Letter2 extends Letter {
  
  PFont myFont;
  
  
  Letter2(float x, float y, char letter, PFont myFont) {
    super(x, y, letter);
    this.myFont = myFont;
  }
  
  void display() {
    fill(69, 102, 191);
    textFont(myFont);
    super.display();
  }
}
