/*
*May 31, 2019
*Created By: Nicholas Ruppel
*Block Breaking Game/Enginine
*/
class BlockPlacement{

int blockWidth = 78,
      blockHeight = 30,
      blockAdd =0,
      block[][]= new int[5][5];


BlockPlacement(){

}
void Spawn(){
  display();
  
}
void display(){
colorMode(HSB, 100);
noStroke();
BlockDispay();
if(blockAdd==25){
println("you Win");
    playerLength=player.playerWidth;
    ball.ballPos.x=200;
    ball.ballPos.y=300;
    player.xpos.x=player.playStartX;
    BlockInit();
    blockAdd=0;
    playing=false;

}
      

}

void BlockDispay(){

float blockX,
      blockY;
      
     for(int y = 0; y< 5; y++){ 
    
    for(int x = 0; x< 5; x++){
      
        blockX = x * (blockWidth +2);  
        fill(y*15, 100,100);
    blockY = 50 +y *(blockHeight + 2);
    BlockHitCheck( x,  y,  blockX,  blockY);
    if(block[x][y] !=0){
    rect(blockX,blockY,blockWidth,blockHeight, 2);
   
    }
    
      }
    }
  }
  void BlockInit(){
      for(int y = 0; y < 5;y++){
          for(int x = 0; x < 5; x++){
              block[x][y]=1;
          }
         
      }
           
  }
void BlockHitCheck(int x, int y, float blockX, float blockY){
  float x1 = ball.ballPos.x-blockX;
  float x2 = blockX + blockWidth-ball.ballPos.x;
  float y1 = ball.ballPos.y-blockY;
  float y2 = blockY+blockHeight-ball.ballPos.y;
  float xMin,yMin;
 
  
  if(block[x][y] !=0){
    if( x1 >0  && x2 >0&&  y1>0 && y2>0 ){
      block[x][y]=0;
     blockAdd++;
     // println(blockAdd);
      xMin = min(x1, x2);
      yMin= min(y1,y2);
      
     
      if(xMin<=yMin){
         ball.ballPosVel.x *= -1;
      }
      else{
       ball.ballPosVel.y *= -1;
      }
    
     
     
    }
    
  
  }
}  

}
