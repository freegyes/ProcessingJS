// declare variables for
float r = 0;    // rotation in radians
float s = 0;    // coordinates in pixels

void setup() {
  size(512, 512);   // set canvas size
  background(0);    // paint it black
  noStroke();       // remove object strokes
  smooth();         // smooth out lines
}

void draw() {
  float i = 0;                                    // set counter
  fill(0, 10);                                    // chooses an opaque fill
  rect(0, 0, width, height);                      // draws a canvas sized rectangle to make the fade out effect
  fill(255);                                      // set the fill to white
  while (i < 100) {                               // for a hundred times
    ellipse(s, s, width/100, height/100);         // draw a circle
    rotate(r);                                    // rotate canvas
    r = r + random(0.5);                          // increase rotation
    s = s + random(0.5);                          // increase position
    i++;                                          // increase counter
  }
}