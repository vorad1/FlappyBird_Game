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

  Pipes pipes;
  Coin coin;

  //constructor
  public Bird(float x, float y, int w, int h)
  {
    bird = loadImage("data/flappy_bird.png");
    location = new PVector(x, y);
    size = new PVector(w, h);
    jumping = false;
    
    pipes = new Pipes();
  }

  public Bird() {
  }
  //methods
  //activate
  public void activate()
  {
    sprite();
    spawn();
    move();
    
  }

  //sprite
  public void sprite()
  {
    for (int i = 0; i < images.length; i++) {
      images[i] = bird.get(i*(bird.width/images.length), 0, 
        (bird.width/images.length), bird.height); 
      images[i].resize(int(size.x), int(size.y));
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
          //set start to 2 and show end screen
          start = 2;
     }
     
     //top pipe collision
     for(int i = 0; i < pipes.pipeX.length; i++){
       if(location.x + size.x >= pipes.pipeX[i] &&
           pipes.pipeX[i] + 50 >= location.x &&
           location.y + size.y >= pipes.pipeY[i] &&
           pipes.pipeY[i] + 300 >= location.y + size.y){
            start = 2;
           }
       //bottom pipe collision
       if(location.x + size.x >= pipes.pipeX[i] &&
           pipes.pipeX[i] + 50 >= location.x &&
           location.y + size.y >= pipes.pipeY[i] + 500 &&
           pipes.pipeY[i] + 800 >= location.y + size.y){
            start = 2;
           }
     }
     
  }
  //collect the coins
  public void collect(PVector[] coin)//this parameter will be the location
  {
    for(int i = 0; i < coin.length; i++) { 
      if(location.x + size.x >= coin[i].x &&
         coin[i].x + 50 >= location.x &&
         location.y + size.y >= coin[i].y &&
         coin[i].y + 50 >= location.y + size.y){
           coin[i] = new PVector(200,200);
           println("collect");           
         }
    }
  }
}
