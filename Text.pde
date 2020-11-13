class Text {
  String[] lines;
  String text;
  String[] words;
  Letter[] letters;
  boolean shake;
  float x; 
  float y;
  
  Text(float initX, float initY) {
    lines = loadStrings("text.txt");
    text = join(lines, " ");
    words = split(text, " ");
    letters = new Letter[text.length()];

    x = initX;  
    y = initY;
    for (int i = 0; i < text.length (); i ++ ) {
      letters[i] = new Letter(x, y, text.charAt(i)); 
      x += textWidth(text.charAt(i)) *4;
    }
  }

  void display() {
    for (int i = 0; i < letters.length; i++) {
      letters[i].display();
      if (shake) {
        letters[i].shake();
      }
      //else {
      //  letters[i].home();
      //}
    }
  }

  void setShake(boolean shake) {
    this.shake = shake;
  }
}
