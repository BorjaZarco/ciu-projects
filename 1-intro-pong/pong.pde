import processing.sound.*;
// import gifAnimation.*;

Game game = new Game();
PFont font;
SoundFile sound;
// GifMaker gifFile;

void setup() {
  size(750, 650);
  background(0);
  stroke(255,255,255);
  fill(255,255,255);
  font = loadFont("Hooge0555-48.vlw");
  sound = new SoundFile(this, "./sound/pong-sound.wav");
  //gifFile = new GifMaker(this, "./assets/pong-animation.gif");
  //gifFile.setRepeat(0);
}

void draw() {
  game.repaint();
  //gifFile.addFrame();
}



void keyPressed() {
  if (game.mode == 1) {
    if (keyCode == UP) {
      game.p1.dirY = -1;
    } else if (keyCode == DOWN) {
      game.p1.dirY = 1;
    } 
    if ((key == 'a') || (key == 'A')) {
      game.p2.dirY = -1;
    } else if ((key == 'z') || (key == 'Z')) {
      game.p2.dirY = 1;
    }
  }
}

void keyReleased() {
  if (game.mode == 0 && ((keyCode == ENTER) || (keyCode == RETURN))) {
    game = new Game();
    game.mode = 1;
    game.repaint();
    return;
  }
  
  if (game.mode == 1) {
    if ((key == 'p') || (key == 'P')) {
      game.mode = 2;
      game.repaint();
      return;
    }
    if (keyCode == UP || keyCode == DOWN) {
      game.p1.dirY = 0;
    }
    if ((key == 'a') || (key == 'A') || (key == 'z') || (key == 'Z')) {
      game.p2.dirY = 0;
    }
    return;
    
  }
  
  if(game.mode == 2 && ((key == 'p') || (key == 'P') || (keyCode == ' '))) {
    game.mode = 1;
    game.repaint();
    return;
  } 
}

void mousePressed() {
  //gifFile.finish();
}
