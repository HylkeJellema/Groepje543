class Letter {
  char letter;
  float homex,homey;
  float x,y;
  
  Letter(float x, float y, char letter) {
    homex = this.x = x;
    homey = this.y = y;
    this.letter = letter;
  }
  
  void display() {
    fill(0);
    textAlign(LEFT);
    textSize(50);
    text(letter,x,y);
  }
  
  void shake() {
    x += random(-2,2);
    y += random(-2,2);
  }
  
  void home() { 
    x = homex;
    y = homey;
  }
}
