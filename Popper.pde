/*
Class for the Popper
Particle system based on Daniel Shiffmans example. https://processing.org/examples/simpleparticlesystem.html
*/

class Popper {
  
  PShape popper;
  PShape popperShade;
  float popperScale = 1;
  
  float xPosition;
  float yPosition;
  
  ArrayList<Confetti> confetties;
  PVector origin;
  
  boolean pulled = false;
  boolean pulledAlready = false;
  int timer;
  
  Text text; //Use Text class
  
  Popper(float initXposition, float initYposition) {
    
    xPosition = initXposition;
    yPosition = initYposition;
    
    //xText = initXposition;
    //yText = initYposition;
    
    confetties = new ArrayList<Confetti>(); //Arraylist for the confetti particles
    origin = new PVector(xPosition-20,yPosition); //Vector used as origin of the particles
    
    text = new Text(xPosition-100, yPosition-200); //Create text object
  }
  
  void load(){ //Loading images (svg's)
    popper = loadShape("popper.svg");
    popperShade = loadShape("popper-shade.svg");
  }
  
  void display(){
    pushMatrix();
    translate(xPosition,yPosition);
    scale(popperScale);
    shape(popperShade, 0, 0, 600, 900); //Display bottom layer of Popper image first
    popMatrix();
    
    if(pulled && !pulledAlready){ //Launch confetti if popper is pulled and has not been pulled already.
      if(timer < 300){
        run(); //Animating confetti, this runs slightly longer then addConfetti() to let the confetti fly away before hiding.
        
      }
      if(timer < 100){
        addConfetti(); //Spawining confetti inbetween the two shapes
        text.shake = true;
      }
      timer(); //Run the timer.
      scaling(); //Run the scaling animation.
    }
    
    text.display(); //Display text in between Popper layers
    
    pushMatrix();
    translate(xPosition,yPosition);
    scale(popperScale);
    shape(popper, 0, 0, 600, 900); //Display top layer of Popper image
    popMatrix();
    
  }
  
  void pull(float tempMouseX, float tempMouseY) { //Set pulled to true if the mouse is pressed over the popper.
   if((tempMouseX <= xPosition+200) && (tempMouseX >= xPosition-200) && (tempMouseY <=yPosition+200) && (tempMouseY >= yPosition-200)){
      pulled = true; 
     }
  }
  
  void timer(){
    if(timer > 250){ //If timer is over 250 frames (about 4 seconds) reset it
      timer=0;
      pulled=false;
      pulledAlready=true; //Store that the Popper has been popped.
    } else {
      timer++; //Runs timer by adding 1 unit every frame
    }
    
    if (timer > 150){
      text.shake=false;
      text.home=true;
    } 
  }
  
  void scaling(){
    if(timer < 15){ //Scale the Popper up if timer is below 15 frames
      popperScale = popperScale + 0.03;
    } else if (timer > 15 && popperScale > 1){ //Scale the Popper back to it's original state.
      popperScale = popperScale - 0.03;
    }
  }
  
  void addConfetti(){
     confetties.add(new Confetti(origin)); //Spawn particles from origin of Popper.
  }
  
  void run() { //Animate confetti 
    for (int i = confetties.size()-1; i >= 0; i--) {
      Confetti c = confetties.get(i);
      c.run();
      if (c.isDead()) {
        confetties.remove(i);
      }
    }
  }
  
}
