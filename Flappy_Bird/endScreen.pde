class endScreen{

   PVector  posNameEnd, posGameOver, posMenu, posExit;
   PImage bg, name, gameOver, menu, exit;
  
  public endScreen(){
  
    //End Screen
    posNameEnd = new PVector((width/3+100), 100);
    posGameOver = new PVector((width/3+100), 170);
    posMenu = new PVector((width/3+100), 250);
    posExit = new PVector((width/3+150), 250);
    
    //Loading the Images
    bg = loadImage("data/bg.png");
    name = loadImage("data/name.png");
    gameOver = loadImage("data/gameover.png");
    menu = loadImage("data/menu.png");
    exit = loadImage("data/exit.png");
  }
  
  //End Screen
  void setEndScreen() {
    image(bg, 0, 0);
    image(name, posNameEnd.x, posNameEnd.y);
    image(gameOver, posGameOver.x, posGameOver.y);
    image(menu, posMenu.x, posMenu.y); 
    image(exit, posExit.x, posExit.y);
    textSize(24);
    fill(255);
    text("Score: "+score, 10,20);
  }

 void setEndGame() {
   if(mousePressed){
    if (posMenu.x + menu.width >= mouseX &&
      mouseX >= posMenu.x && 
      posMenu.y + menu.height >= mouseY &&
      mouseY >= posMenu.y) {
      
      println("click menu");
    } else if (posExit.x + exit.width >= mouseX &&
      mouseX >= posExit.x && 
      posExit.y + exit.height >= mouseY &&
      mouseY >= posExit.y) {
      start = 3;
    }
  }
 }

}
