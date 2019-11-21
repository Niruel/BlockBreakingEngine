/*
*May 31, 2019
*Created By: Nicholas Ruppel
*Block Breaking Game/Enginine
2 color wheels that change ball color and player color with Control P5 library
button to freeze player pos and ball pos 
sliders for ball speed and width and player width
*/
import ddf.minim.*;
import controlP5.*;

ControlP5 cp5;



Player player;
BlockPlacement placeBlock;
Ball ball;
Audio audio;
Range range;


boolean playing= false;
int c, c2 = color(100),
       ballSize = 0,  
       ballSpeed =0,
       playerLength =0,
       playerSpeed = 0;
 




void setup(){

  size(950,500); 
  noStroke();
  player = new Player();
  placeBlock = new BlockPlacement();
  ball = new Ball();
  audio = new Audio();
  placeBlock.BlockInit();
  audio.PlayAudio(this);
  playing = true;
 
     
  cp5 = new ControlP5(this);
 
          
  cp5.addColorWheel("c" , 510 , 100 , 200 ).setRGB(color(255,0,0));
  cp5.addColorWheel("c2" , 510 , 300 , 200 ).setRGB(color(255,120,255));

PImage[] imgs = {loadImage("button_a.png"),loadImage("button_b.png"),loadImage("button_c.png")};   
cp5.addButton("play")
     .setValue(128)
     .setPosition(650,10)
     .setImages(imgs)
     .updateSize()
     ;

    cp5.addSlider("ballSize")
     .setPosition(750,150)
     .setWidth(100)
     .setHeight(25)
     .setRange(ball.radius,20) // values can range from big to small as well
     .setValue(ball.radius)
     .setNumberOfTickMarks(10)
     .setSliderMode(Slider.FLEXIBLE)
     ; 
     
     
   cp5.addSlider("ballSpeed")
     .setPosition(750,200)
     .setWidth(100)
     .setHeight(25)
     .setRange(1,20) // values can range from big to small as well
     .setValue(ball.speed)
     .setNumberOfTickMarks(20)
     .setSliderMode(Slider.FLEXIBLE)
     ;
     
  cp5.addSlider("playerLength")
     .setPosition(750,250)
     .setWidth(100)
     .setHeight(25)
     .setRange(100,200) // values can range from big to small as well
     .setValue(player.playerWidth)
     .setNumberOfTickMarks(20)
     .setSliderMode(Slider.FLEXIBLE)
     ;
     
  cp5.addSlider("playerSpeed")
     .setPosition(750,300)
     .setWidth(100)
     .setHeight(25)
     .setRange(1,20) // values can range from big to small as well
     .setValue(player.speed)
     .setNumberOfTickMarks(20)
     .setSliderMode(Slider.FLEXIBLE)
     ;
 
}
 void draw(){
   background(0);
   text("Change Player & Ball Color", 510,98);
   
   
   stroke(40,100,100);
line(400,0,400,500);
   ball.display();
   player.Run();
   placeBlock.Spawn();
   
  
   
   if(!playing){
     ball.ballPosVel.x=0;
     ball.ballPosVel.y=0;
   }
   if(playerLength==0){
     playing=false;
     playerLength = player.playerWidth;
     player.xpos.x=player.playStartX;
    ball.ballPos.x=200;
    ball.ballPos.y=300;
    placeBlock.BlockInit();
   }
}

public void play(){
  if(!playing){
  playing=true;
  ball.ballPosVel.x=ballSpeed;
  ball.ballPosVel.y=ballSpeed;
  }
  else{
    playing=false;
    
  }
  
}





 
