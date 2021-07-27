//Dev Viren Vora
//Francisco Salazar Andrade
//******************* Flappy Bird**********************//

//******************* Bugs Present*********************//
//Bird is behind the pipes - it needs to be in front of the pipes, to be able to successfully detect collision

import processing.sound.*;
SoundFile flap, coinCollect, pipeCrash, screenCrash;

int bgx, bgy;

int score;

SetScene sc;
//Pipes pipes;
Bird bird;
int start;

void setup() {
  size(960, 544);
  //Loading the constructor inside setup
  sc = new SetScene();
  sc.setStartScreen();
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
      sc.setStartScreen();
      sc.startGame(start);
      break;
    case 1:
      sc.setGameScene();
      break;
    case 2:
      sc.setEndScreen();
      //sc.endGame(start);
      //sc.menu(start);
      sc.setEndGame(start);
      break;
      case 3:
      exit();
      break;
  }
  
}
