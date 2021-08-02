import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.sound.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Flappy_Bird extends PApplet {

//Dev Viren Vora
//Francisco Salazar Andrade
//******************* Flappy Bird**********************//


//for the sounds

SoundFile flap, coinCollect, pipeCrash, screenCrash;

//to keep score
int score;
//to keep track of which game screen to show
int screen;

//different game screen object
StartScreen ss;
GameScreen gs;
EndScreen es;

public void setup() {
  //screen size decided for the game
  
  
  //initialize objects
  ss = new StartScreen();
  gs = new GameScreen();
  es = new EndScreen();
  
  //initialize global variables
  screen= 0;
  score = 0;
  
  //initialize sound
  flap = new SoundFile(this, "data/sfx_wing.wav");
  coinCollect = new SoundFile(this, "data/sfx_point.wav");
  pipeCrash = new SoundFile(this, "data/sfx_hit.wav");
  screenCrash = new SoundFile(this, "data/sfx_die.wav");
}

public void draw() {
  clear();
  //depending on the value of 'screen' something different will run
  switch(screen){
    case 0:
      ss.activateStart();
      break;
    case 1:
      gs.activateGame();
      break;
    case 2:
      es.setEndScreen();
      break;
    default:
      exit();
      break;
  }
}

public void mouseClicked()
{
  es.endChoice();
}
public class Bird
{
  //attributes
  //image
  PImage bird;
  //image array for animation
  PImage[] images = new PImage[3];
  //location
  PVector location;
  //jump and fall speed;
  float speed;
  //size
  PVector size;
  //jump
  boolean jumping;
  

  //pipe and coin objects
  Pipes pipes;
  Coin coin;

  //constructor
  public Bird(float x, float y, int w, int h)
  {
    //initialize bird attributes
    bird = loadImage("data/flappy_bird.png");
    location = new PVector(x, y);
    size = new PVector(w, h);
    
    //boolean to allow jumping
    jumping = false;
    
    //initialize objects
    pipes = new Pipes();
    coin = new Coin();
  }

  //method overload
  public Bird() 
  {
  }
  
  //methods
  //activate
  public void activate(Pipes pipes)
  {
    sprite();
    spawn();
    move();
    collide(pipes);
  }

  //sprite
  public void sprite()
  {
    for (int i = 0; i < images.length; i++) {
      images[i] = bird.get(i*(bird.width/images.length), 0, 
        (bird.width/images.length), bird.height); 
      images[i].resize(PApplet.parseInt(size.x), PApplet.parseInt(size.y));
    }
  }
  //spawn
  public void spawn()
  {
    image(images[0], location.x, location.y);
  }
  //jump and fall
  public void move()
  {
    //move the bird
    location.y+=speed;
    //make the bird jump
    if (key == CODED) {
        if (keyCode == UP && keyPressed) {
          //can the bird jump
          if (!jumping) {
            //going up
            speed = -10;
            //animate
            image(images[1], location.x, location.y);
            //disallow jumping while already jumping
            flap.play();
            jumping = true;
          }
        }
        //fall
       else if (!keyPressed) {
         speed = 5;
         speed++;
         image(images[2], location.x, location.y-7);
         jumping = false;
      }
    }
  }
  //collide 
  public void collide(Pipes pipes)
  {
    //edge collision
    if(location.y + size.y >= height ||
        location.y <= 0){
          screenCrash.play();
          //set start to 2 and show end screen
          screen = 2;
     }
     
     //top pipe collision
     for(int i = 0; i < pipes.pipeX.length; i++){
       if(location.x + size.x >= pipes.pipeX[i] &&
           pipes.pipeX[i] + 50 >= location.x &&
           location.y + size.y >= pipes.pipeY[i] &&
           pipes.pipeY[i] + 300 >= location.y + size.y){
             pipeCrash.play();
             screen = 2;
       }
       //bottom pipe collision
       if(location.x + size.x >= pipes.pipeX[i] &&
           pipes.pipeX[i] + 50 >= location.x &&
           location.y + size.y >= pipes.pipeY[i] + 500 &&
           pipes.pipeY[i] + 800 >= location.y + size.y){
             pipeCrash.play();
             screen = 2;
       }
     }
     
  }
  //collect the coins
  public void collect(PVector[] coin)//this parameter will be the location
  {
    //for each coin
    for(int i = 0; i < coin.length; i++) { 
      //is the location of the bird equal to the coins
      if(location.x + size.x >= coin[i].x -3 &&
         coin[i].x + 50 >= location.x &&
         location.y + size.y >= coin[i].y &&
         coin[i].y + 50 >= location.y + size.y){
           coinCollect.play();
           coin[i].y = -200;
           score++;         
      }
    }
  }
}
public class Coin
{
  
  //attributes
  PImage coin;
  PImage[] coins = new PImage[6];
  PVector[] location = new PVector[6];//6 is the number of x postions for each pipe
  PVector size;
  int count;
  
  //objects
  Pipes pipes;
  Bird bird;
  
  //constructor
  public Coin()
  {
    
    coin = loadImage("data/coin.png");
    size = new PVector();
    count = 0;
    pipes = new Pipes();
    sprite();
    bird = new Bird();
  }
  
  //methods
  //divide the image for animation
  public void sprite()
  {
    for (int i = 0; i < coins.length; i++) {
      coins[i] = coin.get(i*(coin.width/coins.length), 0, 
        (coin.width/coins.length), coin.height); 
      coins[i].resize(50, 100);
    }
  }
  
  //spawn the coins in relation to the pipes
  public void spawn(Pipes pipes)
  {
    //find locations of the pipe
    for(int i = 0; i < pipes.pipeX.length; i++) {
      //set equal to coin location
      location[i] = new PVector(pipes.pipeX[i],pipes.pipeY[i] + (int)random(275,425)); 
    }
  }
  
  //
  public void move(Bird bird,Pipes pipes)
  {
    bird.collect(location);
    animate();
    for(int i = 0; i < coins.length;i++) {
      location[i].x -= 3;
      if (location[i].x < -200){
         location[i] = new PVector(pipes.pipeX[i],pipes.pipeY[i] + (int)random(275,425));
      }
    }
  }
  
  public void animate()
  {    
    //speed of animation
    if(frameCount % 10 == 0 ) {
      if(count < coins.length-1) {
        count++;
      } else {
        //reset animation
        count = 0;
      }
    }
    //show image
    for(int i = 0; i < location.length; i++) {
      image(coins[count],location[i].x,location[i].y);
    }
  }
}
//Dev Viren Vora
//This is for the pipes to show up on the screen and animate it so that they can move along the x axis
public class Pipes
{
  //attributes
  int[] pipeX;
  int[] pipeY;
  PImage topPipe, bottomPipe;

  //constructor
  public Pipes() 
  {   
    topPipe = loadImage("data/topPipe.png"); 
    bottomPipe = loadImage("data/bottomPipe.png");
    pipeX = new int[6];
    pipeY = new int[pipeX.length];
  }

  //methods
  //sets the initial position of the pipes
  public void initialisePipes() 
  {   
    for (int i =0; i<pipeX.length; i++) {
      //To start the pipes off the screen
      pipeX[i] = width + 200 * i;
      //casting value from float to integer
      pipeY[i] = (int)random(-200, 0);
    }
  }

  //draws and moves the pipes
  public void drawPipes() 
  {
    for (int i =0; i<pipeX.length; i++) {
      //draw the pipes
      image(topPipe, pipeX[i], pipeY[i]);
      image(bottomPipe, pipeX[i], pipeY[i]+500);
      topPipe.resize(50,300);
      bottomPipe.resize(50,300);
      
      //Moves the pipes along the X axis
      pipeX[i]-= 3;
      
      //reset the pipes at a random y position within a range
      if (pipeX[i] < -200){
        pipeX[i] = width;
        pipeY[i] = (int)random(-200, 0);
      }
    }
  }
}
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
  public void settings() {  size(960, 544); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Flappy_Bird" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
