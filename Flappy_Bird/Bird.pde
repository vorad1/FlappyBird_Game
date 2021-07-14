public class Bird
{
  //attributes
    //image
  PImage bird;
    //image array for animation
  PImage[] images = new PImage[3];
    //location
  PVector location;
    //jump
  float jump;
    //gravity
  float gravity;
    
    
  //constructor
  public Bird(float x, float y, float jump, float gravity)
  {
    bird = loadImage("data/flappy_bird.png");
    
    location = new PVector(x,y);
    this.jump = jump;
    this.gravity = gravity;
  }
  
  //methods
    //activate
  public void activate()
  {
    sprite();
  }
    //spawn
  public void sprite()
  {
    for(int i = 0; i < images.length; i++){
          images[i] = bird.get(i*(bird.width/images.length),0,
            (bird.width/images.length),bird.height); 
            image(images[i],100*i,0);
    }
    
  }
    //jump
  public void jump()
  {
    
  }
    //collide 
  public void collide()
  {
    
  }
    //collect
  public void collect()
  {
    
  }
    
}
