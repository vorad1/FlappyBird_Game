public class GameScreen
{
  //attributes
  PVector bgMove,posBg;
  PImage bg;
  
  //objects
  Pipes pipes;
  Bird bird;
  Coin coin;
  
  //constructor
  public GameScreen()
  {
    //Game Screen
    bgMove = new PVector(1, 0);
    posBg = new PVector(0, 0);
  
    //Loading the Images
    bg = loadImage("data/bg.png");
  
    //initialize objects
    pipes = new Pipes();
    coin = new Coin();
    //sets initial bird position and size
    bird = new Bird(50, 200, 40, 40);

    //intial pipe and coin positions
    pipes.initialisePipes();
    coin.spawn(pipes);
  }
  
  //methods
  //activate game
  public void activateGame()
  {
    bgMove();
    drawObject();
  }
  
  //moves the screen
  public void bgMove()
  {
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

  //runs the main object functions
  public void drawObject()
  {
    pipes.drawPipes();
    bird.activate(pipes);
    coin.move(bird,pipes);
    
    //shows the current score
    textSize(24);
    fill(255);
    text("Score: "+score, 10,20);
  }
}
