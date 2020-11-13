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
    x += random(-10, 10);
    y += random(-10, 10);
  }
  
  void home() { 
    x = lerp(x, homex, 0.1);
    y = lerp(y, homey, 0.1);
  }
}
