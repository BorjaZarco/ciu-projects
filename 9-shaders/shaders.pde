import processing.sound.*;
//import gifAnimation.*;

AudioIn IN;
Amplitude level;

PShader sh, sh2;
int mode;
//GifMaker gifFile;

void setup() {
  size(600, 600, P2D);
  noStroke();
  IN = new AudioIn(this, 0);

  IN.start();
  level = new Amplitude(this);
  level.input(IN);
  sh = loadShader("shader.glsl");
  sh2 = loadShader("shader2.glsl");
  
  //gifFile = new GifMaker(this, "./assets/shaders.gif");
  //gifFile.setRepeat(0);
}


void draw() {
  //gifFile.addFrame();
  if (mode == 1) {
    float volume = level.analyze() + 0.1;
  
    sh.set("u_resolution", float(width), float(height));
    sh.set("u_volume", volume);
    shader(sh);
    rect(0,0,width,height);
  } else if (mode == 2) {
    sh2.set("u_resolution", float(width), float(height));
    sh2.set("u_time", millis() / 1000.0);
    shader(sh2);
    rect(0,0,width,height);  
  } else {
    resetShader();
    background(0);
    translate(width/2, 0);
    textMode(MODEL);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(50);
    text("SHADERS", 0, 100);
    textSize(32);
    text("1 - Cortana (Volume detector)", 0, 200);
    text("2 - Positive hypnosis", 0, 250);   
    textSize(30);
    text("Press SPACEBAR to change shaders", 0, height - 200);
  }
}

void keyReleased() {
  if ((key == ' ')) {
    mode = (mode >= 2) ? 0 : mode + 1;
  }
  
}
