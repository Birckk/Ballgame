class ScreenState{
  int currentState  = 0;
  
  int startState    = 0;
  int playState     = 1;
  int settingsState = 2;

  ScreenState(){
    lg = loadImage("lose.png");
    wg = loadImage("win.png");
    femp = loadImage("5p.png");
    tried = loadImage("tried.png");
    qr = loadImage("qr.png");
    

    setStartState();
  }



  void setStartState(){
    currentState = startState;
    background(lg);

  }

  void startStateLoop(){
    text("Press S to start game", width/2-100,height/8);
    text("press T to enter settings", width/2-100,height/8-15);

    if (keyPressed) {
      if (key == 's' || key == 'S'){
        setPlayState();
      }else if (key == 't' || key == 'T'){
        setSettingsState();
      }         
    }
  }



  void setPlayState(){
    currentState = playState;
    fill(0,255,0);               
    ball = new Ball(75);
    lives=5;
    score=0;
    lost=false;
  }

  void playStateLoop(){
    background(lg);
    ball.render();//liv og score og checker om man er død
    text("score = "+score,10,20);                  
    text("lives = "+lives,width-80,20);    
    text("surprises at 5, 10 and 15 points",width/2-width/6+5,height/8);
    text("highscore = "+Hscore, width/2-50, 20);
    text("press t for settings", 20,780);

  if (keyPressed) {
      if (key == 't' || key == 'T'){
        setSettingsState();
      } 
  }

    if (Hscore < score) {
      Hscore = score;
    }

    if (lives<=0) {
      if (score >= 20) {
        background(qr);
        textSize(20);
        text("Click to Restart", width/2-60,height/8);
        noLoop();                                    
        lost=true;
        textSize(18);
      }else if (score >= 15){
        background(qr);
        textSize(20);
        text("Click to Restart", width/2-60,height/8);
        noLoop();                                    
        lost=true;
        textSize(18);
      }else if (score >= 10){
        background(wg);
        textSize(20);
        text("Click to Restart", width/2-60,height/8);
        noLoop();                                    
        lost=true;
        textSize(18);
      }else if (score >= 9){
        image(movie, 0, 0);
        movie.play();
        textSize(20);
        text("Click to Restart", width/2-60,height/8);                                   
        lost=true;
        textSize(18);
      }else if (score >= 5){
        background(femp);
        textSize(20);
        text("Click to Restart", width/2-60,height/8);
        noLoop();                                    
        lost=true;
        textSize(18);
      }else{
        background(tried);
        textSize(20);
        text("Click to Restart", width/2-60,height/8);
        noLoop();                                    
        lost=true;
        textSize(18);
      }
    }

  }



  void setSettingsState(){
    currentState = settingsState;
    background(0);
  }

  void settingsStateLoop(){
    background(qr);
    text("press r to decrease volume", width/2-100,height/8);
    text("press e to increase volume", width/2-100,height/8-15);
    text("press q to return", width/2-100,height/8-30);
    if (keyPressed) {
      if ((key == 'e' || key == 'E') && (Mvolume>=0 && Mvolume<1)){
        Mvolume+=0.01;
        file.amp(Mvolume);
        println(Mvolume);
      }
      } else if ((key == 'r' || key == 'R') && (Mvolume>0 && Mvolume<=1)){
        Mvolume-=0.01;
        file.amp(Mvolume);
        println(Mvolume);
      }
      if (key == 'q' || key == 'Q'){
         setPlayState();
      }
}


}