//Dev Viren Vora
//Francisco Salazar Andrade

Bird bird;


//******************* Flappy Bird**********************//

//******************* Bugs Present*********************//
//1. A few of the pipes seem to be hovering around the screen

PImage bg,topPipe, bottomPipe;
int bgx, bgy;

Pipes pipes = new Pipes();

void setup() {
  size(960, 544);
  //Loading the images 
  bg = loadImage("data/bg.png");
  
  bird = new Bird(50,200,1.5,100,100);
  pipes.initialisePipes();
}
void draw(){
 setBg(); 
 bird.activate();

  topPipe = loadImage("data/topPipe.png"); 
  bottomPipe = loadImage("data/bottomPipe.png");

  
  
  pipes.drawPipes();
}


// This is to set the animated background
void setBg() {
  image(bg, bgx, bgy);
  image(bg, bgx+bg.width, bgy);
  // this is to move the the image by 1 unit to show the animation
  bgx = bgx -1;
  //Resets the image, once the first image is done
  if (bgx < -bg.width) {
    bgx=0;
  }
}
