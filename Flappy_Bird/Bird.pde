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
  //size
  PVector size;

  SetScene sc;

  //constructor
  public Bird(float x, float y, float gravity, int w, int h)
  {
    bird = loadImage("data/flappy_bird.png");

    location = new PVector(x, y);
    size = new PVector(w, h);

    this.gravity = gravity;
    jump =20;
  }

  public Bird()
  {
  }
  //methods
  //activate
  public void activate()
  {
    sprite();
    spawn();
    move();
    collide();
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
    if (key == CODED) {
      if (keyPressed) {
        if (keyCode == UP) {
          jump=-10;
          location.y+=jump;
          image(images[1], location.x, location.y+5);
        }
      } else if (!keyPressed) {
        jump=5;
        location.y+=jump*gravity;
        image(images[2], location.x, location.y-5);
      }
    }
  }
  //collide 
  public void collide()
  {
    //edge collision
    if(location.y + size.y >= height ||
        location.y <= 0){
          //set start to 2 and show end screen
          start = 2;
     }
  }
  //collect
  public void collect()
  {
  }
}
