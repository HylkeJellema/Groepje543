class Text {
  String[] lines;
  String text;
  String[] words;
  Letter[] letters;

  Text(float initX, float initY) {
    lines = loadStrings("text.txt");
    text = join(lines, " ");
    words = split(text, " ");
    letters = new Letter[text.length()];

    float x = initX;  
    float y = initY;
    for (int i = 0; i < text.length (); i ++ ) {
      letters[i] = new Letter(x, y, text.charAt(i)); 
      x += textWidth(text.charAt(i)) *4;
    }
  }

  void display() {
    for (int i = 0; i < letters.length; i++) {
      letters[i].display();
      if (mousePressed) {
        letters[i].shake();
      } else {
        letters[i].home();
      }
    }
  }
}
