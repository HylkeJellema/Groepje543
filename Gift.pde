//class gift contains an easter egg. drag your mouse over the third gift to open it and reveal the duck inside
class Gift {
  PImage gift;
  PImage duck;
  float x, y;
  boolean open = false;

  Gift() {
    gift = loadImage("gift.png");
    duck = loadImage("duck.png");
    x = 755;
    y = 710;
  }

  //displays the duck when opened or the box when not yet opened
  void display() {
    if (open) {
      image(duck, x-45, y+40, 200, 200);
    } else {
      image(gift, x, y, 200, 200);
    }
  }

  //set open when the mouse is over the gift
  void shake(float Xmouse, float Ymouse) {
    if ((Xmouse <= x+50) && (Xmouse >= x-50) && (Ymouse <=y+50) && (Ymouse >= y-50)) {
      open = true;
    }
  }
}
