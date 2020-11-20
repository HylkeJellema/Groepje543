/*
Class for the Text
 Based on Daniel Shiffmans Textbreakingup example. http://learningprocessing.com/examples/chp17/example-17-06-textbreakingup
 - Adapted Shiffmans draw methodes (lines 33-44)
 - Used initialization for letters (lines 20-30)
 */

class TextLine {
  String text;

  Letter[] letters;
  boolean shake;
  boolean home;
  float x; 
  float y;

  PFont font1, font2, font3, font4;

  TextLine(float initX, float initY, String text) {
    this.text = text;
    letters = new Letter[text.length()];

    font1 = createFont("BebasNeue-Regular.ttf", 50);
    font2 = loadFont("OldEnglishTextMT-50.vlw");
    font3 = loadFont("BookmanOldStyle-50.vlw");
    font4 = loadFont("CorbelLight-50.vlw");

    x = initX;  
    y = initY;

    for (int i = 0; i < text.length(); i ++) {
      int styleChooser = (i % 4) + 1;
      float fontWidth = 0;
      switch (styleChooser) {

      case 1: 
        {
          letters[i] = new Letter1(x, y, text.charAt(i), font1);
          fontWidth = textWidth(text.charAt(i))*5;          
          break;
        }

      case 2: 
        {
          letters[i] = new Letter2(x, y, text.charAt(i), font2);
          fontWidth = textWidth(text.charAt(i))*5;  
          break;
        }

      case 3: 
        {
          letters[i] = new Letter3(x, y, text.charAt(i), font3);
          fontWidth = textWidth(text.charAt(i))*5; 
          break;
        }

      case 4: 
        {
          letters[i] = new Letter4(x, y, text.charAt(i), font4);
          fontWidth = textWidth(text.charAt(i))*5;  
          break;
        }
      }
      x += fontWidth;
    }
  }
  //calls the functions from letters on specific actions
  void display() {
    //display individual letters from array
    for (int i = 0; i < letters.length; i++) {
      letters[i].display();
      if (shake) {
        letters[i].shake();    //shake called when boolean shake is true
      } else if (home) {
        letters[i].home();     //otherwise home is called
      }
    }
  }

  //boolean shake is set from popper class when its clicked (see popper.display())
  void setShake(boolean shake) {
    this.shake = shake;
  }
  void setHome(boolean home) {
    this.home=home;
  }
}
