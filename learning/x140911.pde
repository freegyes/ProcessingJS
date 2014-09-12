void setup() {
  size(512, 512);                                 // set canvas size
  background(0);                                  // fill background
  noStroke();                                     // remove stroke of objects
}

// draws a random sized and coloured circle when called
void draw_circle() {
  int r = random(5,50);                           // choose a random size for the circle
  int x = mouseX;                                 // store mouseX as a variable
  int y = mouseY;                                 // store mouseY as a variable 
  if (random(10)>7) {                             // sometimes
    fill(random(256), random(256), random(256));  // change the fill color
  }
  ellipse(x, y, r, r);                            // every time draw a circle
}

void draw() {
  fill(0, 10);                                    // chooses an opaque fill
  rect(0, 0, width, height);                      // draws a canvas sized rectangle to make the fade out effect
  if (random(10) > 5) {                           // sometimes
    draw_circle();                                // call the draw_circle function
  }
}