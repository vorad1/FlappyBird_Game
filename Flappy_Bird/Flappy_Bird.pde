//Dev Viren Vora
//Francisco Salazar Andrade
//******************* Flappy Bird**********************//

//******************* Bugs Present*********************//
//Bird is behind the pipes - it needs to be in front of the pipes, to be able to successfully detect collision

int bgx, bgy;

SetScene sc;
//Pipes pipes;
//Bird bird;
boolean start;

void setup() {
  size(960, 544);
  //Loading the constructor inside setup
  sc = new SetScene();
  sc.setStartScreen();
  start= false;
}

void draw() {
  clear();
  if(!start) {
    sc.setStartScreen();
    sc.startGame(start);
  } 
  else{  
    sc.setGameScene();
  }
}
