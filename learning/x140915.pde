// declare variables for position
float x1 = 0.0;
float y1 = 0.0;

// rotation
float rot = 0.0;

// incrementation
float inc = random(0.1);

void setup() {
  // sets up canvas
  size(512, 512);
  background(256);
  // speeds up the drawing
  frameRate(100);
}

void draw() {
  // sets the origin in the center of the canvas
  translate(width/2, height/2);
  // rotates canvas
  rotate(rot);
  // draws a point
  point(x1, y1);

  // increase variables
  x1 = x1 + inc;
  y1 = y1 + inc;
  
  rot = rot + inc;
}