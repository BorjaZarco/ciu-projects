/*
import gifAnimation.*;
GifMaker gifFile;
*/
PShape object;
ShapeBuffer shapeBuffer = new ShapeBuffer();
boolean show2D = true;
boolean mouseHold = false;
boolean rotateX = false;
boolean rotateY = false;
boolean ctrlPressed = false;

float rotationX = 0;
int rotationXDirection = 1;
float rotationY = 0;
int rotationYDirection = 1;
Point mousePos;
float zindex;

PFont font;

void setup() {
    size(1000, 700, P3D);
    font = loadFont("Roboto-Regular-48.vlw");
    object = createShape();
    /*
    gifFile = new GifMaker(this, "./assets/autocad-animation.gif");
    gifFile.setRepeat(0);
    */
}

void draw() {
    //gifFile.addFrame();
    background(101, 101, 101); 
    stroke(255);
    if (show2D) {
      textFont(font, 56);
      text("Autocad", width/8 + 10, height/8);
      textFont(font, 24);
      text("Press N to clear the drawing space", width/8 - 60, height/3);
      text("Press DELETE to remove the last point", width/16 - 20, height/3 + 35);
      
      text("ARROW KEYS to rotate the 3D figure", 55, height/2 + 70);
      text("SCROLL to zoom in/out the 3D figure", 50, height/2 + 105);
      text("LEFT CLICK + DRAW to move the 3D figure", 25, height/2 + 140);
      

      
      
      text("Press ENTER to generate the 3D figure", width/16 -10, height - 100);
      
      if (mouseX >= width/2) {
        line(mouseX, mouseY - 10, mouseX, mouseY + 10);
        line(mouseX - 10, mouseY, mouseX + 10, mouseY);
      }
      
      line(width/2, 0, width/2, height);
    
      for (int i = 0; i < shapeBuffer.points.size() - 1; i++) {
        line(shapeBuffer.points.get(i).x, shapeBuffer.points.get(i).y, shapeBuffer.points.get(i+1).x, shapeBuffer.points.get(i+1).y);
      }
      
      if (shapeBuffer.points.size() > 0) {
        line(shapeBuffer.points.get(shapeBuffer.points.size() - 1).x, shapeBuffer.points.get(shapeBuffer.points.size() - 1).y, (mouseX >= width/2) ? mouseX : width/2 , mouseY);
      }
    } else {
      textFont(font, 16);
      text("ARROW KEYS to rotate the 3D figure", 10, 35);
      text("LEFT CLICK + DRAW to move the 3D figure", 10, 65);
      text("SCROLL to zoom in/out the 3D figure", 10, 95);
      textFont(font, 24);
      text("Press ENTER to go back to menu", width/2 + 100 , height - 35);
      object.beginShape(TRIANGLE_STRIP);
      
      object.fill(66,133,244);
      object.stroke(255);
      object.strokeWeight(2);
      
      for (Point p : shapeBuffer.points3D) {
        object.vertex(p.x, p.y, p.z);
      }
      object.endShape();
      
      if (mouseHold) {
        translate(mouseX - mousePos.x, mouseY - mousePos.y);
      }
      translate(0, 0, zindex);
      
      if (rotateX) {
        translate(0, 0);
        object.rotateY(0.012 * rotationXDirection);
      }
      if (rotateY) {
        translate(0, 0);
        object.rotateX(0.012 * rotationYDirection);
      }
      
      shape(object);
      
    }
    
    
}

void keyPressed() {
  
  if ((keyCode == RIGHT)) {
    rotateX = true;
    rotationXDirection = 1;
  }
  if ((keyCode == LEFT)) {
    rotateX = true;
    rotationXDirection = -1;
  }
  if ((keyCode == UP)) {
    rotateY = true;
    rotationYDirection = 1;
  }
  if ((keyCode == DOWN)) {
    rotateY = true;
    rotationYDirection = -1;
  }
 
}

void keyReleased() {
  if (((keyCode == ENTER) || (keyCode == RETURN))) {
    show2D = !show2D;
    if (!show2D) { 
      object = createShape();
      shapeBuffer.create3DFigure(); 
    } else {
      zindex = 0;
    }
  }
 
  if ((keyCode == RIGHT) || keyCode == LEFT) {
    rotateX = false;
    rotationX = 0;
  }
  if ((keyCode == UP) || keyCode == DOWN) {
    rotateY = false;
    rotationY = 0;
  }
  if ((keyCode == CONTROL)) {
    //gifFile.finish();
  }
  
  if (show2D && ((key == 'n') || (key == 'N'))) {
    shapeBuffer = new ShapeBuffer();
  } 
  if (show2D && (keyCode == BACKSPACE)) {
    shapeBuffer.removePoint();
  }
  
}

void mouseClicked() {
  if (show2D) {
    shapeBuffer.addPoint((mouseX < width/2) ? width/2 : mouseX, mouseY);
  }
}

void mousePressed() {
  mouseHold = true;
  mousePos = new Point(float(mouseX), float(mouseY), 0);
}

void mouseReleased() {
  mouseHold = false;
}

void mouseWheel(MouseEvent event) {
  zindex += event.getCount() * 20;
}
