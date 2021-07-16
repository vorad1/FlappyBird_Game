public class Background
{
  //attributes
  PImage bg;
  PVector bgMove,posBg;

  //constructor
  public Background()
  {
    bg = loadImage("data/bg.png");
    bgMove = new PVector(1,0);
    posBg = new PVector(0,0);
  }

  //methods
  // This is to set the animated background
  void setBg() {
    image(bg, posBg.x, posBg.y);
    image(bg, posBg.x+bg.width, posBg.y);

    // this is to move the the image by 1 unit to show the animation
    posBg.sub(bgMove);
    

    //Resets the image, once the first image is done
    if (posBg.x < -bg.width) {
      posBg.x=0;
    }
  }
}
