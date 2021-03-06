public class EndScreen
{
  //attributes
  PVector  posNameEnd, posGameOver, posMenu, posExit;
  PImage bg, name, gameOver, menu, exit;
  
  //constructor
  public EndScreen(){
  
    //End Screen
    posNameEnd = new PVector((width/3+100), 100);
    posGameOver = new PVector((width/3+100), 170);
    posMenu = new PVector((width/3+60), 250);
    posExit = new PVector((width/3+150), 250);
    
    //Loading the Images
    bg = loadImage("data/bg.png");
    name = loadImage("data/name.png");
    gameOver = loadImage("data/gameover.png");
    menu = loadImage("data/menu.png");
    exit = loadImage("data/exit.png");
  }
  
  //methods
  //End Screen
  public void setEndScreen() {
    image(bg, 0, 0);
    image(name, posNameEnd.x, posNameEnd.y);
    image(gameOver, posGameOver.x, posGameOver.y);
    image(menu, posMenu.x, posMenu.y); 
    menu.resize(80,40);
    image(exit, posExit.x, posExit.y);
    exit.resize(80,40);
    textSize(24);
    fill(255);
    text("Score: "+score, 10,20);
  }
  
  //resets the game
  public void reset()
  {
    frameCount = -1;
    screen = 0;
    score = 0;
  }

  //function to determine click and choice at the end of game
  public void endChoice() {
    //back to start screen
    if (posMenu.x + menu.width >= mouseX &&
      mouseX >= posMenu.x && 
      posMenu.y + menu.height >= mouseY &&
      mouseY >= posMenu.y) {
        reset();
    } 
    //exit the game
    else if (posExit.x + exit.width >= mouseX &&
      mouseX >= posExit.x && 
      posExit.y + exit.height >= mouseY &&
      mouseY >= posExit.y) {
        screen = 3;
    }
  }
}
