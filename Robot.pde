class Robot extends Enemy{

	// Requirement #5: Complete Dinosaur Class
  Laser laser;
  int laserTimer = 180 ;
	final int PLAYER_DETECT_RANGE_ROW = 2;
	final int LASER_COOLDOWN = 180;
	final int HAND_OFFSET_Y = 37;
	final int HAND_OFFSET_X_FORWARD = 64;
	final int HAND_OFFSET_X_BACKWARD = 16;

	// HINT: Player Detection in update()
  float speed = 2f;
  void display(){
    int direction = (speed>0)?RIGHT:LEFT;
    
    pushMatrix();
    translate(x,y);
    if(direction == RIGHT){
      scale(1,1);
      image(robot,0,0,w,h);
    }else{
      scale(-1,1);
      image(robot,-w, 0, w, h); 
    }
    popMatrix();
    laser.display();
  } 
  
  void update(){
    laser.update();
    laser.checkCollision(player);
    
    boolean checkY = false;
    boolean checkX = false;
    
    if( speed > 0 && x < player.x || speed < 0 && x > player.x ){
      checkX = true;
    }

    if( player.y >= y - PLAYER_DETECT_RANGE_ROW * SOIL_SIZE && player.y <= y + PLAYER_DETECT_RANGE_ROW * SOIL_SIZE){
      checkY = true ;
    }else{
      checkY = false;
    }    
  
    if( checkX && checkY ){
      
      if(laserTimer == LASER_COOLDOWN){ 
        laser.fire ( x + HAND_OFFSET_X_FORWARD , y + HAND_OFFSET_Y , player.x + SOIL_SIZE / 2 , player.y + SOIL_SIZE / 2 );
        laserTimer = 0 ;
      }
      
      if(laserTimer < LASER_COOLDOWN ){laserTimer++;}
      
      return;
      }else{
        
      x += speed ;
      if( x+SOIL_SIZE >= width || x <= 0){
      speed *= -1;
      
      }
    }
    
  }

  Robot(float x, float y){
  super(x,y);
    laser = new Laser();
  }
	/*

	boolean checkX = ( Is facing forward AND player's center point is in front of my hand point )
					OR ( Is facing backward AND player's center point (x + w/2) is in front of my hand point )

	boolean checkY = player is less than (or equal to) 2 rows higher or lower than me

	if(checkX AND checkY){
		Is laser's cooldown ready?
			True  > Fire laser from my hand!
			False > Don't do anything
	}else{
		Keep moving!
	}

	*/
}
