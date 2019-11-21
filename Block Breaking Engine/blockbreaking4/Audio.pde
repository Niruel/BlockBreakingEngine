/*
*May 31, 2019
*Created By: Nicholas Ruppel
*Block Breaking Game/Enginine
*/
class Audio{

  Minim minim;
  AudioPlayer groove;
  
void PlayAudio(PApplet app){
   minim = new Minim(app);
   groove = minim.loadFile("bensound-moose.mp3", 2048);
   groove.loop();
  }
}
