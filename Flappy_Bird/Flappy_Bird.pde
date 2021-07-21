//Dev Viren Vora
//Francisco Salazar Andrade
//******************* Flappy Bird**********************//

//******************* Bugs Present*********************//
//Bird is behind the pipes - it needs to be in front of the pipes, to be able to successfully detect collision

int bgx, bgy;

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
      break;
  }
  
}
