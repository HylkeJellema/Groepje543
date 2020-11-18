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
}
