class SetScene {

  Pipes pipes;
  Bird bird;
  PVector posName, posPlay, posNameEnd, posGameOver, posMenu, posExit,bgMove,posBg ;
  PImage bg, name, startGameButton, gameOver, menu, exit;
  int n = 0;

  public SetScene() {
    //Start Screen
    posName = new PVector((width/3+100), 200);
    posPlay = new PVector((width/3+120), 300);
    
    //End Screen
    posNameEnd = new PVector((width/3+100), 100);
    posGameOver = new PVector((width/3+100), 170);
    posMenu = new PVector((width/3+100), 250);
    posExit = new PVector((width/3+150), 250);
    
    //Loading the Images
    bg = loadImage("data/bg.png");
    name = loadImage("data/name.png");
    startGameButton = loadImage("data/startgamebutton.png");
    gameOver = loadImage("data/gameover.png");
    menu = loadImage("data/menu.png");
    exit = loadImage("data/exit.png");
    
    //Game Screen
    bgMove = new PVector(1,0);
    posBg = new PVector(0,0);
    
    pipes = new Pipes();
  

    bird = new Bird(50, 200, 40, 40);
  
    pipes.initialisePipes();
  }
  
  

//Start Screen
  void setStartScreen() {
    image(bg, 0, 0);
    image(name, posName.x, posName.y);
    image(startGameButton, posPlay.x, posPlay.y);
    //message saying press any key to start
  }

  void startGame(int start) {
    //once a key is input boolean is true and the game starts
    if (key == CODED) {
      start = 1;
      setGameScene();
      pipes.drawPipes();
      bird.activate(); 
      bird.collide(pipes);
    }
  }
  
  //Game State
    // This is to set the animated background
  void setGameScene() {
    background(0);
    image(bg, posBg.x, posBg.y);
    image(bg, posBg.x+bg.width, posBg.y);

    // this is to move the the image by 1 unit to show the animation
    posBg.sub(bgMove);
    

    //Resets the image, once the first image is done
    if (posBg.x < -bg.width) {
      posBg.x=0;
    }
  }

//End Screen
  void setEndScreen() {
    image(bg, 0, 0);
    image(name, posNameEnd.x, posNameEnd.y);
    image(gameOver, posGameOver.x, posGameOver.y);
    image(menu, posMenu.x, posMenu.y); 
    image(exit, posExit.x, posExit.y);
  }
  
  void endGame(){
    if (key == CODED) {
      if (keyPressed) {
        if (keyCode == SHIFT) {
          if (posExit.x + exit.width >= mouseX &&
            mouseX >= posExit.x && 
            posExit.y + exit.height >= mouseY &&
            mouseY >= posExit.y) {
            println("Exit" + n);
            n++;
          }
        }
      }
    }
  }
  
  void menu(){
      if (key == CODED) {
      if (keyPressed) {
        if (keyCode == SHIFT) {
          if (posMenu.x + menu.width >= mouseX &&
            mouseX >= posMenu.x && 
            posMenu.y + menu.height >= mouseY &&
            mouseY >= posMenu.y) {
            println("Menu" + n);
            n++;
          }
        }
      }
    }
  }
  
}
