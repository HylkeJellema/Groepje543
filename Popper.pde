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
  boolean pulledAlready = false;
  float timer;
  
  
  Popper(float initXposition, float initYposition) {
    
    xPosition = initXposition;
    yPosition = initYposition;
    
    confetties = new ArrayList<Confetti>();
    origin = new PVector(xPosition-20,yPosition);
  }
  
  void load(){
    popper = loadShape("popper.svg");
    popperShade = loadShape("popper-shade.svg");
  }
  
  void display(){ 
    shape(popperShade, xPosition, yPosition, 600, 900); //Display bottom layer of Popper image first
    if(pulled && !pulledAlready){
      if(timer < 300){
        run();
      }
      if(timer < 100){
        addConfetti(); //Draw confetti inbetween
      }
      timer();
    }
    shape(popper, xPosition, yPosition, 600, 900); //Display top layer of Popper image
    println(timer);
  }
  
  void pull(float tempMouseX, float tempMouseY) {
   if((tempMouseX <= xPosition+200) && (tempMouseX >= xPosition-200) && (tempMouseY <=yPosition+200) && (tempMouseY >= yPosition-200)){
      pulled = true;
     }
  }
  
  void timer(){
    if(timer > 250){
      timer=0;
      pulled=false;
      pulledAlready=true;
    } else {
      timer++;
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
