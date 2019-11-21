/*
*May 31, 2019
*Created By: Nicholas Ruppel
*Block Breaking Game/Enginine
*/
class Ball{
      
int radius = 10;

   
float speed= 3,
      currballPosY;
      
PVector ballPos = new PVector(200,300),
        ballPosVel = new PVector(ballSpeed,ballSpeed);   
void display(){
  
  noStroke();
    ellipseMode(CENTER);
  fill(c2);
  ellipse(ballPos.x, ballPos.y, ballSize, ballSize);
  ellipseMode(CORNER);
  MoveballPos();
   
  
  }
  
 void MoveballPos(){
 
    
   ballPos.add(ballPosVel);
   
    if (ballPos.x > 400-radius) {
      ballPos.x = 400-radius;
      ballPosVel.x *= -1;
    } else if (ballPos.x < radius) {
      ballPos.x = radius;
      ballPosVel.x *= -1;
    } else if (ballPos.y > height-radius) {
      ballPosVel.y *=1; 
      playerLength-=10;
      ballPos.x=200;
      ballPos.y=300;
       
    } else if (ballPos.y < radius) {
      ballPos.y = radius;
      ballPosVel.y *= -1;
    }
  
 }
 
void CheckPlayerHit(){
   float x1 = ballPos.x-player.xpos.x;
   float x2 = player.xpos.x + playerLength - ballPos.x;
   float y1 = ballPos.y-player.xpos.y;
   float y2 = player.xpos.y+player.playerHeight-ballPos.y;
   float xMin = min(x1, x2);
   float yMin = min(y1,y2);
   if( x1 >0  && x2 >0&&  y1>0 && y2>0 ){
    if(xMin<=yMin){
         ballPosVel.x =  -ballPosVel.x;
         
      }
      else{
       ballPosVel.y = -ballPosVel.y;
      }
   }
  
  
  }
  
}
