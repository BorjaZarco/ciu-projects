class Ball {
  int posX;
  int posY;
  int dirX;
  int dirY;
  int step = 3;
  int radius = 10;
  int limitX;
  int limitY;
  
  Ball(int limitX, int limitY) {
    this.limitX = limitX;
    this.limitY = limitY;
    this.posX = limitX / 2;
    this.posY = limitY / 2;
    this.dirX = (int(round(random(1))) == 0) ? -1 : 1;
    this.dirY = (int(round(random(1))) == 0) ? -1 : 1;
  }
  
  void restart() {
    this.posX = limitX / 2;
    this.posY = limitY / 2;
  }
  
  boolean updatePos(Player rightPlayer, Player leftPlayer) {
    
    int newDirX = calculateHorizontalCollision(rightPlayer, leftPlayer);
    this.dirY *= calculateVerticalCollision();
    if (newDirX == 0) {
      return true;
    }
    this.dirX *= newDirX;
    
    this.posX += this.dirX * this.step;
    this.posY += this.dirY * this.step;
    return false;
  }
  
  void repaint(){
    ellipse(this.posX, this.posY, this.radius * 2, this.radius * 2);
  }
  
  int calculateVerticalCollision() {
    if ((this.dirY < 0 && this.posY <= 0) || (this.dirY > 0 && this.posY + this.radius >= height) ) {
      sound.play();
      return -1;
    } else {
      return 1;
    }
   }
   
   
  int calculateHorizontalCollision(Player rightPlayer, Player leftPlayer) {
    if (dirX > 0) {
      int rightSide = this.posX + this.radius;
      if (rightSide >= width) {
        return 0;
      } else if (rightSide >= rightPlayer.posX && this.posY <= rightPlayer.posY + rightPlayer.rectHeight && this.posY >= rightPlayer.posY) {
        sound.play();
        return -1;
      } else {
        return 1;
      }
    } else if (dirX < 0) {
      if (this.posX < 0) {
        return 0;
      } else if (this.posX <= leftPlayer.posX + leftPlayer.rectWidth + 10 && this.posY <= leftPlayer.posY + leftPlayer.rectHeight && this.posY >= leftPlayer.posY) {
        sound.play();
        return -1;
        
      } else {
        return 1;
      }
    }
    return 1;
    
  }
  
}
