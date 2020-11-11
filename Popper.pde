class Popper {
  
  PShape popper;
  
  float xPosition;
  float yPosition;
  

  Popper(float initXposition, float initYposition) {
    
    xPosition = initXposition;
    yPosition = initYposition;
    
  }
  
  void load(){
    popper = loadShape("popper.svg");
  }
  
  void display(){ 
    shape(popper, xPosition, yPosition, width, height);
  }
  
  void update(){
   
  }
  
}
