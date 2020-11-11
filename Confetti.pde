/*
Class for the confetti particles 
Based on Daniel Shiffmans example. https://processing.org/examples/simpleparticlesystem.html
*/

class Confetti {
  
  PVector position;
  PVector speed;
  PVector acceleration;
  float lifespan;
  float r;
  float g;
  float b;
  int confettiSize = 15; //Size of the confetti in px.

  Confetti(PVector l) {
    acceleration = new PVector(0.1, -0.1);
    speed = new PVector(random(-2, 2), random(-2, 0));
    position = l.copy();
    lifespan = 255.0;
    r = random(0,255); //Create a random set of RGB values for the particles
    g = random(0,255);
    b = random(0,255);
  }

  void run() {
    update();
    display();
  }

  void update() {
    speed.add(acceleration);
    position.add(speed);
    lifespan -= 1.0;
  }

  void display() {
    stroke(r,g,b, lifespan); //Opacity of particles is terdermined by their lifespan. They fade out.
    fill(r,g,b, lifespan);
    ellipse(position.x, position.y, confettiSize, confettiSize);
  }

  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
