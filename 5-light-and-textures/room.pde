//import gifAnimation.*;
//GifMaker gifFile;

import processing.sound.*;

PFont font;
PImage textureImage;
// SoundFile sound;

Observer observer;
boolean menu = true;
float rotation = 0;

int roomHeight = 500;
int roomWidth = 500;

float lightIntensity = 125;
int selectedLightColor = 4;

float[][] lightColors = {
  {1, 0, 0},
  {0, 1, 0},
  {0, 0, 1},
  {1, 1, 0},
  {1, 1, 1}
};

PShape brick;

void setup() {
    size(1024, 1024, P3D);
    textureImage = loadImage("./data/gotele.jpg");
    //font = loadFont("Roboto-Regular-48.vlw");
    noStroke();
    
    
    observer = new Observer();
    brick = createShape(BOX, 50, 50, 5);
    brick.setTexture(textureImage);
    
    //gifFile = new GifMaker(this, "./assets/gotele-animation.gif");
    //gifFile.setRepeat(0);
    
   
}

void draw() {
    //gifFile.addFrame();
    background(0);
    
    if (menu) {
      translate(width/2, 0);
      textMode(MODEL);
      fill(255);
      textAlign(CENTER, CENTER);
      textSize(50);
      text("LE GOTELÈ", 0, 100);
      textSize(24);
      text("This is a project to appreciate the beauty of one of the most\n remarkable atistics designs in Spanish history: the Gotelé", 0, 200);
      textSize(32);
      text("Instructions:", 0, 350);
      text("Use WASD to move the camera around", 0, 400);
      text("Use LEFT CLICK + DRAG to move the view", 0, 450);
      text("Use QE to change the light intensity", 0, 500);
      text("Use TAB to change the light color", 0, 550);
      
      textSize(50);
      text("Press SPACEBAR to toggle this menu", 0, height - 200);
      
    } else {
      
      lightFalloff(.5, 0, 0.000008);
  
      //spotLight(204, 153, 0, mouseX, mouseY, observer.bodyPos.z - observer.targetPos.z, 0, 0, -1, PI/2, 600) ;
      observer.repaint();
      
      pushMatrix();
      
      translate(observer.bodyPos.x, observer.bodyPos.y, observer.bodyPos.z);
      rotateY(radians(rotation));
      ambientLight(
        lightColors[selectedLightColor][0] * lightIntensity,
        lightColors[selectedLightColor][1] * lightIntensity,
        lightColors[selectedLightColor][2] * lightIntensity
      );
      
      popMatrix();
      
      printRoom();
    }
    
}

void printRoom() {
  // front
  paintWall(roomWidth,roomHeight);
  
  pushMatrix();
  
  // roof
  rotateX(radians(270));
  paintWall(roomWidth,roomHeight);
  
  //floor
  translate(0,0,roomHeight);
  paintWall(roomWidth,roomHeight);
 
  popMatrix();
  
  
  pushMatrix();
  
  
  // left
  rotateY(radians(90));
  paintWall(roomWidth,roomHeight);
  
  //right
  translate(0, 0, roomHeight);
  paintWall(roomWidth,roomHeight);
  popMatrix();
  
  translate(0,0,-roomWidth);
  paintWall(roomWidth,roomHeight);
  
  
}

void paintWall(int x, int y) {
  for (int i = 0; i <= x; i = i + 50) {
    for (int j = 0; j <= y; j = j + 50) {
      pushMatrix();
      translate(i, j, 0);
      shape(brick);
      popMatrix();
    }
  }
}

void keyPressed() { 
  if (!menu && (key == 'W' | key == 'w')) {
    observer.dirZ = 1;
  }
  if (!menu && (key == 'S' | key == 's')) {
    observer.dirZ = - 1;
  }
  if (!menu && (key == 'D' | key == 'd')) {
    observer.dirX = 1;
  }
  if (!menu && (key == 'A' | key == 'a')) {
    observer.dirX = - 1;
  }
  if (!menu && (keyCode == UP)) {
    observer.dirY = -1;
  }
  if (!menu && (keyCode == DOWN)) {
    observer.dirY = 1;
  }
  
}

void keyReleased() {
  if (key == 'W' | key == 'w' || key == 'S' | key == 's') {
    observer.dirZ = (observer.dirZ == 1) ? 0 : observer.dirZ;
  } 
  if (key == 'S' | key == 's') {
    observer.dirZ = (observer.dirZ == -1) ? 0 : observer.dirZ;
  }
  if (key == 'D' | key == 'd' || key == 'A' | key == 'a') {
    observer.dirX = (observer.dirX == 1) ? 0 : observer.dirX;
  }
  if (key == 'A' | key == 'a') {
    observer.dirX = (observer.dirX == -1) ? 0 : observer.dirX;
  }
  if (key == 'E' | key == 'e') {
    lightIntensity = (lightIntensity < 255) ? lightIntensity + 30 : 255;
  }
  if (key == 'Q' | key == 'q') {
    lightIntensity = (lightIntensity > 0) ? lightIntensity - 30 : 0;
  }
  if ((keyCode == TAB)) {
    selectedLightColor = (selectedLightColor < lightColors.length - 1) ? selectedLightColor + 1 : 0;
  }
  if ((key == ' ')) {
    menu = !menu;
  }
  /*
  if ((keyCode == UP)) {
    //observer.dirY = (observer.dirY == -1) ? 0 : observer.dirY;
  }
  if ((keyCode == DOWN)) {
    //observer.dirY = (observer.dirY == 1) ? 0 : observer.dirY;
  }
  if (key == 'I' || key == 'i') {
   
  }
  */
  
}

void mouseMoved() {
}

void mouseClicked() {
}

void mousePressed() {
}

void mouseReleased() {
}

void mouseDragged() {
  
  observer.updateEye(-(pmouseX - mouseX), 0);
  rotation -= (mouseX - pmouseX) * .1;
}

void mouseWheel(MouseEvent event) {
}
