class Text {
  String[] lines;
  String text;
  String[] words;
  Letter[] letters;

  Text() {
    lines = loadStrings("text.txt");
    text = join(lines, " ");
    words = split(text, " ");
    letters = new Letter[text.length()];

    int x = 100;    
    for (int i = 0; i < text.length (); i ++ ) {
      letters[i] = new Letter(x, 100, text.charAt(i)); 
      x += textWidth(text.charAt(i));
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
