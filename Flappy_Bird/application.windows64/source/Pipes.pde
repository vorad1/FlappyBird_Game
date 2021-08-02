//Dev Viren Vora
//This is for the pipes to show up on the screen and animate it so that they can move along the x axis
public class Pipes
{
  //attributes
  int[] pipeX;
  int[] pipeY;
  PImage topPipe, bottomPipe;

  //constructor
  public Pipes() 
  {   
    topPipe = loadImage("data/topPipe.png"); 
    bottomPipe = loadImage("data/bottomPipe.png");
    pipeX = new int[6];
    pipeY = new int[pipeX.length];
  }

  //methods
  //sets the initial position of the pipes
  public void initialisePipes() 
  {   
    for (int i =0; i<pipeX.length; i++) {
      //To start the pipes off the screen
      pipeX[i] = width + 200 * i;
      //casting value from float to integer
      pipeY[i] = (int)random(-200, 0);
    }
  }

  //draws and moves the pipes
  public void drawPipes() 
  {
    for (int i =0; i<pipeX.length; i++) {
      //draw the pipes
      image(topPipe, pipeX[i], pipeY[i]);
      image(bottomPipe, pipeX[i], pipeY[i]+500);
      topPipe.resize(50,300);
      bottomPipe.resize(50,300);
      
      //Moves the pipes along the X axis
      pipeX[i]-= 3;
      
      //reset the pipes at a random y position within a range
      if (pipeX[i] < -200){
        pipeX[i] = width;
        pipeY[i] = (int)random(-200, 0);
      }
    }
  }
}
