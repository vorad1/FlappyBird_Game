//Dev Viren Vora
//Francisco Salazar Andrade
PImage bg;
int bgx,bgy;
Bird bird;

void setup(){
  size(960,544);
  bg = loadImage("data/bg.png");
  
  bird = new Bird(50,200,1.5,100,100);
}
void draw(){
 setBg(); 
 bird.activate();
}

// This is to set the animated background
void setBg(){
  image(bg,bgx,bgy);
  image(bg,bgx+bg.width,bgy);
  // this is to move the the image by 1 unit to show the animation
  bgx = bgx -1;
  //Resets the image, once the first image is done
  if(bgx < -bg.width){
  bgx=0;
  }
}
