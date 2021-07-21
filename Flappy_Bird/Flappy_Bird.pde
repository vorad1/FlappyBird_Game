//Dev Viren Vora
//Francisco Salazar Andrade
//******************* Flappy Bird**********************//

//******************* Bugs Present*********************//
//Bird is behind the pipes - it needs to be in front of the pipes, to be able to successfully detect collision

int bgx, bgy;

SetScene sc;
Pipes pipes;
Bird bird;

void setup() {
  size(960, 544);
  //Loading the constructor inside setup
  sc = new SetScene();
  pipes = new Pipes();
  sc.setStartScreen();

  bird = new Bird(50, 200, 1.5, 100, 100);

  pipes.initialisePipes();
}

void draw() {
  //clear();
  ////bird.activate(); 
  //pipes.drawPipes();
}
