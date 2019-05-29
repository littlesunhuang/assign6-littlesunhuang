class Dinosaur extends Enemy {
	// Requirement #4: Complete Dinosaur Class
  Dinosaur(float x, float y){
    super(x, y);
  }
  //void checkCollision(Player player){

  //  if(isHit(x, y, w, h, player.x, player.y, player.w, player.h)){

  //    player.hurt();

  //  }
  //}  
	final float TRIGGERED_SPEED_MULTIPLIER = 2;
  float currentSpeed = 1f;
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
    x+= currentSpeed;
    if(x+w > width || x < 0){
      currentSpeed*= -1; 
    }
    if(currentSpeed>0 && y==player.y && player.x>x+w){
      currentSpeed *= TRIGGERED_SPEED_MULTIPLIER;
    }else if(currentSpeed< 0 && y==player.y && player.x<x){
      currentSpeed *= TRIGGERED_SPEED_MULTIPLIER;
     
    }else if(currentSpeed> 0 && y==player.y && player.x<x){
      currentSpeed = 1;
      currentSpeed*= 1; 
     }else if(currentSpeed< 0 && y==player.y && player.x>x+w){
      currentSpeed = -1; 
      currentSpeed*= 1; 
     } 
     //x+= currentSpeed;
    
  }
	// HINT: Player Detection in update()
	/*
	float currentSpeed = speed
	If player is on the same row with me AND (it's on my right side when I'm going right OR on my left side when I'm going left){
		currentSpeed *= TRIGGERED_SPEED_MULTIPLIER
	}
	*/
  
}
