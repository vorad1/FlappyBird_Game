//Dev Viren Vora
//This is for the pipes to show up on the screen and animate it so that they can move along the x axis
class Pipes {
  int[] pipeX;
  int[] pipeY;
  PImage topPipe, bottomPipe;
  
  public Pipes(){   
  topPipe = loadImage("data/topPipe.png"); 
  bottomPipe = loadImage("data/bottomPipe.png");
    pipeX = new int[8];
    pipeY = new int[pipeX.length];
  }
  
  void initialisePipes() {   
    for (int i =0; i<pipeX.length; i++) {
      //To start the pipes off the screen
      pipeX[i] = width + 150 * i;
      //casting value from float to integer
      pipeY[i] = (int)random(-50, 50);
    }
  }
  
  void drawPipes() {
    for (int i =0; i<pipeX.length; i++) {
      image(topPipe, pipeX[i], pipeY[i]);
      image(bottomPipe, pipeX[i], pipeY[i]+400);
      //Moves the pipes along the X axis
      pipeX[i]-= 1;
    }
  }
};
