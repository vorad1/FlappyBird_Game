class gameScreen{
  
  Pipes pipes;
  Bird bird;
  Coin coin;
  
  PVector bgMove,posBg;
  PImage bg;

  public gameScreen(){
    
    //Game Screen
    bgMove = new PVector(1, 0);
    posBg = new PVector(0, 0);
  
   //Loading the Images
    bg = loadImage("data/bg.png");
  
    pipes = new Pipes();
    coin = new Coin();

    bird = new Bird(50, 200, 40, 40);

    pipes.initialisePipes();
    coin.spawn(pipes);
  
  }
  
  void bgMove(){
     background(0);
    image(bg, posBg.x, posBg.y);
    image(bg, posBg.x+bg.width, posBg.y);
    
    // this is to move the the image by 1 unit to show the animation
    posBg.sub(bgMove);


    //Resets the image, once the first image is done
    if (posBg.x < -bg.width) {
      posBg.x=0;
    }
    textSize(24);
    fill(255);
    text("Score: "+score, 10,20);
  }

  void drawObject(){
        pipes.drawPipes();
        bird.activate(); 
        bird.collide(pipes);
        coin.move(bird,pipes);
  
  }

}
