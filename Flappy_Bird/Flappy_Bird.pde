//Dev Viren Vora
//Francisco Salazar Andrade
//******************* Flappy Bird**********************//

//******************* Bugs Present*********************//


import processing.sound.*;
SoundFile flap, coinCollect, pipeCrash, screenCrash;

int bgx, bgy;

int score;

//Pipes pipes;
Bird bird;
int start;

startScreen ss;
gameScreen gs;
endScreen es;

void setup() {
  size(960, 544);
  //Loading the constructor inside setup

  ss = new startScreen();
  gs = new gameScreen();
  es = new endScreen();
  
  //sc.setStartScreen();
  //ss.setStartScreen();
  start= 0;
  flap = new SoundFile(this, "data/sfx_wing.wav");
  coinCollect = new SoundFile(this, "data/sfx_point.wav");
  pipeCrash = new SoundFile(this, "data/sfx_hit.wav");
  screenCrash = new SoundFile(this, "data/sfx_die.wav");
  score = 0;
  
  
}

void draw() {
  clear();
  switch(start){
    case 0:
      ss.setStartScreen();
      ss.startGame();
      break;
    case 1:
      gs.bgMove();
      gs.drawObject();
      break;
    case 2:
    println(start);
      es.setEndScreen();
      break;
    case 3:
      exit();
      break;
  }
  
}

public void mouseClicked()
{
  
      es.setEndGame();
}
