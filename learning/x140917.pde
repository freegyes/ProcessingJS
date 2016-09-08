// declare variables for rotation
float r = 0.0;

// for sizing
float size_1 = random(40, 190);
float size_2 = random(40, 190);
float size_3 = random(40, 190);

// and for position
float x1 = random(256) + size_1;
float y1 = random(256) + size_1;
float x2 = random(255, 512) - size_2;
float y2 = random(512) - size_2;
float x3 = random(256) + size_3;
float y3 = random(255, 512) - size_3;

// set up canvas
void setup() {
  size(512, 512);
  background(255);
  smooth();
  rectMode(CENTER);
}

// the TRAILING function 
// fills the canvas with an opaque background
// takes two parameters: bg_color and opacity
void trailing(float bg_color, float opacity){
  resetMatrix();    
  noStroke();
  fill(bg_color, opacity);
  rect(width/2, height/2, width, height);   // works when rectMode(CENTER); is set
  rect(0, 0, width, height);                // works when rectMode(CENTER); is not set
}

// the DRAW_RECTANGLE function
// sets a new origin
// rotates the canvas 
// draws a rectangle
void draw_rectangle(float x, float y, float rect_size){
  resetMatrix();
  translate(x, y);
  rotate(r);
  rect(0, 0, rect_size, rect_size);
}

void draw() {
  trailing(255, 10);
  stroke(0);

  // draw three rectangles at given coordinates and size
  draw_rectangle(x1, y1, size_1);
  draw_rectangle(x2, y2, size_2);
  draw_rectangle(x3, y3, size_3);
  
  r++;
}