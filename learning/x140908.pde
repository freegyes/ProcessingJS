// declare variables
float circle_size = 0;  // sets the initial size
float w = 470;          // sets the initial width

void setup() {
  size(512, 512);       // sets the canvas size
  frameRate(1000);      // speeds up the framerate
  colorMode(HSB);       // sets the color mode to HSB
}


void draw() {

  ellipse(width / 2, height / 2, circle_size, circle_size); // draws a circle in the middle
  circle_size++;                                            // inflates the circle by one pixel

  if (circle_size == w) {         // when the circle size is equal to the set width
   circle_size = 0;               // reset the circle size
   w = w - 10;                    // decrease the set width
   noStroke();                    // remove the stroke
   fill(random(256), 255, 255);   // set a random saturated and bright color
  }

  if (w == 0) {                   // if width reaches zero
    circle_size = 0;              // draw only 0-width circles
  }

}