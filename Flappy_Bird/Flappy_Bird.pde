//Dev Viren Vora
//Francisco Salazar Andrade
//******************* Flappy Bird**********************//


//for the sounds
import processing.sound.*;
SoundFile flap, coinCollect, pipeCrash, screenCrash;

//to keep score
int score;
//to keep track of which game screen to show
int screen;

//different game screen object
StartScreen ss;
GameScreen gs;
EndScreen es;

void setup() {
  //screen size decided for the game
  size(960, 544);
  
  //initialize objects
  ss = new StartScreen();
  gs = new GameScreen();
  es = new EndScreen();
  
  //initialize global variables
  screen= 0;
  score = 0;
  
  //initialize sound
  flap = new SoundFile(this, "data/sfx_wing.wav");
  coinCollect = new SoundFile(this, "data/sfx_point.wav");
  pipeCrash = new SoundFile(this, "data/sfx_hit.wav");
  screenCrash = new SoundFile(this, "data/sfx_die.wav");
}

void draw() {
  clear();
  //depending on the value of 'screen' something different will run
  switch(screen){
    case 0:
      ss.activateStart();
      break;
    case 1:
      gs.activateGame();
      break;
    case 2:
      es.setEndScreen();
      break;
    default:
      exit();
      break;
  }
}

public void mouseClicked()
{
  es.endChoice();
}
