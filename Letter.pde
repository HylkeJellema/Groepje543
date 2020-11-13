class Letter {
  char letter;
  float homeX,homeY;
  float x,y;
  
  Letter(float x, float y, char letter) {
    homeX = this.x = x;
    homeY = this.y = y;
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
    x = lerp(x, homeX, 0.1);
    y = lerp(y, homeY, 0.1);
  }
}
