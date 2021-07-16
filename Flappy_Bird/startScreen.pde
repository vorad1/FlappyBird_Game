class StartScreen {

  PVector posName, posPlay;
  PImage bg, name, startGameButton;
  int n = 0;
  
  public StartScreen(){
    posName = new PVector((width/3+100), 200);
    posPlay = new PVector((width/3+120), 300);
    bg = loadImage("data/bg.png");
    name = loadImage("data/name.png");
    startGameButton = loadImage("data/startgamebutton.png");
  }
  
void setStartScreen() {
  image(bg, 0, 0);
  image(name, posName.x,posName.y);
  image(startGameButton, posPlay.x, posPlay.y);
}

void startGame() {
  if (key == CODED) {
    if (keyPressed) {
      if (keyCode == SHIFT) {
        if ((width/3+120) + startGameButton.width >= mouseX &&
          mouseX >= (width/3+120) && 
          300 + startGameButton.height >= mouseY &&
          mouseY >= 300) {
          println("Click Me" + n);
          n++;
        }
      }
    }
  }
}
}
