/*
Class for the Letter
Based on Daniel Shiffmans Textbreakingup example. http://learningprocessing.com/examples/chp17/example-17-06-textbreakingup
- Adapted Shiffmans shake and home methodes (lines 16-17, 33-45)
 */

class Letter {
  char letter;
  float homeX, homeY;
  float x, y;
  float letterSize;


  Letter(float x, float y, char letter) {
    homeX = this.x = x;
    homeY = this.y = y;
    this.letter = letter;
    letterSize = 0.00001;
  }

  void display() {
    textAlign(LEFT);
    textSize(letterSize);
    text(letter, x, y);
  }

  //letters lerp to specific place on the right side of card,
  //while also shaking randomly with x and y changes
  void shake() {
    //letterSize = lerp(letterSize,letterSize+40,0.01);
    //x = lerp(x, x+50, 0.02);
    //y = lerp(y, y-50, 0.02);
    //x += random(-10, 10);
    //y += random(-10, 10);
  }

  //letters end up at the right spot at the end of the confetti animation
  void home() { 
    x = lerp(x, homeX + width*1/3+100, 0.1);
    y = lerp(y, homeY, 0.1);
  }
}
