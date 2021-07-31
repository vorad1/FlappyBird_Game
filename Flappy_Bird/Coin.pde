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
