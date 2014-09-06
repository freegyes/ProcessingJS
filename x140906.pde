float x = 0;

void setup() {
  size(512, 512); // sets the canvas size
  frameRate(30); // sets the fps
  background(122, 60); // sets the background
  noStroke(); // disables the stroke of objects
  rectMode(CENTER); // changes the origin of the rectangle
}

void draw() {
  if (random(10) > 9) {                                 // sometimes
    fill(random(256), random(256), random(256));        // change the fill to random
  }

  rect(256, x, 150, 150); // draws a rectangle to move down
  rect(x, 256, 150, 150); // draws a rectangle to move right
  x = x + 1; // moves the objects by one pixel

  fill(0); // sets the fill black
  rect(256, 256, 150, 150); // draws a rectangle in the center
  fill(122, 60); // sets the fill to match the background
}