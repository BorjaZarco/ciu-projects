class Player {
  int posX;
  int posY = 250;
  int dirY;
  int step = 10;
  int rectHeight = 100;
  int rectWidth = 10;
  int limitY;
  int score;
  
  Player(int limitY, int posX) {
    this.limitY = limitY;
    this.posX = posX;
    this.score = 0;
    this.dirY = 0;
    
  }
  
  void updatePos() { 
    if (this.dirY > 0 && this.posY <= height - this.rectHeight - 1) {
      this.posY += dirY * step;
    } else if (dirY < 0 && this.posY > 1) {
      this.posY += dirY * step;
    }
  }
  
  void repaint(){
    rect(this.posX, this.posY, this.rectWidth, this.rectHeight);
  }
}
