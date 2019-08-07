//Initial variables
//Here's shit you can change without fucking everything up
int partNum = 17500; //Number of particles
float radClick = 20; //Size of the circle when clicked
float radNotClick = 10;
color clickColor = color(255,0,0); //The color of the circle when clicking
color notClickColor = color(255,0,255); //The color of the circle when not clicking
float pr = .75; //Size of the particles

Particle[] part = new Particle[partNum];
float[] origin = {0, 0};
boolean mouse;


float mmx;
float mmy;
float xBorder;
float yBorder;
float mmr;

//Setup
void setup() {
  size(600, 600);
  //You can change these two values. Set one the a negative number to get mouse control
  origin[0]=width/2;
  origin[1]=height/2;
  
  if (origin[0]<0 || origin[1]<0) {
    mouse = true;
  }
  xBorder = width;
  yBorder = height;
  mmx = 0;
  mmy = 0;
  for (int i = 0; i < part.length; i++) {
    part[i] = new Particle();
  }
}

//Draw
void draw() {
  println(frameRate);
  if (mousePressed) {
    fill(clickColor);
    mmr=radClick;
  } else {
    fill(notClickColor);
    mmr = radNotClick;
  }
  background(15); 
  //translate(width/2,height/2);
  if (mouse) {
    mmx=mouseX;
    mmy=mouseY;
  } else {
    mmx=origin[0];
    mmy=origin[1];
  }
  noStroke();
  ellipse(mmx, mmy, mmr, mmr);
  fill(255);
  for (int i = 0; i < part.length; i++) {
    part[i].update();
    part[i].display();
    //part[i].debug();
  }
}
