
// import gifAnimation.*;
// GifMaker gifFile;

PFont font;
PImage backgroundImage;

Star sun;

void setup() {
    size(1024, 1024, P3D);
    backgroundImage = loadImage("./data/stars.jpg");
    //font = loadFont("Roboto-Regular-48.vlw");
    noStroke();
    textSize(32);
    
    sun = new Star("Sun", 100, 1, "./data/sun.jpg"); 
    sun.addPlanet(new Planet("Mercury", 30, 1, 200, 0.12, "./data/mercury.jpg"));
    sun.addPlanet(new Planet("Venus", 40, 0.66, 300, 0.32, "./data/venus.jpg"));
    Planet earth = new Planet("Earth", 50, 0.005, 500, 0.53, "./data/earth.jpg");
    Planet mars = new Planet("Mars", 50, 0.005, 750, 1, "./data/mars.jpg");
    sun.addPlanet(earth); 
    sun.addPlanet(mars);
    
    earth.addSatellite(new Satellite(earth, "Moon", 10, 0.16, 100, 0.039, "./data/moon.jpg"));
    mars.addSatellite(new Satellite(mars, "Moon1", 10, 0.16, 100, 0.2, "./data/moon.jpg"));
    mars.addSatellite(new Satellite(mars, "Moon2", 10, 0.16, 150, 0.59, "./data/moon.jpg"));
    
    // gifFile = new GifMaker(this, "./assets/planetarium-animation.gif");
    // gifFile.setRepeat(0);
    
}

void draw() {
    // gifFile.addFrame();
    background(backgroundImage);
    
    text("The Solar System", 20, height - 50);
    translate(width/2, height/2, 0);
    scale(0.5);
    
    //rotateX(radians(-45));
    
    sun.repaint();
}

void keyPressed() { 
}

void keyReleased() {
}

void mouseClicked() {
}

void mousePressed() {
}

void mouseReleased() {
}

void mouseWheel(MouseEvent event) {
}
