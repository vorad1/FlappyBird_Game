public class StartScreen
{
  //attributes
  PImage bg,name,startGameButton;
  PVector posName,posPlay,posText;

  //constructor
  public StartScreen()
  {
    //Start Screen
    posName = new PVector((width/3+100), 200);
    posPlay = new PVector((width/3+120), 300);
    posText = new PVector((width/3-110), 380);
    
   //Loading the Images
    bg = loadImage("data/bg.png");
    name = loadImage("data/name.png");
    startGameButton = loadImage("data/startgamebutton.png");
  }
  
  //methods
  //start screen activate
  public void activateStart()
  {
    setStartScreen();
    startGame();
  }
  
  //Start Screen
  public void setStartScreen() 
  {
    image(bg, 0, 0);
    image(name, posName.x, posName.y);
    image(startGameButton, posPlay.x, posPlay.y);
    textSize(20);
    fill(245, 245, 245, 150);
    text("Tap the Up arrow to start the game and move the bird", posText.x, posText.y);
    //message saying press any key to start
  }

  //function to start the game
  public void startGame() 
  {
    //once up key is input 'screen' changes to game screen value
    if (key == CODED) {
      if (keyCode == UP && keyPressed) {
        screen = 1;
      }
    }
  }

}
