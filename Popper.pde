/*
Class for the Popper
Particle system based on Daniel Shiffmans example. https://processing.org/examples/simpleparticlesystem.html
*/

class Popper {
  
  PShape popper;
  PShape popperShade;
  
  float xPosition;
  float yPosition;
  
  ArrayList<Confetti> confetties;
  PVector origin;
  
  boolean pulled = false;
  float timer;
  
  
  Popper(float initXposition, float initYposition) {
    
    xPosition = initXposition;
    yPosition = initYposition;
    
    confetties = new ArrayList<Confetti>();
    origin = new PVector(xPosition,yPosition);
  }
  
  void load(){
    popper = loadShape("popper.svg");
    popperShade = loadShape("popper-shade.svg");
  }
  
  void display(){ 
    shape(popperShade, xPosition, yPosition, 600, 900); //Display bottom layer of Popper image first
    addConfetti(); //Draw confetti inbetween
    if(pulled){
      run();
    }
    shape(popper, xPosition, yPosition, 600, 900); //Display top layer of Popper image
  }
  
  void pull(float tempMouseX, float tempMouseY) {
    if(){
      pulled = true;
    }
    
  }
  
  void addConfetti(){
     confetties.add(new Confetti(origin)); //Spawn particles from origin of Popper.
  }
  
  void run() {
    for (int i = confetties.size()-1; i >= 0; i--) {
      Confetti c = confetties.get(i);
      c.run();
      if (c.isDead()) {
        confetties.remove(i);
      }
    }
  }
  
}
