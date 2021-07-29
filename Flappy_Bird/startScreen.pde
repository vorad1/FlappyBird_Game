class startScreen{
  PImage bg,name,startGameButton;
  PVector posName,posPlay,posText;

  public startScreen(){
  
    //Start Screen
    posName = new PVector((width/3+100), 200);
    posPlay = new PVector((width/3+120), 300);
    posText = new PVector((width/3-110), 380);
    
   //Loading the Images
    bg = loadImage("data/bg.png");
    name = loadImage("data/name.png");
    startGameButton = loadImage("data/startgamebutton.png");
    
    
  }
  
  //Start Screen
  void setStartScreen() {
    image(bg, 0, 0);
    image(name, posName.x, posName.y);
    image(startGameButton, posPlay.x, posPlay.y);
    textSize(20);
    fill(245, 245, 245, 150);
    text("Tap the Up arrow to start the game and move the bird", posText.x, posText.y);
    //message saying press any key to start
    textSize(24);
    fill(255);
    text("Score: "+score, 10,20);
  }

  void startGame() {
    //once a key is input int to decide which screen is shown
    if (key == CODED) {
      start = 1;
    }
  }

}
