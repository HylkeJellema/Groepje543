class Text {
 
  String[] lines;
  float x; 
  float y;
  TextLine[] lineObj;

  Text(float initX, float initY) {
    x = initX;  
    y = initY;
    //load the text file into individual strings and split into words and letters
    lines = loadStrings("text.txt");
    lineObj = new TextLine[lines.length];
    for (int i=0; i < lineObj.length; i++) {
      lineObj[i] = new TextLine(x, y+(60*i), lines[i]);
    }
  }

  //calls the functions from letters on specific actions
  void display() {
    for (int i = 0; i < lineObj.length; i++) {
      lineObj[i].display();
    }
  }

  //boolean shake is set from popper class when its clicked (see popper.display())
  void setShake(boolean shake) {
    for (int i = 0; i < lineObj.length; i++) {
      lineObj[i].setShake(shake);
    }
  }
  void setHome(boolean home) {
    for (int i = 0; i < lineObj.length; i++) {
      lineObj[i].setHome(home);
    }
  }
}
