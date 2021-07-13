import java.lang.*;
import processing.video.*;
import cvimage.*;
import org.opencv.core.*;
import processing.sound.*;


import org.opencv.objdetect.CascadeClassifier;
import org.opencv.objdetect.Objdetect;

SoundFile happySound, sadSound;

CascadeClassifier faceDetector, smileDetector;

Capture cam;
CVImage img,auximg;
int mode = 0;

int [] colors = { 0, 0, 1 };
int frames = 0;
int threshold = 7;

void setup() {
  size(640, 480);
  
  happySound = new SoundFile(this, "./data/happy-sound.wav");
  happySound.amp(0.7);
  
  sadSound = new SoundFile(this, "./data/sad-sound.mp3");
  sadSound.amp(0.7);
  
  cam = new Capture(this, width, height);
  cam.start(); 

  System.loadLibrary(Core.NATIVE_LIBRARY_NAME);

  img = new CVImage(cam.width, cam.height);
  auximg=new CVImage(cam.width, cam.height);
  
  println(dataPath("haarcascade_frontalface_default.xml"));
  
  faceDetector = new CascadeClassifier(dataPath("haarcascade_frontalface_default.xml"));
  smileDetector = new CascadeClassifier(dataPath("/haarcascade_smile.xml"));
  sadSound.loop();
  
  
}

void draw() {
  
  int lastMode = mode;
  
  if (cam.available()) {
    background(0);
    cam.read();
    
    img.copy(cam, 0, 0, cam.width, cam.height, 0, 0, img.width, img.height);
    img.copyTo();
    if (mode >= threshold) {
      tint(colors[0] * 255, colors[1] * 255, colors[2] * 255);
      image(img,0,0);
      frames++;
      if(frames == 5) {
        frames = 0;
        colors = new int[]{ (int)Math.round(Math.random()), (int)Math.round(Math.random()), (int)Math.round(Math.random()) };
      }
    } if (mode < threshold) {
      noTint();
      
      img.copyTo();
      Mat grayImg = img.getGrey();
      cpMat2CVImage(grayImg,auximg);
      image(auximg, 0,0);
      grayImg.release();
      
      
      textAlign(CENTER, CENTER);
      textSize(30);
      text("SMILE!!", width/2, height - 20);
      
    }
    Mat auxFace;
    
    Mat grey = img.getGrey();
    MatOfRect faces = new MatOfRect();
    faceDetector.detectMultiScale(grey, faces, 1.15, 3, 
      Objdetect.CASCADE_SCALE_IMAGE, 
      new Size(60, 60), new Size(200, 200));
    Rect [] facesArray = faces.toArray();
    
    if (facesArray.length > 0) {      
      MatOfRect smiles;
      for (Rect face : facesArray) {    
        smiles = new MatOfRect();
        Rect faceRect = new Rect(face.x, face.y, (int)(face.width), (int)(face.height));
        auxFace = new Mat(grey, faceRect);
        
        smileDetector.detectMultiScale(auxFace, smiles, 1.15, 3, 
          Objdetect.CASCADE_SCALE_IMAGE, 
          new Size(60, 60), new Size(200, 200));
        Rect [] smilesArray = smiles.toArray();
        
        if (smilesArray.length > 0) {
          mode = (mode == threshold * 2) ? threshold * 2 : mode + 1 ;
        } else {
          mode = (mode == 0) ? 0 : mode - 1 ;
          
        }
        
        smiles.release();
       }
    } else {
      mode = (mode == threshold * 2) ? threshold * 2 : mode + 1 ;
    }
    
    faces.release();
        
  }
  
  if(lastMode < threshold && mode >= threshold) {
    sadSound.stop();
    happySound.loop();
  }
  if(lastMode >= threshold && mode < threshold) {
    happySound.stop();
    sadSound.loop();
  }
}

//Copia unsigned byte Mat a color CVImage
void  cpMat2CVImage(Mat in_mat,CVImage out_img)
{    
  byte[] data8 = new byte[cam.width*cam.height];
  
  out_img.loadPixels();
  in_mat.get(0, 0, data8);
  
  // Cada columna
  for (int x = 0; x < cam.width; x++) {
    // Cada fila
    for (int y = 0; y < cam.height; y++) {
      // Posición en el vector 1D
      int loc = x + y * cam.width;
      //Conversión del valor a unsigned basado en 
      //https://stackoverflow.com/questions/4266756/can-we-make-unsigned-byte-in-java
      int val = data8[loc] & 0xFF;
      //Copia a CVImage
      out_img.pixels[loc] = color(val);
    }
  }
  out_img.updatePixels();
}


void keyReleased() {
}
