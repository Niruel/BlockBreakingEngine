/*
*May 31, 2019
*Created By: Nicholas Ruppel
*Block Breaking Game/Enginine
*/
class Player {

  int playerWidth=100,
      playerHeight=15,
      pPDir=1,
      pNDir= -1,
      pDir=0;
      
      
     
  float playerPosX,
        playStartX=200.0f,
        playerStartY=400.0f,
        speed= 7.0f;
       
 
  PVector xpos;
  
  
  Player(){
  xpos = new PVector(playStartX,playerStartY);
  
  }
  void Run(){
    display();
   
    
  }
  
  void display(){
    noStroke();
    if(pDir == pNDir){
        N_Move();
    }
    
    else if(pDir == pPDir){
        P_Move();
    }
    else {
      pDir =0;
    }
     //println(xpos.x,xpos.y);
   
   fill(c);
  //rectMode(CENTER);
  rect(xpos.x,xpos.y,playerLength,playerHeight);
  //rectMode(CORNER);
   ball.CheckPlayerHit();
  //println(xpos.x);
  }
  void N_Move(){
    xpos.x = xpos.x -playerSpeed;
     
      
       if (xpos.x <= 0){
          xpos.x = 0;
      }
  }
  void P_Move(){
      xpos.x = xpos.x + playerSpeed;
      
      if(xpos.x + playerLength >= 400 ){
         
         xpos.x = 400-playerLength;
      }
     
      
  }
  void UpdateWidth(float value){
    playerWidth += value; 
  }
}

void keyPressed(){
if(playing==true){
    if(key == CODED){
    
        if(keyCode == LEFT ){
           player.pDir=player.pNDir;
        }
        if(keyCode == RIGHT){
           player.pDir=player.pPDir;
        }
    }
    if(key == 'a'){
       player.pDir=player.pNDir;
    }
    if(key == 'd'){
       player.pDir=player.pPDir;
    }
   
}
}
void keyReleased(){
  
    if(key == CODED){
        if(keyCode == LEFT || keyCode == RIGHT){
            player.pDir =0;
        }  
    }
    if(key == 'a' || key == 'd'){
       player.pDir = 0;
    }
    
}
