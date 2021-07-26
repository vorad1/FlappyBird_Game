public class Coin
{
  Pipes pipes;
  Bird bird;
  //attributes
  PImage coin;
  PImage[] coins = new PImage[6];
  PVector[] location = new PVector[6];//6 is the number of x postions for each pipe
  PVector size;
  int count;
  
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
 
  
  public void sprite()
  {
    for (int i = 0; i < coins.length; i++) {
      coins[i] = coin.get(i*(coin.width/coins.length), 0, 
        (coin.width/coins.length), coin.height); 
      coins[i].resize(50, 100);
    }
  }
  
  public void spawn(Pipes pipes, Bird bird)
  {
    //find locations of the pipe
    for(int i = 0; i < pipes.pipeX.length; i++) {
      //set equal to coin location
      location[i] = new PVector(pipes.pipeX[i],pipes.pipeY[i] + 350);
      
    }
    //spawn and animate the coin at the different location
    bird.collect(location);
    animate();
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
