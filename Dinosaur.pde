class Dinosaur extends Enemy {
  float TRIGGERED_SPEED_MULTIPLIER = 5;
  float currentSpeed = 1f;
	// Requirement #4: Complete Dinosaur Class
  Dinosaur(float x, float y){
  super(x, y);
  }
 
	
  
  void display(){
    int direction = (currentSpeed>0)?RIGHT:LEFT;
    
    pushMatrix();
    translate(x,y);
    if(direction == RIGHT){
      scale(1,1);
      image(dinosaur,0,0,w,h);
      //x+= currentSpeed;
    }else{
      scale(-1,1);
      image(dinosaur,0,0,-w,h);
     // x-= currentSpeed;
    }
    popMatrix();
  } 
  
  void update(){
   x += currentSpeed ;
    
    if( x+SOIL_SIZE >= width || x <= 0){
      currentSpeed *= -1;
      TRIGGERED_SPEED_MULTIPLIER *= -1;
    }
    
    if( y == player.y && currentSpeed > 0 && x < player.x || y == player.y && currentSpeed < 0 && x > player.x){
        x += TRIGGERED_SPEED_MULTIPLIER;
    }else{
      x += currentSpeed ;
    }
  }

}
