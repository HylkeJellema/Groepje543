/*
Class for the confetti particles 
Based on Daniel Shiffmans example. https://processing.org/examples/simpleparticlesystem.html
- Used Shiffmans vectors (lines 9-11, 19-21, 33-37)
- Used Shiffmans lifespan system (lines 13, 23, 37, 46-52)
*/

class Confetti {  
  PVector position;
  PVector speed;
  PVector acceleration;
  float lifespan;
  int confettiSize = 15; //Size of the confetti in px.

  Confetti(PVector l) {
    acceleration = new PVector(0.1, -0.1);
    speed = new PVector(random(-2, 2), random(-2, 0));
    position = l.copy();
    lifespan = 255.0;
  }

  void run() { //Run the animating
    update();
    display();
  }

  void update() { //Animate the confetti
    speed.add(acceleration);
    position.add(speed);
    lifespan -= 1.0;
  }

  void display() {
   // color of confetti is the inverse from the background
    color c = background.get(int(position.x),int(position.y));
    color inverse = color(255-red(c), 255-green(c), 255-blue(c));
    fill(5*inverse, lifespan);    //inverse is amplified by five to make the colors lighter and more fun
    ellipse(position.x, position.y, confettiSize, confettiSize);
  }

  boolean isDead() { //If the confetties lifespan is over, it's dead. Boolean is used in Popper class to remove it from the ArrayList.
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
