class Game {
  Player p1;
  Player p2;
  Ball ball;
  int mode;
  int seconds;
  
  Game() {
    this.mode = 0;
    this.seconds = 0;
    ball = new Ball(width, height);
    p1 = new Player(height, 730);
    p2 = new Player(height, 10);
  }
  
  void restart() {
    
  }
  
  void repaint() {
    switch(this.mode) {
      case 0: this.paintStart();
              break;
      case 1: this.paintGame();
              break;
      case 2: this.paintPause();
              break;
      case 4: this.paintEnd();
    }
  }
  
  void paintStart() {
    background(0);
    
    textFont(font, 72);
    text("PONG", width/2 - 85, height/4);
    textFont(font, 32);
    text("Player 1:\n\n  a = up\nz = down", 75, height/2);
    text("  Player 2:\n\narrow keys\n (up - down)", width - 250, height/2);
    text("Controls:", width/3 + 50, height/2 - 50);
    text("Press P to pause", width/2 - 125, 3* height/4);
    text("Press enter to start!", width/2 - 165, 3* height/4 + 100);
  }
  
  void paintGame() {
    background(0);
 
    boolean goal = ball.updatePos(p1, p2);
    
    if (goal && ball.dirX > 0) {
      p1.score++;
      if (p1.score == 7) {
        this.mode = 4;
      }
      ball.dirX = (int(round(random(1))) == 0) ? -1 : 1;
      ball.dirY = (int(round(random(1))) == 0) ? -1 : 1;
      ball.posX = width / 2;
      ball.posY = height / 2;
      textFont(font, 72);
      text(p2.score + " - " + p1.score, width/2 - 72, height/4);
      ball.repaint();
      
      p1.updatePos();
      p1.repaint();
      p2.updatePos();
      p2.repaint();
    } else if (goal && ball.dirX < 0) {
      p2.score++;
      if (p2.score == 7) {
        this.mode = 4;
      }
      ball.dirX = (int(round(random(1))) == 0) ? -1 : 1;
      ball.dirY = (int(round(random(1))) == 0) ? -1 : 1;
      ball.posX = width / 2;
      ball.posY = height / 2;
    } else if (!goal) {
      textFont(font, 72);
      text(p2.score + " - " + p1.score, width/2 - 72, height/4);
      ball.repaint();
      
      p1.updatePos();
      p1.repaint();
      p2.updatePos();
      p2.repaint();
    }
  }
  
  void paintPause() {
    background(0);
 
    textFont(font, 72);
    text("Paused", width/2 - 125, height/4);
    textFont(font, 32);
    text("Player 1:\n\n  a = up\nz = down", 75, height/2);
    text("  Player 2:\n\narrow keys\n (up - down)", width - 250, height/2);
    text("Controls:", width/3 + 50, height/2 - 50);
    text("Press spacebar to resume", 160, 3* height/4 + 50);
  }
  
  void paintEnd() {
    background(0);
    textFont(font, 72);
    text(p2.score + " - " + p1.score, width/2 - 72, height/4);
    textFont(font, 72);
    int winner = (p2.score > p1.score) ? 2 : 1;
    text("Player " + winner + " WINS!", width/2 - 225, height/2);
    if (this.seconds >= 120) {
      this.mode = 0;
    } else {
      this.seconds++;
    }
    
  }
  

  
}
