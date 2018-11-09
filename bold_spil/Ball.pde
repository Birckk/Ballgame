import processing.sound.*;
SoundFile file2;
class Ball{
  private int diameter;               //position, fart og retning
  private int yPos;                      
  private int xPos;                      
  private int speed;                 
  private int xDir;                    
  private int yDir;                   

  
  Ball (int dm){
    diameter=dm;  
    xPos=width/2;                
    yPos=height/2;                
    speed=1;
    xDir=1; 
    yDir=1;
    
  }
  

  void render (){

    ellipse(xPos, yPos,diameter,diameter); 
    xPos=xPos+(speed*xDir);                        
    if (xPos > width-20 || xPos<20)                
    {
      xDir=-xDir;                                 
    }
     yPos=yPos+(speed*yDir);                       
    if (yPos > width-20 || yPos<20)               
    {
      yDir=-yDir;                                  
    }
  }
  
  void mouseEvent(){
   if (dist(mouseX, mouseY, xPos, yPos)<=diameter/2)      // når man rammer øger farten og ikke rammer mister et liv
    {
      score=score+1;                           
      speed=speed+1;                               
      xDir = (random(-1,1) > 0) ? 1 : -1;
      yDir = (random(-1,1) > 0) ? 1 : -1;
      fill(random(255),random(255),random(255));
      file2.play();
      
    }
    else                                          
    {
      if (speed<1)                                 
      {
      speed=speed-1;
      }
      lives=lives-1;                               
    }
  }
  
  int getSpeed(){
    return speed;
  }
  
  int getxPos(){
    return xPos;
  }
  
  int getyPos(){
    return yPos;
  }
  
  int getxDir(){
    return xDir;
  }
  
  int getyDir(){
    return yDir;
  }
  
  int setSpeed(int x){
    speed = x;
    return speed;
  }
  
  int setxPos(int x){
    xPos += x;
    return xPos;
  }
  
  int setyPos(int x){
    yPos += x;
    return yPos;
  }
  
  int setxDir(int x){
    xDir += x;
    return xDir;
  }
  
  int setyDir(int x){
    yDir += x;
    return yDir;
  }
}