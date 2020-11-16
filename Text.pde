/*
Class for the Text
Based on Daniel Shiffmans Textbreakingup example. http://learningprocessing.com/examples/chp17/example-17-06-textbreakingup
*/

class Text {
  String[] lines;
  String text;
  String[] words;
  Letter[] letters;
  boolean shake;
  boolean home;
  float x; 
  float y;
  
  Text(float initX, float initY) {
    //load the text file into individual strings and split into words and letters
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

  //calls the functions from letters on specific actions
  void display() {
    //display individual letters from array
    for (int i = 0; i < letters.length; i++) {
      letters[i].display();
      if (shake) {
        letters[i].shake();    //shake called when boolean shake is true
      }
      else if(home){
        letters[i].home();     //otherwise home is called
      }
    }
  }

  //boolean shake is set from popper class when its clicked (see popper.display())
  void setShake(boolean shake) {
    this.shake = shake;
  }
}
