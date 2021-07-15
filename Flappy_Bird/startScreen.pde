class StartScreen{
 
  void setStartScreen(){
    image(bg, bgx, bgy);
    fill(0);
    text("Flappy Bird",width/2-60,height/2-60);
    
    fill(150);
    rect(width/2-50,height/2-20,40,100);
    fill(0);
    text("Play",width/2-50,height/2+20);  
  }
 
}
