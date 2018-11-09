/*
Three different states for each of the menus. some different backgrounds with scores of  0,5,10,15 and a secret at score 9.

Danish
den er opbygget med tre tilstande: start, play og settingstate
Der er forskellige baggrunde for scorene 0,5,10,15
Der er også en hemmelighed hvis man får præcist 9 i score

settings kan styre volume
hav en dejlig dag :)
*/

import processing.video.*; 
import processing.sound.*;

Ball ball;
Movie movie; 
SoundFile file;
int score=0;                   //noget score liv og en værdi til når man taber og vinder
int lives=5;   
int Hscore=0;
ScreenState screenState;
float Mvolume=0.05;
PImage wg;
PImage lg;
PImage femp;
PImage tried;
PImage qr;
boolean lost=false;    
String audioName = "swag.mp3";
String path;

void setup()                   
{
  screenState = new ScreenState();
  size (800,800,P2D);
  path = sketchPath(audioName);
  file = new SoundFile(this, "swag.mp3");
  file.amp(Mvolume);
  file2 = new SoundFile(this, "punch.mp3");
  file.loop();
  smooth();
  fill(0,255,0);               
  textSize(18);     
  movie = new Movie(this, "secretv2.mp4");
}

void movieEvent(Movie movie) {  
  movie.read();
}

void draw(){
  switch (screenState.currentState) {
    case 0:
      screenState.startStateLoop();
      break; 
    case 1:
      screenState.playStateLoop();
      break;

    case 2:
      screenState.settingsStateLoop(); 
      break;
  }

}

void mousePressed()                             
{
  if(screenState.currentState == 1){
    ball.mouseEvent();
    if (lost==true)                                
    {
      ball=new Ball(75);
      lives=5;
      score=0;
      lost=false;
      loop();                                    
    }
  }
}