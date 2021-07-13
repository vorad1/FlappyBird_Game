PImage bg;
int bgx,bgy;

void setup(){
  size(960,544);
  bg = loadImage("resources/bg.png");
}
void draw(){
 setBg(); 
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
